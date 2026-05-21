*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}    chrome

*** Test Cases ***
Logout Test

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible    name=username    20s

    Input Text    name=username    Admin
    Input Text    name=password    admin123

    Click Button    xpath://button[@type='submit']

    Wait Until Page Contains    Dashboard    20s

    Click Element    xpath://span[@class='oxd-userdropdown-tab']

    Wait Until Element Is Visible    xpath://a[text()='Logout']    20s

    Click Element    xpath://a[text()='Logout']

    Wait Until Element Is Visible    name=username    20s

    Page Should Contain    Login

    Close Browser