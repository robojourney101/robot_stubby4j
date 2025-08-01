*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://localhost:8882

*** Test Cases ***
Verify Stubby4j API_Hello
    [Documentation]    url: /hello 
    Create Session    stub    ${BASE_URL}
    ${resp}=    GET On Session    stub    /hello
    Should Be Equal As Integers    ${resp.status_code}    ${200}
    Should Be Equal As Strings     ${resp.reason}    OK
    Should Contain    ${resp.text}    Hello from Stubby4j
    Log    ${resp.text}    console=${True}

Verify Stubby4j API_List user
    [Documentation]    url: /list/users
    Create Session    stub    ${BASE_URL}
    ${resp}     GET On Session    stub    /list/users
    Should Be Equal As Integers    ${resp.status_code}    ${200}
    Should Be Equal As Strings     ${resp.reason}    OK
    Log    ${resp.text}    console=${True}

Verify Stubby4j API_Ceate a user
    [Documentation]    url: /user (ceate)
    Create Session    stub    ${BASE_URL} 
    ${headers}    Create Dictionary    Content-Type=application/json
    ${resp}       POST On Session      stub    /user
    ...    json={"username": "Minnie.m"}
    ...    headers=${headers}  
    Should Be Equal As Integers    ${resp.status_code}    ${201}
    Should Be Equal As Strings     ${resp.reason}    Created
    Log    ${resp.text}    console=${True}

Verify Stubby4j API_Update a user
    [Documentation]    url: /user/101 (update)
    Create Session    stub    ${BASE_URL}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${resp}       PUT On Session      stub    /user/101
    ...    json={"username": "Minjee.j"}
    ...    headers=${headers}  
    Should Be Equal As Integers    ${resp.status_code}    ${200}
    Should Be Equal As Strings     ${resp.reason}    OK
    Log    ${resp.text}    console=${True}

Verify Stubby4j API_Delete a user
    [Documentation]    url: /user/101 (delete)
    Create Session    stub    ${BASE_URL}
    ${resp}     DELETE On Session    stub    /user/101
    Should Be Equal As Integers    ${resp.status_code}    ${200}
    Should Be Equal As Strings     ${resp.reason}    OK
    Should Be Equal As Strings     ${resp.json()}[message]    API delete a user
    Log    ${resp.text}    console=${True}