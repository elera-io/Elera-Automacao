*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot
Test Setup    Efetuar login
Test Teardown    Close Browser

*** Test Cases ***
CT02: Iniciar bot - Aceite de Politica = Negativo
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Não Concordo
    Então o bot deve mostrar as mensagens de encerramento