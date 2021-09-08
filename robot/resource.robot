*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${SERVER}         http://localhost:8080/
${BROWSER}        Chrome

*** Keywords ***
Start Test
    User is in Post form Page

Finishing Test
    Capture Page Screenshot
    User close

User is in Post form Page
    Open Browser    ${SERVER}    ${BROWSER}
    Post should be ready
    Maximize Browser Window
    Set Selenium Speed    0
    Set Browser Implicit Wait    10
    Post should be ready

User create a comment with name "${NAME}", category "${CATEGORY}" and messasge "${MESSAGE}"
    User fill the field "name:name" with "${NAME}"
    User fill the field "name:category" with "${CATEGORY}"
    User fill the field "name:message" with "${MESSAGE}"
    Click Element    sub

Find Comment "${COUNT}"
    Page Should Contain Element    class:list-group-item    limit=${COUNT}

Find Delete Button "${COUNT}"
    Page Should Contain Element    name:del-link    limit=${COUNT}

Delete Comment
    Click Element    name:del-link

Delete Last Comment
    ${items} =    Get WebElements    class:btn-danger
    Click Element    ${items}[1]

Delete All Comments
    ${items} =    Get WebElements    class:btn-danger
    Should Not Be Empty    ${items}
    ${len} =    Get Length    ${items}
    FOR    ${item}    IN RANGE    ${len}
        Click Element    ${items}[0]
    END

User close
    Close Browser

Post should be ready
    Title Should Be    Post

User fill the field "${field_name}" with "${field_value}"
    Input Text    ${field_name}    ${field_value}

Setup chromedriver
    Set Environment Variable    PATH    ${EXECDIR}/bin

