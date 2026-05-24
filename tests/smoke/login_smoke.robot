*** Settings ***
Documentation       Smoke tests for login functionality
...                 Target: https://the-internet.herokuapp.com/login
...                 Credentials: admin / admin
Resource            ../../resources/keywords/common_keywords.robot
Resource            ../../config/config.robot
Suite Setup         Open Browser To Login Page
Suite Teardown      Close Test Session
Test Teardown       Run Keyword If Test Failed    Take Screenshot On Failure
Force Tags          smoke

*** Test Cases ***
TC001 - Valid Login Redirects To Secure Area
    [Documentation]    Verify admin/admin login navigates to /secure and shows success flash
    [Tags]    smoke    login    positive    critical
    Login With Credentials    ${VALID_USER}    ${VALID_PASSWORD}
    Verify Login Success

TC002 - Invalid Username Shows Error Flash
    [Documentation]    Verify wrong credentials trigger error flash message
    [Tags]    smoke    login    negative
    Login With Credentials    ${INVALID_USER}    ${INVALID_PASSWORD}
    Verify Login Error    ${EXPECTED_ERROR}

TC003 - Empty Credentials Show Validation Error
    [Documentation]    Verify submitting blank form shows error
    [Tags]    smoke    login    negative    validation
    Login With Credentials    ${EMPTY}    ${EMPTY}
    Verify Login Error    ${EXPECTED_EMPTY}
