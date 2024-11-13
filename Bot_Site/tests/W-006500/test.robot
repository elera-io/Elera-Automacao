*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot

Test Setup    Efetuar login
Test Teardown    Close Browser

*** Test Cases ***


CT01:Pesquisa de imóveis por cidade vários imóveis| telefone e email válidos
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o nome completo
    Dado que o usuário preencha o seu nome completo
    Então o bot deve perguntar se o usuário já é um cliente
    E exibir os botões "Sim, sou" e "Ainda não"
    Dado que o usuário clique no botão "Ainda não"
