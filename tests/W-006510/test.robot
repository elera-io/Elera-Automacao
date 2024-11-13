*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Whatsapp/whatsapp.robot
Test Setup    Iniciar conversa
Test Teardown    Close Browser

*** Test Cases ***
CT01: Iniciar bot - Aceite de Politica, Atendimento aqui e CPF encontrado.
    Dado que o usuário concorde com os termos e continue o atendimento
    Preencher CPF
    Encerrar conversa

CT02: Iniciar bot - Aceite de Politica = Negativo
    Nao concordar

CT03: Iniciar bot - Atendimento aqui = Negativo [Validar Fluxo 3.1]
    Concordar
    Nao Continuar Atendimento

CT04: Iniciar bot - CPF NÃO encontrado → Digitar CPF novamente
    Dado que o usuário concorde com os termos e continue o atendimento
    Dado que o usuário preencha incorretamente o CPF e queira preencher novamente
    Encerrar Atendimento

CT05: Iniciar bot - CPF NÃO encontrado → Encerrar Atendimento
    Dado que o usuário concorde com os termos e continue o atendimento
    Preencher CPF Invalido
    Encerrar Atendimento

CT06: Iniciar bot - CPF NÃO encontrado → Falar com Especialista em hr comercial
    Dado que o usuário concorde com os termos e continue o atendimento
    Dado que o usuário preencha incorretamente o CPF e queira falar com um especialista
    Encerrar conversa

CT07: Iniciar bot - CPF NÃO encontrado → Falar com Especialista fora hr comerci.
    Dado que o usuário concorde com os termos e continue o atendimento
    Dado que o usuário preencha incorretamente o CPF e queira falar com um especialista
    Encerrar conversa