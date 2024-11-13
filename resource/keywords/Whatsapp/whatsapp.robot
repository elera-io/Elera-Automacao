*** Settings ***
Resource    ../../page/Whatsapp/whatsapp_page.robot

*** Keywords ***
Dado que o usuário concorde com os termos e continue o atendimento
    Concordar
    Continuar Atendimento
  
Dado que o usuário preencha incorretamente o CPF e queira preencher novamente
    Preencher CPF Invalido
    Preencher CPF novamente
    Preencher CPF Invalido
  
Dado que o usuário preencha incorretamente o CPF e queira falar com um especialista
    Preencher CPF Invalido
    Falar com Atendente
    Preencher Nome
    Preencher Email