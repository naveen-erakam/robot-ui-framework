*** Settings ***
Documentation       Regression tests for login - extended coverage
...                 Target: https://the-internet.herokuapp.com/login
Resource            ../../resources/keywords/common_keywords.robot
Resource            ../../config/config.robot
Suite Setup         Open Browser To Login Page
Suite Teardown      Close Test Session
Test Teardown       Run Keyword If Test Failed    Take Screenshot On Failure
Force Tags          regression

*** Test Cases ***
TC004 - Successful Login Then Logout Returns To Login Page
    [Documentation]    Full round-trip: login → verify secure area → logout → verify login page
    [Tags]    regression    login    logout    positive
    Login With Credentials    ${VALID_USER}    ${VALID_PASSWORD}
    Verify Login Success
    Logout From Application
    Title Should Be    The Internet

TC005 - Valid Password Wrong Username Shows Error
    [Documentation]    Correct password but wrong username must still fail
    [Tags]    regression    login    negative
    Login With Credentials    ${INVALID_USER}    ${VALID_PASSWORD}
    Verify Login Error    ${EXPECTED_ERROR}

TC006 - Valid Username Wrong Password Shows Error
    [Documentation]    Correct username but wrong password must still fail
    [Tags]    regression    login    negative
    Login With Credentials    ${VALID_USER}    ${INVALID_PASSWORD}
    Verify Login Error    password is invalid
