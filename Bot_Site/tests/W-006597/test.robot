*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Test Teardown    Close All Browsers


*** Test Cases ***

CT01:Validando a exibição dos imóveis cadastrados na cidade
    Efetuar Login
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha o municipio
    Então o bot deverá responder com a mensagem de imóveis disponíveis

CT02:Validando a atualização dos imóveis cadastrados na cidade
    Efetuar Login no Console
    Dado que, o usuário clique no icone de setup
    E então clique no em "Developer Console"
    E crie um empreedimento
    Então o bot deverá exibir o novo empreendimento cadastrado