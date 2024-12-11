*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot
Resource    ../../resource/keywords/Imoveis_Residenciais/keywords.robot
Test Setup    Efetuar login
Test Teardown    Close Browser

*** Test Cases ***
CT01: Resposta a informações não reconhecidas pelo chatbot
    Gerar evidência
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Enviar mensagem    C
    Validar mensagem resposta não reconhecidas
    Stop Video Recording

CT02: Continuação da Conversa Após Interação Não Reconhecida
    Gerar evidência
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Enviar mensagem    C
    Validar mensagem resposta não reconhecidas
    Stop Video Recording

CT03: Mensagem de Inatividade Após 5 Minutos
    Gerar evidência
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Dado que, o usuário fique inativo por 30 segundos
    Stop Video Recording

CT04: Continuação da Conversa dentro dos 5 Minutos
    Gerar evidência
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Dado que, o usuário fique inativo por 30 segundos
    Quando o usuário clica no botão Concordo
    Dado que, o usuário continue a conversa    Para começarmos, qual seu primeiro nome?
    Stop Video Recording

CT05: Encerramento da Janela de Atendimento Após 24 horas de Inatividade
    Gerar evidência
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Dado que, o usuário fique inativo por 30 segundos
    Quando acaba o limite de tempo de inatividade
    Stop Video Recording