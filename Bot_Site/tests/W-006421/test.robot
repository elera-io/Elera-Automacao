*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot
Resource    ../../resource/keywords/Imoveis_Residenciais/keywords.robot
Test Setup    Efetuar login
Test Teardown    Close Browser

*** Keywords ***
Marco Zero | Ramificação ainda não é cliente 
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Enviar mensagem    C
    Validar mensagem resposta não reconhecidas
    # Quando o usuário clica no botão Concordo
    # Então o bot solicita o nome completo
    # Dado que o usuário preencha o seu nome completo
    # Então o bot deve perguntar se o usuário já é um cliente
    # E exibir os botões "Sim, sou" e "Ainda não"
    # Dado que o usuário clique no botão "Ainda não"
    # Então o bot deve apresentar uma mensagem e exibir o menu

*** Test Cases ***
CT01: Resposta a informações não reconhecidas pelo chatbot
    Marco Zero | Ramificação ainda não é cliente