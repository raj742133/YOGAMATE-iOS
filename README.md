# YOGAMATE-iOS 🧘‍♀️

A comprehensive iOS yoga companion app designed to guide users through their yoga journey with personalized sessions, pose detection, and progress tracking.

## 📱 About

YOGAMATE is an intuitive iOS application that serves as your personal yoga instructor. Whether you're a beginner or an advanced practitioner, our app provides customized yoga sessions, real-time pose guidance, and comprehensive progress tracking to enhance your yoga experience.

## ✨ Features

- **Personalized Yoga Sessions**: Customized routines based on skill level and preferences
- **Pose Library**: Comprehensive collection of yoga poses with detailed instructions
- **Real-time Pose Detection**: AI-powered pose correction and guidance
- **Progress Tracking**: Monitor your yoga journey with detailed analytics
- **Session Timer**: Built-in timer for meditation and breathing exercises
- **Offline Mode**: Access core features without internet connection
- **User Profiles**: Multiple user support with individual progress tracking
- **Favorites**: Save and organize your preferred poses and routines
- **Reminder Notifications**: Stay consistent with customizable practice reminders

## 🛠 Tech Stack

### Frontend (iOS)
- **Swift 5.0+** - Primary programming language
- **UIKit** - User interface framework
- **SwiftUI** - Modern declarative UI (iOS 13+)
- **Core Data** - Local data persistence
- **AVFoundation** - Audio/video playback for guided sessions
- **Core Animation** - Smooth animations and transitions

### Backend & Services
- **Firebase** - Backend-as-a-Service
 - Authentication (Firebase Auth)
 - Cloud Firestore (Database)
 - Cloud Storage (Media files)
 - Analytics

### Machine Learning 
- **Core ML** - On-device machine learning
- **Vision Framework** - Image analysis and pose detection
- **Create ML** - Custom model training

### Additional Libraries
- **SDWebImage** - Async image loading and caching
- **Charts** - Progress visualization

## 📋 Requirements

### System Requirements
- **Xcode**: Version 14.0 or later
- **iOS Deployment Target**: iOS 14.0+
- **macOS**: macOS 12.0 (Monterey) or later
- **Swift**: Version 5.0+

### Hardware Requirements
- iPhone 8 or later (recommended)
- iPad (6th generation) or later
- Minimum 2GB RAM
- 500MB available storage

### Project Structure

markdown## 📱 App Architecture

### Architecture Overview
YOGAMATE-iOS follows the **MVVM (Model-View-ViewModel)** architectural pattern combined with **Coordinator Pattern** for navigation and **Repository Pattern** for data management.
┌─────────────────────────────────────────────┐
│                 YOGAMATE-iOS                │
│                 Architecture                │
├─────────────────────────────────────────────┤
│  View Layer (SwiftUI/UIKit)                │
│  ├── SwiftUI Views                         │
│  ├── UIKit ViewControllers                 │
│  └── Custom UI Components                  │
├─────────────────────────────────────────────┤
│  ViewModel Layer                           │
│  ├── Business Logic                       │
│  ├── Data Binding                         │
│  └── State Management                     │
├─────────────────────────────────────────────┤
│  Model Layer                              │
│  ├── Data Models                          │
│  ├── Core Data Models                     │
│  └── Network Models                       │
├─────────────────────────────────────────────┤
│  Service Layer                            │
│  ├── Network Services                     │
│  ├── Database Services                    │
│  ├── Authentication Services              │
│  └── ML/AI Services                       │
├─────────────────────────────────────────────┤
│  Repository Layer                         │
│  ├── Data Repository                      │
│  ├── Cache Management                     │
│  └── Data Source Abstraction              │
└─────────────────────────────────────────────┘

