*** Settings ***
Library     SeleniumLibrary
Resource    ../locators/login_locators.robot
Resource    ../variables/test_data.robot

*** Keywords ***
Open Browser To Login Page
    [Documentation]    Opens browser and navigates to the login page
    [Arguments]    ${url}=${BASE_URL}    ${browser}=${BROWSER}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Title Should Be    The Internet

Login With Credentials
    [Documentation]    Enters credentials and submits the login form
    [Arguments]    ${username}    ${password}
    Clear Element Text      ${USERNAME_FIELD}
    Input Text              ${USERNAME_FIELD}    ${username}
    Clear Element Text      ${PASSWORD_FIELD}
    Input Password          ${PASSWORD_FIELD}    ${password}
    Click Button            ${LOGIN_BUTTON}

Verify Login Success
    [Documentation]    Confirms successful login by checking flash message and URL
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}    timeout=${TIMEOUT}
    Element Should Contain           ${SUCCESS_MESSAGE}    ${EXPECTED_SUCCESS}
    Location Should Contain          /secure

Verify Login Error
    [Documentation]    Confirms login failure flash message is displayed
    [Arguments]    ${expected_text}=${EXPECTED_ERROR}
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=${TIMEOUT}
    Element Should Contain           ${ERROR_MESSAGE}    ${expected_text}

Logout From Application
    [Documentation]    Clicks logout and verifies redirection
    Click Link      ${LOGOUT_BUTTON}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=${TIMEOUT}

Take Screenshot On Failure
    [Documentation]    Captures screenshot on test failure
    Capture Page Screenshot    EMBED

Close Test Session
    [Documentation]    Closes all browsers after suite
    Close All Browsers
