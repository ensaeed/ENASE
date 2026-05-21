*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
Open Browser    ${URL}    chrome
...    options=add_argument(--headless);add_argument(--no-sandbox);add_argument(--disable-dev-shm-usage)

*** Test Cases ***
Search Employee Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible    name=username    20s

    Input Text    name=username    Admin
    Input Text    name=password    admin123

    Click Button    xpath://button[@type='submit']

    Wait Until Page Contains    Dashboard    20s

    Click Element    xpath://span[text()='PIM']

    Wait Until Element Is Visible    name=username    20s

    Close Browser