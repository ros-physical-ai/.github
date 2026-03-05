---
layout: default
title: Standardized Interfaces & Messages
permalink: /working-groups/standardized-interfaces/
---

## Standardized Interfaces & Messages Working Group

**Coordinator:** Michel Hidalgo (Ekumen)

## Overview

This group defines the common language and contracts for the ecosystem, ensuring all components are interoperable and reusable.

## Scope

### Standard Robot Interfaces

Define the fundamental APIs for interacting with robot hardware, including low-level sensors and actuators as well as high-level motion planning and control.

* **Message and Pattern Standardization:** Create formal definitions for fundamental message types and structured patterns for synchronized observation packets. This includes establishing standardized message and service sets for a comprehensive robot taxonomy, covering manipulators, mobile platforms, and legged systems.
* **Standardized Descriptions:** Define interoperable, machine-readable descriptions of robots (extending URDF with "model card" data), environments (scene graphs), and capabilities.
* **Canonical Designs:** Develop canonical setups (topic types, namespaces, node arrangements) derived from reference applications to promote consistent layouts across simulations and deployments.

### AI Data Representation

Standardize the full lifecycle of ML data, defining the message format for real-time communication and the file format for offline data collection.

* **Native Tensor Support:** Introduce optimized, accelerator-aware data structures for tensor-based operations within ROS 2.
* **High-Performance Transport:** Research and implement improved serialization formats and zero-copy/shared-memory communication for high-bandwidth exchange.
* **Pipeline Alignment:** Ensure message schemas and topic definitions align with data collection pipelines to ensure compatibility with standardized ROS messages.

### Model Deployment APIs

Specify the standard interfaces for deploying and interacting with a trained policy, defining how the system requests inference from a running AI model.

* **Capability and Task Specification:** Define standard interfaces for robot skills (inputs, outputs, behaviors) and schemas for describing tasks with conditions, goals, and success metrics.
* **Introspection and Schema APIs:** Provide runtime APIs for generic tools to operate on message types without compile-time dependencies, facilitating flexible policy execution.
* **Policy Formats:** Define clear policy input/output formats to ensure that standardized interfaces support policy execution with minimal adaptation.

## Roadmap

### Long-term Vision

The group is dedicated to developing a set of interfaces, descriptions, and design guidelines that can sustain federated development of Physical AI applications in ROS. We achieve this in close collaboration with the other working groups, iterating and validating proposals against reference implementations and applications to ensure the ecosystem can operate cohesively.

### Current Priorities

**Foundational Work**

* Publish technical proposals for improved performance transport (e.g. tensors).
* Draft embodiment, environment, and capability description formats.
* Destille canonical setups from reference applications.

### Upcoming Milestones

**Core Implementations**

* Release stable embodiment description specification and conversion tools.
* Release reference implementations for improved performance transport.
* Publish canonical setups along each reference application.

## Interested Members

- Bence Magyar
- Benjamin Perseghetti
- Chen Bainian (ARTC)
- CY Chen (Nvidia)
- Daniel Gordon (Huawei)
- Karsten Patzwaldt (Nvidia)
- Michel Hidalgo (Ekumen)
- Olmer Garcia Bedoya (Ekumen)
- Tully Foote (Intrinsic)
- Ussama Naal (Ouster)
- Yuheng Kuang (Google Deepmind)

## How to Contribute

Join us on [Zulip](https://openrobotics.zulipchat.com)! We also meet [Thursdays @ 3pm UTC every two weeks](https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NGYxOTRoZDFkc29lczEzYW9jZnE1MzRpMjBfMjAyNjAyMDVUMTUwMDAwWiBtaWNoZWxAY3JlYXRpdmE3Ny5jb20uYXI&tmsrc=michel%40creativa77.com.ar&scp=ALL).