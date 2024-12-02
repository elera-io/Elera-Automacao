*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Imoveis_Residenciais/keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot
Test Setup    Efetuar login
Test Teardown    Close Browser


*** Test Cases ***
CT01: Vincular novo lead ao imovel interessado escolhido
        #parte do chatbot
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "zz" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Hell Raiser" no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe seu email
        #parte de uat
    Logar na tela de lead
    #Procurar lead criado