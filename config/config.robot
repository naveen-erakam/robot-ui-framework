*** Settings ***
Documentation    Global configuration for the test suite

*** Variables ***
${BROWSER}          chrome
${BASE_URL}         https://the-internet.herokuapp.com/login
${SECURE_URL}       https://the-internet.herokuapp.com/secure
${IMPLICIT_WAIT}    10
${TIMEOUT}          30s
${HEADLESS}         False
${SCREENSHOT_DIR}   ${EXECDIR}/reports/screenshots
