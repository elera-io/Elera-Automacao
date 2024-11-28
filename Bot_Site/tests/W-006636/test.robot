*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot
Resource    ../../resource/keywords/Imoveis_Residenciais/keywords.robot


Test Setup    Efetuar login
Test Teardown    Close Browser

*** Keywords ***
Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    E exibir os botões "Sim, sou" e "Ainda não"
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Taubaté" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe seu email

*** Test Cases ***
TC01: lead novo
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolhe horário da tarde
    Dado que, o usuário não valide a presença
    Então o bot encerra a conversa

TC02: lead criado dentro de 3 meses e com status Novo
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolhe horário da tarde
    Dado que, o usuário não valide a presença
    Então o bot encerra a conversa

TC03: lead criado dentro de 3 meses e com status trabalhando
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolhe horário da tarde
    Dado que, o usuário não valide a presença
    Então o bot encerra a conversa

TC04: lead criado dentro de 3 meses e com status cultivando
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolhe horário da tarde
    Dado que, o usuário não valide a presença
    Então o bot encerra a conversa

TC05: lead criado dentro de 3 meses e com status Convertido
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolhe horário da tarde
    Dado que, o usuário não valide a presença
    Então o bot encerra a conversa