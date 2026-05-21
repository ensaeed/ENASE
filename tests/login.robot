*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      chrome
${USERNAME}     Admin
${PASSWORD}     admin123

*** Test Cases ***
Valid Login Test
    Open Browser    ${URL}    chrome    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--window-size=1920,1080")
    Maximize Browser Window

    Wait Until Element Is Visible    name=username    20s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath://button[@type='submit']

    Wait Until Page Contains    Dashboard    20s
    Page Should Contain    Dashboard

    Close Browser