---
layout: default
title: Reference Platform & Applications
permalink: /working-groups/reference-platform/
---

## Reference Platform & Applications Working Group

**Coordinator:** Franco Cipollone (Ekumen)

## Overview

This group makes the initiative's work tangible.
The other working groups write specifications and libraries; this is where they have to work together on a real robot, which is what keeps the effort from becoming a set of disconnected design documents.
The result is an integrated, reproducible reference stack that anyone can clone and run, in simulation or on hardware.

## Scope

### Reference Applications

Build and maintain [`ros-physical-ai/demos`](https://github.com/ros-physical-ai/demos), an integrated, reproducible reference stack that ties the SIG's outputs together on accessible hardware.
The current showcase runs on the SO-ARM101, a low-cost educational arm, using a combined ROS and LeRobot approach.
The plan is to grow this into a family of reference applications at increasing levels of capability and complexity, from the educational arm toward industrial-grade manipulators, mobile manipulators, and eventually other embodiments such as legged robots and humanoids.
Each new application raises the bar for the rest of the SIG's work, since an embodiment that is harder to control, or that moves more data, exposes the gaps the specifications still have to close.

### End-to-End Learning Pipeline

Demonstrate the full loop as a single workflow: leader-arm teleoperation to record demonstrations, data collection through the [Rosetta](https://github.com/iblnkn/rosetta) ROS 2 to LeRobot bridge, policy training, and on-robot inference.
The same commands run in Gazebo, in MuJoCo, or on real hardware.
The reference policies demonstrate that the pipeline works end to end; they are not a claim about state-of-the-art manipulation.

### Integration Point for the Other Working Groups

Serve as the place where work from the rest of the SIG gets integrated and validated on a real system, including transport improvements (native buffer support, REP-0157), policy execution through `ros2_control` and standalone inference nodes, scene and embodiment descriptions (REP-0158), and agentic interfaces such as the ROS MCP server.

### Simulation Resources

Provide examples that run in simulation so the stack is usable without hardware, currently Gazebo and MuJoCo (via `mujoco_ros2_control`), with first-class interoperability with the simulators the AI community already uses, such as Isaac Sim.

### Community Engagement & Outreach

Lower the barrier to entry and grow the user base through tutorials, hackathons, and community events.
A low-friction on-ramp is published alongside the stack: pre-recorded rosbags, a converted LeRobot dataset, and a trained checkpoint on the Hugging Face Hub, so a policy can be run in Gazebo in minutes without recording or training anything first.

## Roadmap

### Long-term Vision

Maintain a family of reference applications at increasing levels of capability and complexity, so that every layer of the Physical AI stack has a place where it is exercised end to end on a real robot:

- An educational robot (the SO-ARM101)
- An industrial-grade robot arm manipulator
- A mobile manipulator
- Other embodiments beyond that, such as legged robots and humanoids

Each application doubles as the integration and validation target for the standards, interfaces, and libraries produced by the other working groups.

### Current Priorities

**In Progress**

* Grow the reference stack from a single application toward a family of embodiments.
* Maintain the SO-ARM101 record, train, and deploy showcase across Gazebo, MuJoCo, and real hardware.
* Evolve the data collection path beyond LeRobot, with plug-and-play modules for online and offline collection and processing.
* Integrate inference and transport work from the other working groups as it lands.
* Keep the quick-start on-ramp current: published rosbags, datasets, and checkpoints that run without hardware.

### Upcoming Milestones

**More Production-Grade Applications**

* An industrial-grade example, inspired by the AI for Industry Challenge hosted by Intrinsic and Open Robotics.
* A dual-arm setup on a mobile base, which also serves to stress the transport work.
* Expansion to other embodiments, including legged robots and humanoids.

**New Workflows**

* Extend past imitation learning into reinforcement learning workflows, composing learned policies with the classical stack (for example Nav2 and behavior trees) rather than replacing it.
* Higher-level reasoning on the platform, with the ROS MCP server as one direction.

**Accessibility**

* Easy-to-configure projects, for example via Pixi and RoboStack.
* First-class interoperability with the simulators the AI community already lives in, such as MuJoCo and Isaac Sim.

## Interested Members

- Franco Cipollone (Ekumen) – Coordinator
- Yadunund Vijay (Field AI)
- Sebastian Castro (Respite Robotics)
- Leonardo Rossetti (Red Hat)
- Anh Vu Vu (Huawei)
- Tom Counihan (Intel)
- Rohit John Varghese (Contoro Inc)
- Karsten Patzwaldt (NVIDIA)
- Peng Xu (Google DeepMind)
- Zeming Zhao (Sharpa)
- Hemal Shah (NVIDIA)
- Adam Dabrowski (Robotec.ai)
- Julia Jia (OSS contributor)

## How to Contribute

Interested in contributing to the Reference Platform & Applications working group?
Here's how to get started:

1. Review the roadmap and current priorities above
2. Clone [`ros-physical-ai/demos`](https://github.com/ros-physical-ai/demos) and run the quick start in simulation
3. Check the [How to Contribute](/contribute/) page for onboarding information
4. Reach out to the coordinator or attend bi-weekly SIG meetings
5. Join the `#TGC SIG PAI Reference Platform` channel on Open Robotics' Zulip
