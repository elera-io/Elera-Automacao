*** Settings ***
Library    SeleniumLibrary
Resource    ../locator/locator.robot
Library    String
# Resource    ../../resource/keywords/Chat/chat_keyword.robot
Resource    ./Marco_Zero/keywords.robot

*** Keywords ***
Abrir Whatsapp
    Open Browser    ${BASE_URL}    ${BROWSER}

Iniciar conversa
    Abrir Whatsapp
    Quando a página carregue
    Dado que, o input apareça
    Dado que, o chat apareça
    Então o chat é clicado
    Dado que, o bot apresenta as mensagens de boas vindas e política de privacidade

Fechar Navegador
    Close Browser