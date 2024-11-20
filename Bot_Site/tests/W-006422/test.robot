*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot

Test Setup    Efetuar login
Test Teardown    Close Browser

*** Test Cases ***

CT01: Iniciar bot - Aceite de Politica, Atendimento aqui e já é cliente ou não.
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o nome completo
    Dado que o usuário preencha o seu nome completo
    Então o bot deve perguntar se o usuário já é um cliente
    E exibir os botões "Sim, sou" e "Ainda não"
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu

CT02: Dialogo alternativo para discordância com a Política de Privacidade
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Não Concordo
    Então o bot deve mostrar as mensagens de encerramento

CT03: Validação e Acesso ao Portal do Cliente para Usuários que Já São Clientes
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o nome completo
    Dado que o usuário preencha o seu nome completo
    Então o bot deve perguntar se o usuário já é um cliente
    E exibir os botões "Sim, sou" e "Ainda não"
    Dado que o usuário clique no botão "Sim, sou"
    Então o bot apresenta a mensagem de rede de vizinhos e um menu
    E clicar no botão de portal do cliente
    Então o bot deve enviar o link para acessar o portal do cliente

CT04: Validação e Falar por WhatsApp para Usuários que Já São Clientes
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o nome completo
    Dado que o usuário preencha o seu nome completo
    Então o bot deve perguntar se o usuário já é um cliente
    E exibir os botões "Sim, sou" e "Ainda não"
    Dado que o usuário clique no botão "Sim, sou"
    Então o bot apresenta a mensagem de rede de vizinhos e um menu
    E clicar no botão de Falar por whatsapp
    Então o bot deve enviar o link para o whatsapp

CT05:Validação e Encerrar atendimento para Usuários que Já São Clientes
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o nome completo
    Dado que o usuário preencha o seu nome completo
    Então o bot deve perguntar se o usuário já é um cliente
    E exibir os botões "Sim, sou" e "Ainda não"
    Dado que o usuário clique no botão "Sim, sou"
    Então o bot apresenta a mensagem de rede de vizinhos e um menu
    E clicar no botão de Encerrar atendimento
    Então o bot deve enviar a mensagem de encerramento