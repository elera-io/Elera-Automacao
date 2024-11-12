*** Settings ***
Resource    ../../keywords/common_keywords.robot
Resource    ../../locator/locator.robot

*** Variables ***
${USER_FIELD}    id:username
${PASSWORD_FIELD}    id:password
${LOGIN_BUTTON}    id:Login

*** Keywords ***
Preencher campos
    Wait Until Element Is Visible    ${USER_FIELD}    10s
    Input Text    ${USER_FIELD}    ${USER}
    Sleep    1s
    Input Text    ${PASSWORD_FIELD}    ${PASSWD}
    Sleep    1s
    Click Button    ${LOGIN_BUTTON}