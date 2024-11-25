*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Test Setup    Efetuar Login
Test Teardown    Close Browser

*** Test Cases ***

CT01:Validação de identificação de imóvel escolhido anteriormente
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o nome completo
    Dado que o usuário envie seu nome como "João Pedro Silva"
    Então o bot deve perguntar se o usuário já é um cliente
    E exibir os botões "Sim, sou" e "Ainda não"
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu