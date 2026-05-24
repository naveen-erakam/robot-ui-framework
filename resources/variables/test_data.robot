*** Variables ***
${VALID_USER}           tomsmith
${VALID_PASSWORD}       SuperSecretPassword!
${INVALID_USER}         wronguser
${INVALID_PASSWORD}     wrongpassword
${EXPECTED_SUCCESS}     You logged into a secure area!
${EXPECTED_ERROR}       Your username is invalid!
${EXPECTED_EMPTY}       Your username is invalid!
${BASE_URL}    https://the-internet.herokuapp.com/login
${BROWSER}    chrome
${IMPLICIT_WAIT}    5s
${TIMEOUT}    20s
