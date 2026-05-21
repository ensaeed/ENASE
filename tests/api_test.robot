*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Get Users API Test
    Create Session    mysession    ${BASE_URL}

    ${response}=    GET On Session    mysession    /users

    Log To Console    ${response.status_code}
    Log To Console    ${response.text}

    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    Leanne Graham