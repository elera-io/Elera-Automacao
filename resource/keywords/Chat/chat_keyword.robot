*** Settings ***
Resource    ../common_keywords.robot
Resource    ../../page/Chat/chat_page.robot
Resource    ../../page/page.robot

*** Keywords ***

Nao concordo
    Clicar no chat
    Sleep    15s
    Validar mensagens de boas vindas
    Sleep    5s
    Nao concordar
    Sleep    2s
    Validar Respostas
