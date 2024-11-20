*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Test Setup    Iniciar conversa
Test Teardown    Close Browser

*** Test Cases ***
CT01: Iniciar bot - Aceite de Politica, Atendimento aqui e CPF encontrado.
    Dado que, concorde com os termos
    Dado que, queira continuar com o atendimento
    Dado que, o CPF é solicitado    01658969146
    Quando o bot encontra o CPF digitado
    Encerrar conversa

CT02: Iniciar bot - Aceite de Politica = Negativo
    Dado que, não concorde com os termos
    Então o bot apresenta as mensagens de despedidas

CT03: Iniciar bot - Atendimento aqui = Negativo [Validar Fluxo 3.1]
    Dado que, concorde com os termos
    Dado que, não queira continuar com o atendimento
    Então o atendimento é encerrado

CT04: Iniciar bot - CPF NÃO encontrado → Digitar CPF novamente
    Dado que, concorde com os termos
    Dado que, queira continuar com o atendimento
    Dado que, o CPF é solicitado    74227993156
    Dado que, o queira digitar novamente o CPF
    Dado que, o CPF é solicitado    74227993156
    Dado, queira encerrar atendimento
    Então o atendimento é encerrado

CT05: Iniciar bot - CPF NÃO encontrado → Encerrar Atendimento
    Dado que, concorde com os termos
    Dado que, queira continuar com o atendimento
    Dado que, o CPF é solicitado    74227993156
    Dado, queira encerrar atendimento
    Então o atendimento é encerrado

CT06: Iniciar bot - CPF NÃO encontrado → Falar com Especialista em hr comercial
    Dado que, concorde com os termos
    Dado que, queira continuar com o atendimento
    Dado que, o CPF é solicitado    74227993156
    Dado que, queira falar com especialista
    Dado que, é solicitado o nome
    Dado que, é solicitado o email
    Encerrar conversa

CT07: Iniciar bot - CPF NÃO encontrado → Falar com Especialista fora hr comerci.
    Dado que, concorde com os termos
    Dado que, queira continuar com o atendimento
    Dado que, o CPF é solicitado    74227993156
    Dado que, queira falar com especialista
    Dado que, é solicitado o nome
    Dado que, é solicitado o email
    Encerrar conversa