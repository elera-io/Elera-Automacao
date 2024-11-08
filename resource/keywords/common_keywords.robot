*** Settings ***
Library    SeleniumLibrary
Resource    ../locator/locator.robot
Library    String
Resource    ../../resource/keywords/Chat/chat_keyword.robot
Resource    ../page/Login/login_page.robot

*** Keywords ***
Abrir navegador
    Open Browser    ${BASE_URL}    ${BROWSER}

Efetuar Login
    Abrir navegador
    Preencher campos