# Policy-Based Control Support in ros2_control

Last updated: February, 2026

Authors: Julia Jia, Jennifer Buehler, Sai Kishor Kothakota

## Overview

This proposal addresses the integration of AI/ML model inference with ros2_control to support robotics applications requiring policy-based control. The design synthesizes requirements from multiple organizations working on Physical AI robotics integration.

## Problem Statement

This proposal is based on requirements gathered from multiple organizations across different industries, including automotive manufacturers, AI research laboratories, robotics companies, and academic institutions. To preserve privacy and confidentiality, organizations are referenced using anonymized identifiers (Company_D, Company_B, Company_E, Company_N, Company_R, Company_O) throughout this document.

Desirable features for AI/ML integration:

- Support for tensor datatypes (images, tactile sensing, force)
- Enhanced multi-rate support between control (50-1000Hz) and inference (5-50Hz)
- Standardized interfaces for external inference services
- Improved observation aggregation and time synchronization
- Better alignment between Python training environments and ROS deployment

## Requirements

Priority is assigned based on two factors: (1) how commonly the feature is requested across organizations, and (2) the implementation complexity for developers without ros2_control expertise.

- Priority 1 indicates the most recommended features that are both commonly needed and difficult to implement correctly without ros2_control support.
- Priority 2 indicates nice-to-have features that are either less common or can be reasonably implemented as alternative solutions.

