*** Settings ***
Library    SeleniumLibrary
Resource    ../locator/locator.robot
Library    String
# Resource    ../../resource/keywords/Chat/chat_keyword.robot
Resource    ../page/Login/login_page.robot
Resource    ../page/Whatsapp/whatsapp_page.robot

*** Keywords ***
Abrir navegador
    Open Browser    ${BASE_URL}    ${BROWSER}

Abrir Whatsapp
    Open Browser    ${URL_WHATS}    ${BROWSER}

Efetuar Login no site
    Abrir navegador
    Preencher campos

Iniciar conversa
    Abrir Whatsapp
    Esperar as conversas aparecerem
    Buscar chat na pesquisar
    Clicar na conversa
    Esperar o chat abrir e mandar oi

Fechar Navegador
    Close Browser