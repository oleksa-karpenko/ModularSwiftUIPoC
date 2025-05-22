# Modular SwiftUI PoC

This project is a Proof of Concept for building **modular SwiftUI applications** using Swift Package Manager (SPM). It demonstrates practical patterns in **feature-based modularization**, **testing**, and **code quality tooling** like **SwiftLint** and **SwiftFormat**.

---

## 💡 Goal

Explore **modular iOS app architecture** with SPM and evaluate different strategies for structuring scalable Swift projects.

---

## 🧱 Modularity

This project evaluates two different modularization strategies:

### 1. True Multi-Module Setup (separate repos & versions)
Modules are developed in **separate Git repositories** as independent Swift packages.  
✅ Useful for **large-scale projects** and **module reuse across apps**.

### 2. Monorepo Multi-Module Setup (✅ current approach)
All modules live in the **same repository**, each inside the `/Core` folder as a local Swift package.  
✅ Great for large, fast-moving teams where unified versioning is a plus.

---

### 📦 Core Modules (`/Core/Package.swift`)

The project defines 3 reusable feature modules:

| Module        | Description                                                                 |
|---------------|-----------------------------------------------------------------------------|
| `ChartFeature`| Contains SwiftUI views for rendering charts                                 |
| `TaskFeature` | Provides task list UI with toggle (done/undone) functionality               |
| `DesignSystem`| Shared typography, fonts, and appearance styles used across all features    |

Each module is **independent and loosely coupled**, designed to be changed in isolation and easily testable.

---

### 🧩 App Composition (`/App`)

The `App` target is the main bundle and integrates feature modules. It wires:

- `TaskFeature` + `ChartFeature` together
- Injects shared `DesignSystem`
- Includes non-feature components like `SideMenu` directly (tied closely to the app shell)

> 💡 DesignSystem is **used by both features**, but they do **not** depend on each other — enabling parallel development.

---

## ✅ Testing

The project includes **multiple test strategies**:

| Type                | Tools Used                                                                 |
|---------------------|----------------------------------------------------------------------------|
| Unit Tests          | [Swift Testing](https://github.com/apple/swift-testing) (modern Swift-native alternative to XCTest) |
| Snapshot Tests      | [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing) by PointFree |
| Planned             | [ViewInspector](https://github.com/nalexn/ViewInspector) for SwiftUI introspection |

Each module (`TaskFeature`, `ChartFeature`, `DesignSystem`) has **its own test target**, and the main app bundle has **integration tests** that validate how components work together.

> 📈 Current test coverage: **97%**

---

## 🎨 Linting & Formatting

This project uses:

- **[SwiftLint](https://github.com/realm/SwiftLint)** for code style enforcement
- **[SwiftFormat](https://github.com/nicklockwood/SwiftFormat)** for auto-formatting

> ⚠️ **SwiftLint caveat**  
While setting up SwiftLint, I ran into **every possible pitfall** — especially related to:
- Xcode sandboxing
- `.swiftlint.yml` permissions
- macOS file system quirks (M1/M2 chip compatibility)

📚 **Recommendation:** Read the [SwiftLint setup documentation](https://realm.github.io/SwiftLint/) carefully — it has solutions to most issues, even with recent Swift/Xcode versions.

---

## 🚀 How to Run

```bash
brew install swiftlint swiftformat
swiftlint
swiftformat .
```

Or just open `TaskTracker.xcodeproj` and build the app or run tests via `Cmd+U`.

---

## 📁 Structure

```
packages.monorep.poc/
├── Core/                 # Local Swift package with all feature modules
│   ├── ChartFeature/
│   ├── TaskFeature/
│   └── DesignSystem/
├── App/                  # Main application bundle
├── .swiftlint.yml
├── .swiftformat
└── TaskTracker.xcodeproj
```

---

## 📈 Code Coverage

> Achieved **97% coverage** using Swift Testing + Snapshot Testing  
Each module has focused unit tests and contributes to the overall integration quality of the app.

---

## ✅ Summary

This PoC demonstrates a **clean and scalable architecture** for SwiftUI projects with:

- 🧱 Modular packages via SPM
- ✅ Unit & Snapshot testing
- 🎨 Enforced code quality with linting/formatting
- 💡 Support for scaling into enterprise-level apps

---

## 📬 Questions or ideas?

Feel free to fork the repo or reach out if you'd like to explore:
- Dynamic feature injection
- Dependency injection across packages
- CI setup for lint/test coverage
