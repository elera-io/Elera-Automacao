# Arquivo para armazenar todas as keywords referentes a ações na tela
# Examplo: Keyword para clicar no botão de salvar
*** Settings ***
Library    SeleniumLibrary
Resource    ../locator/locator.robot

*** Variables ***
${CHAT}    class:helpButtonEnabled

*** Keywords ***
Clicar no chat
    Sleep    5s
    Click Element    ${CHAT}
    Sleep    15s