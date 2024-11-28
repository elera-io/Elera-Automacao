*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Seja_Parceiro/keywords.robot

Test Setup    Efetuar login
Test Teardown    Close Browser


*** Test Cases ***

TC01: Credenciamento como parceiro sem selecionar outros assuntos
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário clique em "Seja um parceiro imobiliário" no menu
    Então o bot deverá exibir a mensagem de credenciamento
    E exibir os botões "Sim" e "Não"
    Dado que o usuário clique no botão "Não"
    Então o bot apresenta a mensagem de despedida

TC02: Credenciamento como parceiro com outros assuntos
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário clique em "Seja um parceiro imobiliário" no menu
    Então o bot deverá exibir a mensagem de credenciamento
    E exibir os botões "Sim" e "Não"
    Dado que o usuário clique no botão "Sim"
    Então o bot deve apresentar uma mensagem e exibir o menu