*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot
# Test Setup    Efetuar login
Test Teardown    Close Browser

*** Test Cases ***

CT01:Validar seleção automática quando só existe uma unidade disponivel
    Efetuar Login
    Definir nome como icaro Bezerra

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
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
   
#    Usar automação do guedes para dados da unidade 
    Sleep  5s


CT02: Validar pick list para seleção de empreendimento na cidade
    [Documentation]     Pré-condiçoes

    Logar na tela de unidade
    Criar nova unidade
    
    # Passos
    Efetuar Login
    Definir nome como icaro Bezerra

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
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Goiânia" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    E exibir uma lista com os empreendimentos com Unidades disponíveis exibindo 'Gojira'

    Apagar unidade de teste
