*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Test Setup    Iniciar conversa
Test Teardown    Close Browser

*** Test Cases ***
CT01: Iniciar bot - Aceite de Politica, Atendimento aqui e CPF encontrado.
    Validar boas vindas
    Concordar
    Continuar Atendimento
    Preencher CPF
    Encerrar conversa

CT02: Iniciar bot - Aceite de Politica = Negativo
    Nao concordar

CT03: Iniciar bot - Atendimento aqui = Negativo [Validar Fluxo 3.1]
    Concordar
    Nao Continuar Atendimento

CT04: Iniciar bot - CPF NÃO encontrado → Digitar CPF novamente
    Concordar
    Continuar Atendimento
    Preencher CPF Invalido
    Preencher CPF novamente
    Preencher CPF Invalido
    Encerrar Atendimento

CT05: Iniciar bot - CPF NÃO encontrado → Encerrar Atendimento
    Concordar
    Continuar Atendimento
    Preencher CPF Invalido
    Encerrar Atendimento

CT06: Iniciar bot - CPF NÃO encontrado → Falar com Especialista em hr comercial
    Concordar
    Continuar Atendimento
    Preencher CPF Invalido
    Falar com Atendente
    Preencher Nome
    Preencher Email
    Encerrar conversa

CT07: Iniciar bot - CPF NÃO encontrado → Falar com Especialista fora hr comerci.
    Concordar
    Continuar Atendimento
    Preencher CPF Invalido
    Falar com Atendente
    Preencher Nome
    Preencher Email
    Encerrar conversa