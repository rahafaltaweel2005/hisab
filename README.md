# Hisab

A Flutter app for managing projects and tracking their financial details in one place: paid amounts, received amounts, wallet amounts, and remaining balances.

## Screenshots

| Home | Project Details | Excel Export |
|------|-----------------|--------------|
| ![Home](screenshots/home.png) | ![Project Details](screenshots/details.png) | ![Excel Export](screenshots/excel.png) |

## Features

- Create, edit, delete, and search projects
- Enter paid, received, and wallet amounts
- Automatic calculations for each project: net balance and remaining cash on hand
- Automatic totals across all projects: total net balance, total paid amounts, and total received amounts
- Paginated project lists with summaries
- Arabic and English localization (RTL/LTR)
- Authentication and profile management
- Export project data to Excel

## Tech Stack

- Flutter & Dart
- Clean Architecture
- Cubit (flutter_bloc) for state management
- Dio for REST API integration
- Secure token storage
- Easy Localization
- Syncfusion Flutter XlsIO

## Getting Started

```bash
git clone https://github.com/rahafaltaweel2005/hisab.git
cd hisab
flutter pub get
flutter run
```

## Author

Rahaf Altaweel  
GitHub: [rahafaltaweel2005](https://github.com/rahafaltaweel2005)
