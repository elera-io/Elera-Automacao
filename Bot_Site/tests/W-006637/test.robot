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
    Dado que o usuário escolha o municipio
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe seu email

*** Test Cases ***
TC01:Validação de identificação de imóvel escolhido anteriormente
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot identifique o imóvel

TC02:Validação de identificação de um caso aberto no omnichannel
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot identifique o imóvel
  
TC03: Validar caso aberto no omnichannel e escolha do mesmo imóvel vinculado.
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot identifique o imóvel
  
TC04: Validar lead escolhendo imóvel diferente sem caso aberto no omnichannel.
    Redefinir nome padrão    Silva    Kevin
    Redefinir Imóvel    Mirante das Flores
    Redefinir celular padrão    (11) 93335-7637
    Redefinir email padrão    kevin.silva@sptech.school
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot não identifique o imóvel