| Priority | Requirement | Description | ros2_control support | alternatives |
|----------|-------------|-------------|----------------------|-------------|
| 1 | Multi-rate support | 50-1000Hz control loop with 5-50Hz inference integration, automatic interpolation/upsampling | Built-in interpolation/upsampling in controllers for deterministic timing | Separate interpolation node publishing at control rate |
| 1 | Observation aggregation | Multi-sensor time sync, configurable downsampling, state broadcaster (inspired by, or using, [state_interfaces_broadcaster](https://github.com/ros-controls/ros2_controllers/tree/master/state_interfaces_broadcaster)) | State broadcaster with time synchronization and able to sync other sensor data like camera | Separate synchronization nodes using message_filters |
| 1 | External inference support | ROS service interface, optional gRPC/HTTP adapters, timeout and error handling | Controller interfaces for calling external inference services with timeout/error handling | Custom ROS service clients in separate nodes |
| 1 | Action post-processing | Denormalization utilities, scaling, offset application, safety constraints | Built-in utilities in controller framework for action transformation | Post-processing in separate modules before forwarding commands to controller (or) pluginlib approach |
| 1 | Debugging infrastructure | Observation injection, multi-stage debug publishing, validation tools | Built-in observation injection and debug topic publishing in controllers | External debugging tools and custom injection services |
| 2 | Data collection mode | Episode management, standard formats (rosetta, HDF5, rosbag), metadata capture | First-class data collection mode with episode management and standard formats | External data collection tools and custom logging nodes |
| 2 | Tensor datatypes | Optional tensor support in state/command interfaces, framework-agnostic representation | Tensor state/command interfaces with framework-agnostic representation | Custom message types and conversion utilities |
| 2 | Advanced controllers | Cartesian space control, impedance control, chunk-aware controllers | Controllers for cartesian space, impedance control, and chunk-aware execution | Custom controller implementations |

### Other Requirements (For Reference)

The following items were mentioned during requirements gathering but are not ros2_control asks.

| Priority | Requirement | Description | ros2_control support | alternatives |
|----------|-------------|-------------|----------------------|-------------|
| 2 | High-level abstractions | Base classes for common patterns, example implementations | Not a ros2_control ask | Separate ROS packages with base classes |
| 2 | Simulation validation | Sim-to-ROS comparison tools, timing verification | Not a ros2_control ask | External validation tools |
| 2 | Network distribution | Remote inference support, network failure handling | Not a ros2_control ask | gRPC/HTTP adapters as separate packages |
| 2 | Multiple backend support | ONNX runtime, TensorRT, PyTorch/JAX inference | Not a ros2_control ask | Framework-specific inference packages |

## Architecture

### Two Modes for Policy Support

The proposed architecture supports two distinct modes for integrating policy inference with ros2_control:

#### Mode 1: In-Controller Inference

- Policy inference runs directly within the ros2_control controller
- Suitable for small, fast models (e.g., MLP policies, ONNX runtime)
- Low latency, deterministic timing within control loop
- Example: ONNX-based controller with observation formatting and action post-processing

#### Mode 2: External Inference Node + Controller

- Policy inference runs in a separate node/process
- Controller receives inference actions via ROS topics, ROS service, gRPC, or HTTP
- Inference node is responsible for gathering its own observations (e.g. subscribing to various topics and processing them)
- Suitable for large models (e.g., VLAs, vision-language models)
- Flexible deployment — inference can run on different hardware
- Controller handles multi-rate interpolation/upsampling of actions

#### Mode 3: Mode 2 + Observation Preprocessing in ros2_control

Everything in Mode 2, plus:

- A ros2_control plugin pre-processes and reformats state interface data (e.g. joint states, sensor readings) into observation topics consumed by the inference node
- The inference node no longer needs to gather or reformat raw observations itself

This is useful when observation formatting depends on ros2_control-internal data (state interfaces) that is not otherwise published, or when consistent preprocessing (normalization, downsampling, synchronization) should be handled closer to the control loop.

The intention of these modes is to let users choose based on model size, latency requirements, and deployment constraints.

### ros2_control Components

The proposed architecture focuses on extending ros2_control to support model inference. The following components would be added or enhanced within ros2_control:

```text
┌─────────────────────────────────────────────────────────┐
│              External Application Layer                 │
│    (Inference Nodes, Policy Servers, User Code)         │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│              ros2_control Extensions                    │
│  ┌──────────────────────────────────────────────────┐   │
│  │  Controllers with Inference Support              │   │
│  │  - Multi-rate interpolation/upsampling           │   │
│  │  - Action post-processing (denormalization, etc) │   │
│  │  - In-controller inference (ONNX)                │   │
│  └──────────────────────────────────────────────────┘   │
│  ┌──────────────────────────────────────────────────┐   │
│  │  State Interfaces Broadcaster (?)                │   │
│  │  - Multi-sensor time synchronization             │   │
│  │  - Configurable downsampling                     │   │
│  │  - Observation aggregation                       │   │
│  └──────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│              Existing ros2_control Core                 │
│  - Hardware Interface (50-1000Hz Deterministic)         │
│  - Controller Manager                                   │
│  - Resource Manager                                     │
└─────────────────────────────────────────────────────────┘
```

## Use Case Analysis

| Organization | Architecture Approach | Technical Approach | Control Freq | Inference Freq |
|--------------|----------------------|---------------------|--------------|----------------|
| **Company_D** | Process separation | External model server via gRPC/HTTP | 50Hz | 5Hz |
| **Company_BE** | Multi-rate control | 250Hz C++ + Python layers | 250Hz | 10-20Hz |
| **Company_N** | Performance | First-class tensor support in ros2_control state/command interfaces for GPU efficiency and zero-copy operations | Not specified | Not specified |
| **Company_R** | Software structure | High-level base classes (ObservationBase, InferenceBase, ActionBase); no direct ros2_control requirement, can be separate packages | Not specified | Not specified |
| **Company_O** | Practical deployment | End-to-end ONNX pipeline in controller (observation formatting → ONNX inference → action post-processing) | 50Hz | Policy-dependent |

## Feature List (tentative)

This section lists the proposed features organized by priority. Priority 1 features are the most commonly requested and difficult to implement without ros2_control expertise. Priority 2 features are either less common or can be reasonably implemented as alternative solutions.

### Priority 1: Most Commonly Asked

| Category | Name | Description | Timeline | Driver/Owner | Notes |
|----------|------|-------------|---------|---------------|-------|
| foundation | Multi-rate support in controllers | Built-in interpolation/upsampling for deterministic timing between control and inference frequencies | | | |
| foundation | Observation aggregation utilities | State interface broadcaster with time synchronization and downsampling capabilities | | | |
| foundation | Debug publishing framework | Built-in observation injection and debug topic publishing in controllers | | | |
| integration | External inference interfaces | ROS service, gRPC, HTTP adapters for calling external inference services | | | |
| integration | Action chunk controllers | Controllers for stepping through and interpolating action chunks | | | |

### Priority 2: Nice to Have

| Category | Name | Description | Timeline | Driver/Owner | Notes |
|----------|------|-------------|---------|---------------|-------|
| foundation | Basic tensor datatypes | Tensor state/command interfaces with framework-agnostic representation | | | |
| integration | Data collection mode | First-class data collection mode with episode management and standard formats | | | |
| ecosystem | Example projects | Reference implementations demonstrating the architecture | | | |
| ecosystem | Advanced controllers | Cartesian space control, impedance control, chunk-aware controllers | | | |
| ecosystem | Comprehensive documentation | Documentation showing patterns and best practices | | | |
