*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      chrome

*** Test Cases ***
Invalid Login Test
   Open Browser    ${URL}    chrome    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--window-size=1920,1080")
    Maximize Browser Window

    Wait Until Element Is Visible    name=username    20s
    Input Text    name=username    wronguser
    Input Text    name=password    wrongpassword
    Click Button    xpath://button[@type='submit']

    Wait Until Page Contains    Invalid credentials    20s
    Page Should Contain    Invalid credentials

    Close Browser