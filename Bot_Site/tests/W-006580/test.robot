*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot
Test Setup    Efetuar login
Test Teardown    Close Browser

*** Test Cases ***
CT01: Aceite de privacidade -> Validando solicitação de nome
    Definir nome como João Pedro
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente

CT02: Validando cenário de não concordar com as politicas de privacidade

    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Não Concordo

CT03: Validando solicitação de nome valido Amanda Pompéia
    Definir nome como Amanda Pompéia

    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome  
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente

CT04: Validando solicitação de nome invalido João Pedro Santos
    Definir nome como João Pedro Santos

    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome 
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente

CT05: Validando solicitação de nome valido icaro Bezerra
    Definir nome como icaro Bezerra

    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome 
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente

    [Documentation]    Após finalizar o teste, o bot deve resetar o nome para Teste Elera Para não atrapalhar os demais testes!
    Redefinir nome Para Teste Elera

  