*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Test Setup    Efetuar login

*** Test Cases ***
CT02: Iniciar bot - Aceite de Politica = Negativo
    Clicar no chat
    Validar mensagens de boas vindas
    Nao concordar
    Validar Respostas