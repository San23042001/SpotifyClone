Flutter Clean Architecture for Spotify Clone
Overview

This Flutter project implements Clean Architecture principles tailored for a Spotify clone. It focuses on separation of concerns, testability, and scalability using modern Flutter libraries and tools.

Features
1.Clean Architecture Layers: Separation into presentation, domain, and data layers.
2.Auto Route: Type-safe routing system using auto_route package.
3.Flutter Gen: Code generation for assets management with flutter_gen.
4.Flutter Native Splash: Custom splash screens with smooth transitions.
5.Dartz: Functional programming concepts for handling failures.
6.Service Locator / GetIt: Dependency Injection to manage service instances.
7.Cubit for State Management: Efficient state management using Cubit.

Structure
lib/
core/: Essential classes and utilities.
data/: Data sources, repositories, and external API integrations.
domain/: Business logic, entities, and use cases.
presentation/: UI layer, including screens, widgets, and state management using Cubit.