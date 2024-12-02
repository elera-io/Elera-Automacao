*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot
Resource    ../../resource/keywords/Imoveis_Residenciais/keywords.robot
Test Setup    Efetuar login
Test Teardown    Close Browser

*** Keywords ***
Validar mensagem de erro 
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
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Enviar mensagem    C
    Validar mensagem resposta não reconhecidas

CT02: Continuação da Conversa Após Interação Não Reconhecida
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Enviar mensagem    C
    Validar mensagem resposta não reconhecidas

CT03: Mensagem de Inatividade Após 5 Minutos
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Dado que, o usuário fique inativo por 5 minutos

CT04: Continuação da Conversa dentro dos 5 Minutos
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Dado que, o usuário fique inativo por 5 minutos
    Quando o usuário clica no botão Concordo
    Dado que, o usuário continue a conversa    Para começarmos, qual o seu nome completo?

CT05: Encerramento da Janela de Atendimento Após 24 horas de Inatividade
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Dado que, o usuário fique inativo por 5 minutos
    Quando o usuário clica no botão Concordo