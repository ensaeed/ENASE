*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      chrome

*** Test Cases ***
Invalid Login Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible    name=username    20s
    Input Text    name=username    wronguser
    Input Text    name=password    wrongpassword
    Click Button    xpath://button[@type='submit']

    Wait Until Page Contains    Invalid credentials    20s
    Page Should Contain    Invalid credentials

    Close Browser