### Project Structure
YOGAMATE-iOS/
├── 📱 App/
│   ├── AppDelegate.swift              # App lifecycle management
│   ├── SceneDelegate.swift            # Scene lifecycle (iOS 13+)
│   ├── Info.plist                     # App configuration
│   └── LaunchScreen.storyboard        # Launch screen
│
├── 🏗️ Core/
│   ├── Architecture/
│   │   ├── BaseViewController.swift   # Base view controller
│   │   ├── BaseViewModel.swift        # Base view model
│   │   └── ViewModelType.swift        # ViewModel protocol
│   ├── Extensions/
│   │   ├── UIView+Extensions.swift    # UI utility extensions
│   │   ├── String+Extensions.swift    # String utilities
│   │   └── Date+Extensions.swift      # Date utilities
│   ├── Utilities/
│   │   ├── Constants.swift            # App constants
│   │   ├── Helpers.swift              # Helper functions
│   │   └── Logger.swift               # Logging utility
│   └── Protocols/
│       ├── Coordinator.swift          # Navigation coordinator
│       └── Reusable.swift             # Reusable components
│
├── 🎨 Presentation/
│   ├── Coordinators/
│   │   ├── AppCoordinator.swift       # Main app coordinator
│   │   ├── AuthCoordinator.swift      # Authentication flow
│   │   ├── HomeCoordinator.swift      # Home flow
│   │   └── SessionCoordinator.swift   # Session flow
│   │
│   ├── Views/
│   │   ├── Authentication/
│   │   │   ├── LoginView.swift
│   │   │   ├── SignUpView.swift
│   │   │   └── ForgotPasswordView.swift
│   │   │
│   │   ├── Home/
│   │   │   ├── HomeViewController.swift
│   │   │   ├── DashboardView.swift
│   │   │   └── QuickStartView.swift
│   │   │
│   │   ├── PoseLibrary/
│   │   │   ├── PoseLibraryViewController.swift
│   │   │   ├── PoseDetailView.swift
│   │   │   ├── PoseListView.swift
│   │   │   └── PoseCategoryView.swift
│   │   │
│   │   ├── Sessions/
│   │   │   ├── SessionViewController.swift
│   │   │   ├── ActiveSessionView.swift
│   │   │   ├── SessionSetupView.swift
│   │   │   └── SessionSummaryView.swift
│   │   │
│   │   ├── Progress/
│   │   │   ├── ProgressViewController.swift
│   │   │   ├── ProgressChartView.swift
│   │   │   ├── AchievementView.swift
│   │   │   └── StatisticsView.swift
│   │   │
│   │   ├── Profile/
│   │   │   ├── ProfileViewController.swift
│   │   │   ├── SettingsView.swift
│   │   │   ├── PreferencesView.swift
│   │   │   └── AboutView.swift
│   │   │
│   │   └── Common/
│   │       ├── LoadingView.swift
│   │       ├── ErrorView.swift
│   │       ├── EmptyStateView.swift
│   │       └── CustomButton.swift
│   │
│   └── ViewModels/
│       ├── Authentication/
│       │   ├── LoginViewModel.swift
│       │   ├── SignUpViewModel.swift
│       │   └── AuthenticationViewModel.swift
│       │
│       ├── Home/
│       │   ├── HomeViewModel.swift
│       │   └── DashboardViewModel.swift
│       │
│       ├── PoseLibrary/
│       │   ├── PoseLibraryViewModel.swift
│       │   └── PoseDetailViewModel.swift
│       │
│       ├── Sessions/
│       │   ├── SessionViewModel.swift
│       │   ├── ActiveSessionViewModel.swift
│       │   └── SessionSetupViewModel.swift
│       │
│       ├── Progress/
│       │   ├── ProgressViewModel.swift
│       │   └── StatisticsViewModel.swift
│       │
│       └── Profile/
│           ├── ProfileViewModel.swift
│           └── SettingsViewModel.swift
│
├── 🏪 Domain/
│   ├── Models/
│   │   ├── User/
│   │   │   ├── User.swift             # User data model
│   │   │   ├── UserProfile.swift      # User profile model
│   │   │   └── UserPreferences.swift  # User preferences
│   │   │
│   │   ├── Yoga/
│   │   │   ├── YogaPose.swift         # Yoga pose model
│   │   │   ├── YogaSession.swift      # Yoga session model
│   │   │   ├── YogaRoutine.swift      # Yoga routine model
│   │   │   └── PoseCategory.swift     # Pose category model
│   │   │
│   │   ├── Progress/
│   │   │   ├── Progress.swift         # Progress tracking model
│   │   │   ├── Achievement.swift      # Achievement model
│   │   │   └── Statistics.swift       # Statistics model
│   │   │
│   │   └── Common/
│   │       ├── APIResponse.swift      # Generic API response
│   │       ├── Result.swift           # Result type
│   │       └── Error.swift            # Custom error types
│   │
│   ├── UseCases/
│   │   ├── Authentication/
│   │   │   ├── LoginUseCase.swift
│   │   │   ├── SignUpUseCase.swift
│   │   │   └── LogoutUseCase.swift
│   │   │
│   │   ├── Yoga/
│   │   │   ├── FetchPosesUseCase.swift
│   │   │   ├── StartSessionUseCase.swift
│   │   │   └── SaveProgressUseCase.swift
│   │   │
│   │   └── Profile/
│   │       ├── UpdateProfileUseCase.swift
│   │       └── FetchProfileUseCase.swift
│   │
│   └── Repositories/
│       ├── UserRepository.swift       # User data repository
│       ├── YogaRepository.swift       # Yoga data repository
│       ├── ProgressRepository.swift   # Progress data repository
│       └── SettingsRepository.swift   # Settings repository
│
├── 🔧 Services/
│   ├── Network/
│   │   ├── NetworkManager.swift       # Network layer
│   │   ├── APIClient.swift            # API client
│   │   ├── APIEndpoints.swift         # API endpoints
│   │   └── NetworkError.swift         # Network error handling
│   │
│   ├── Database/
│   │   ├── CoreDataManager.swift      # Core Data stack
│   │   ├── DatabaseService.swift      # Database operations
│   │   └── MigrationManager.swift     # Data migration
│   │
│   ├── Authentication/
│   │   ├── AuthService.swift          # Authentication service
│   │   ├── FirebaseAuthManager.swift  # Firebase auth
│   │   └── BiometricAuthService.swift # Biometric authentication
│   │
│   ├── Storage/
│   │   ├── LocalStorageService.swift  # Local storage
│   │   ├── CacheManager.swift         # Cache management
│   │   └── FileManager+Extensions.swift
│   │
│   ├── Analytics/
│   │   ├── AnalyticsService.swift     # Analytics tracking
│   │   ├── EventTracker.swift         # Event tracking
│   │   └── CrashReporter.swift        # Crash reporting
│   │
│   ├── MachineLearning/
│   │   ├── PoseDetectionService.swift # Pose detection ML
│   │   ├── CoreMLManager.swift        # Core ML manager
│   │   └── VisionService.swift        # Vision framework
│   │
│   └── Notifications/
│       ├── NotificationService.swift  # Push notifications
│       ├── LocalNotificationManager.swift
│       └── NotificationCenter+Extensions.swift
│
├── 📦 Data/
│   ├── CoreData/
│   │   ├── YogaMate.xcdatamodeld      # Core Data model
│   │   ├── User+CoreDataClass.swift   # Core Data entities
│   │   ├── YogaPose+CoreDataClass.swift
│   │   └── Session+CoreDataClass.swift
│   │
│   ├── Remote/
│   │   ├── API/
│   │   │   ├── AuthAPI.swift          # Authentication API
│   │   │   ├── YogaAPI.swift          # Yoga poses API
│   │   │   └── ProgressAPI.swift      # Progress tracking API
│   │   │
│   │   └── DTOs/
│   │       ├── UserDTO.swift          # Data transfer objects
│   │       ├── YogaPoseDTO.swift
│   │       └── SessionDTO.swift
│   │
│   └── Local/
│       ├── UserDefaults+Keys.swift    # UserDefaults keys
│       ├── KeychainService.swift      # Keychain storage
│       └── LocalDataSource.swift     # Local data source
│
├── 🎭 Resources/
│   ├── Assets.xcassets/               # App icons, images
│   │   ├── AppIcon.appiconset
│   │   ├── Colors/
│   │   ├── Images/
│   │   └── Poses/
│   │
│   ├── Fonts/                         # Custom fonts
│   │   ├── Montserrat-Regular.ttf
│   │   └── Montserrat-Bold.ttf
│   │
│   ├── Localizations/                 # Localization files
│   │   ├── en.lproj/
│   │   │   └── Localizable.strings
│   │   ├── es.lproj/
│   │   │   └── Localizable.strings
│   │   └── fr.lproj/
│   │       └── Localizable.strings
│   │
│   ├── Audio/                         # Audio files
│   │   ├── meditation-bells.mp3
│   │   └── breathing-guidance.mp3
│   │
│   ├── Videos/                        # Video tutorials
│   │   └── pose-demonstrations/
│   │
│   └── Configuration/
│       ├── GoogleService-Info.plist   # Firebase config
│       ├── Config.plist               # App configuration
│       └── APIKeys.plist              # API keys
│
├── 🧪 Tests/
│   ├── UnitTests/
│   │   ├── ViewModelTests/
│   │   ├── ServiceTests/
│   │   ├── ModelTests/
│   │   └── UtilityTests/
│   │
│   ├── IntegrationTests/
│   │   ├── APITests/
│   │   ├── DatabaseTests/
│   │   └── AuthenticationTests/
│   │
│   └── UITests/
│       ├── AuthenticationUITests.swift
│       ├── HomeUITests.swift
│       └── SessionUITests.swift
│
├── 📋 Supporting Files/
│   ├── Podfile                        # CocoaPods dependencies
│   ├── Podfile.lock                   # CocoaPods lock file
│   ├── Package.swift                  # Swift Package Manager
│   ├── .gitignore                     # Git ignore rules
│   ├── README.md                      # Project documentation
│   └── LICENSE                        # License file
│
└── 📊 Documentation/
├── Architecture.md                # Architecture documentation
├── API.md                        # API documentation
├── Deployment.md                 # Deployment guide
└── Contributing.md               # Contribution guidelines
│  ├── Data Repository                      │
│  ├── Cache Management                     │
│  └── Data Source Abstraction              │
└─────────────────────────────────────────────┘

