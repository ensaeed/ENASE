*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}    chrome

*** Test Cases ***
Search Employee Test
    Open Browser    ${URL}    chrome    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--window-size=1920,1080")

    Wait Until Element Is Visible    name=username    20s
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    xpath://button[@type='submit']

    Wait Until Page Contains    Dashboard    20s

    Click Element    xpath://span[text()='PIM']

    Wait Until Page Contains    Employee Information    20s

    Wait Until Element Is Visible    xpath:(//input[@placeholder='Type for hints...'])[1]    20s
    Click Element    xpath:(//input[@placeholder='Type for hints...'])[1]
    Input Text    xpath:(//input[@placeholder='Type for hints...'])[1]    Linda

    Capture Page Screenshot

    Close Browser