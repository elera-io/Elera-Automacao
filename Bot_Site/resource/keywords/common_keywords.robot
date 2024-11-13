*** Settings ***
Library    SeleniumLibrary
Resource    ../locator/locator.robot
Library    String
Resource    ../variables/common_variables.robot

*** Keywords ***
Abrir navegador
    Open Browser    ${BASE_URL}    ${BROWSER}

Efetuar Login
    Abrir navegador
    Preencher campos

Clicar no chat
    Sleep    5s
    Click Element    ${CHAT}
    Sleep    15s

Preencher campos
    Sleep    2s
    Input Text    ${USER_FIELD}    ${USER}
    Sleep    1s
    Input Text    ${PASSWORD_FIELD}    ${PASSWD}
    Sleep    1s
    Click Button    ${LOGIN_BUTTON}