---
layout: default
title: Embodied Agentic AI
permalink: /working-groups/embodied-agentic-ai/
---

## Embodied Agentic AI Working Group

**Coordinator:** Adam Dabrowski (Robotec.ai)

## Overview

Develop standards, best practices and reference applications for flexible skill composition, where reasoning models (LLMs, VLMs) orchestrate state of the art (e.g. navigation, manipulation packages) and learned policies through tool use.
This is a meta-approach in that it incorporates other methods, triggers skills in the right context, expands upon existing robot stacks, and can serve as a framework for supervised learning.

## Scope

### Standardized Skill Composition & Tool Use
*   **Interoperability:** Standardize how ROS 2 Actions, Services, and Topics are exposed as "tools" to reasoning models (LLMs/VLMs).
*   **Human-Robot Interaction:** Coordinate with WG1 standardization to integrate human-robot interaction skills (e.g.,[ROS 4 HRI Skills](https://ros4hri.github.io/skills/)).
*   **Context:** Standardize how agents share memory, history, intent, and environmental state (e.g. with Agent Context Protocol for ROS).

### Open-Source Framework

Inform, evaluate, use or contribute to open-source embodied AI frameworks. We will utilize [RAI](https://github.com/RobotecAI/rai) framework as a reference implementation.

### Connect to Embodied AI Community
Connect to the [Embodied AI Community Group](https://github.com/ros-wg-embodied-ai) and associated initiatives such as [awesome-embodied-ai-ros](https://github.com/ros-wg-embodied-ai/awesome-embodied-ai-ros). The group will welcome presentations about new SIG initiatives and serve as a bridge to  spread awareness about Agentic AI capabilities in robotics.

### Foundation Model Fine-Tuning & Benchmarks

- Advance fine-tuning of compact foundation models for embodiment and specific robotic domains.
- Establish standard pipelines to capture tool-use logs, reasoning traces, and success metrics.
- Integrate and build benchmarks for embodied reasoning, tool use and base tasks (e.g. manipulation, navigation, human-robot interaction).

### On-Board Deployment

Deployment of agentic AI fully on board - optimizing for compute. Identify suitable platforms accross the vendor spectrum and draft guidelines for deployment, compute and memory use, and adaptation to heterogeneous compute (e.g. CPU, GPU, NPU, FPGA).

## Roadmap

### Long-term Vision

To establish Agentic AI not as a replacement for the robotics stack, but as a universally adopted orchestration layer. This meta-approach will enable robots to dynamically compose deterministic packages and learned reactive policies, while continuously feeding structured interaction data back into fine-tuning pipelines to create smaller, faster, and smarter on-board models. 

### Current Priorities

1. **Community Alignment**: Set up recurring meetings and gather ideas from all the participants, assign initial tasks.
2. **Awareness**: Grow awareness of agentic AI and existing solutions (e.g. RAI) in the ROS community. 
3. **Tool Use Schemas:** Draft the initial specification for defining ROS-to-Agent tool interfaces.
4. **Agent Context:** Investigate the integration of the Agent Context Protocol into ROS ecosystems.

### Upcoming Milestones

* **April 2026** Finalize WG goals, establish the bi-weekly meeting cadence, and have members review existing frameworks (e.g., RAI).
* **June 2026** Publish the first draft standard for ROS Agent Tooling and Context Management.
* **August 2026:** Collaborate with WP4 (Demo Group) to deploy a reference application onto a physical platform and / or simulator. Note: a comprehensive demo is available, but the goal is to have a simpler setup that works across simulators (2-3 simulators, e.g. Gazebo, O3DE, Mujoco) and on a robotic platform as well.

## Interested Members

1. Adam Dabrowski
2. Julia Jia
3. Leonardo Rosetti
4. Todd Sutton

If you are interested in joining, please add your name via a PR or reach out to the coordinator during our syncs


## How to Contribute

1. **Join the Bi-Weekly Meetings**
2. **Contribute to the Proposal:** We encourage all participants to suggest edits, refine the roadmap, and help establish our action points.
3. **Review Existing Frameworks:** Look into open-source agent frameworks like [RAI](https://github.com/RobotecAI/rai) to familiarize yourself with current state-of-the-art implementations.
4. **Draft Standards:** Contribute to the ongoing formulation of tool-use schemas and the Agent Context Protocol.
5. **Build Reference Apps:** Help integrate the meta-approach with the WP4 demo group by contributing code, testing on simulators, or deploying on hardware.
