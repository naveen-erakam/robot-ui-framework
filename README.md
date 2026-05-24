# Robot Framework UI Automation Framework

A scalable, keyword-driven UI automation framework built with Robot Framework and Selenium. Designed for enterprise web applications with reusable components, structured reporting, and CI/CD integration.

## Tech Stack

- **Robot Framework** 6.x
- **SeleniumLibrary** 6.x
- **Python** 3.11+
- **AWS CodeBuild** (CI/CD)
- **Allure / RF Reports** (Reporting)

## Project Structure

```
robot-ui-framework/
├── tests/
│   ├── smoke/          # Critical path tests run on every build
│   ├── regression/     # Full regression suite
│   └── functional/     # Feature-specific test suites
├── resources/
│   ├── keywords/       # Reusable custom keywords
│   ├── variables/      # Environment and test data variables
│   └── locators/       # Page element locators
├── config/             # Browser and environment configs
├── drivers/            # WebDriver binaries
└── reports/            # Test execution reports
```

## Getting Started

### Prerequisites
```bash
pip install robotframework seleniumlibrary webdrivermanager
webdrivermanager chrome
```

### Run Tests

```bash
# Run smoke tests
robot --outputdir reports tests/smoke/

# Run full regression
robot --outputdir reports tests/regression/

# Run with specific browser
robot --variable BROWSER:firefox --outputdir reports tests/

# Run specific tag
robot --include smoke --outputdir reports tests/
```

## Key Features

- **Keyword-Driven**: Custom keyword library allows non-technical team members to write tests
- **Cross-Browser**: Supports Chrome, Firefox, Edge via config variable
- **Data-Driven**: External variable files for test data management
- **CI/CD Ready**: AWS CodeBuild pipeline integration with S3 artifact upload
- **Auto Reporting**: HTML reports with screenshots on failure

## CI/CD Pipeline

Tests run automatically on every PR via AWS CodeBuild:
1. Install dependencies
2. Execute test suite
3. Upload reports to S3
4. Send SNS notification with pass/fail summary

## Reports

After execution, open `reports/report.html` for full test results with logs and screenshots.

---
*Built and maintained by [Naveen Erakam](https://github.com/naveen-erakam)*
