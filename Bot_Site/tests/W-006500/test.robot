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
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    E exibir os botões "Sim, sou" e "Ainda não"
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu

*** Test Cases ***


CT01:Pesquisa de imóveis por cidade vários imóveis| telefone e email válidos
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe seu email

CT02:Pesquisa de imóveis por cidade vários imóveis| email invalido sem @
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email inválido sem @
    Então o bot deverá exibir a mensagem de confusão

CT03:Pesquisa de imóveis por cidade vários imóveis| email invalido sem .
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email inválido sem .
    Então o bot deverá exibir a mensagem de confusão

CT04:Pesquisa de imóveis por cidade vários imóveis| email invalido sem .com
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email inválido sem .com
    Então o bot deverá exibir a mensagem de confusão

CT05:Pesquisa de imóveis por cidade vários imóveis| email invalido sem com
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email inválido sem .com
    Então o bot deverá exibir a mensagem de confusão

CT05:Pesquisa de imóveis por cidade vários imóveis| email invalido sem UserName
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email inválido sem UserName
    Então o bot deverá exibir a mensagem de confusão

CT07:Pesquisa de imóveis por cidade vários imóveis| telefone faltando números
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe um número faltando digitos
    Então o bot deverá exibir a mensagem de confusão

CT08:Pesquisa de imóveis por cidade vários imóveis| telefone faltando números
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe um número com letras
    Então o bot deverá exibir a mensagem de confusão

CT09:Pesquisa de imóveis por cidade vários imóveis| telefone faltando números
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe um número faltando digitos
    Então o bot deverá exibir a mensagem de confusão

CT10:Pesquisa de imóveis por cidade vários imóveis| telefone valido
        Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número inválido
    Então o bot deverá exibir a mensagem de confusão