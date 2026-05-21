*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${ADD_URL}      https://opensource-demo.orangehrmlive.com/web/index.php/pim/addEmployee
${BROWSER}      chrome

*** Test Cases ***
Add Employee Test
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--window-size=1920,1080")
    Set Window Size    1920    1080

    Wait Until Element Is Visible    name=username    20s
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    xpath://button[@type='submit']

    Wait Until Page Contains    Dashboard    20s

    Go To    ${ADD_URL}

    Wait Until Element Is Visible    xpath://input[@name='firstName']    20s
    Press Keys    xpath://input[@name='firstName']    John

    Wait Until Element Is Visible    xpath://input[@name='lastName']    20s
    Press Keys    xpath://input[@name='lastName']    Smith

    Click Button    xpath://button[@type='submit']

    Wait Until Page Contains    Personal Details    20s
    Capture Page Screenshot
    Close Browser