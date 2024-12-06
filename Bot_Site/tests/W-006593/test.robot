*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Test Setup    Efetuar Login
Test Teardown    Close Browser

*** Test Cases ***

TC01:Validação da imagem do empreendimento
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha a cidade "Lins" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um empreendimento com fotos
    Então o bot apresenta as imagens da unidade
    Então o bot deverá responder com uma mensagem e solicitar o número de celular

TC03:Empreendimento sem imagem
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha a cidade "Lins" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um empreendimento sem fotos
    Então o bot apresenta as informações do empreendimento
    Então o bot deverá responder com uma mensagem e solicitar o número de celular