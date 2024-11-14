*** Settings ***
Resource    ../common_keywords.robot
Resource    ../../variables/Imoveis_Residenciais/variables.robot
Resource    ../../variables/Marco_Zero/variables.robot

*** Keywords ***

Dado que o usuário escolha "Imóveis Residenciais" no menu
    Clique no botão    Imóveis Residenciais
    
    