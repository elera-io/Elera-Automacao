*** Settings ***
Library    SeleniumLibrary
Resource    ../locator/locator.robot
Library    String
Resource    ../variables/common_variables.robot
Resource    ../variables/Marco_Zero/variables.robot
Resource    ../keywords/Imoveis_Residenciais/keywords.robot
Library    Collections

*** Keywords ***
Abrir navegador
    Open Browser    ${BASE_URL}    ${BROWSER}

Efetuar Login
    Abrir navegador
    Preencher campos

Clicar no chat
    Sleep    5s
    Wait Until Element Is Visible    ${CHAT}    5s
    Click Element    ${CHAT}
    Sleep    15s

Preencher campos
    Sleep    2s
    Input Text    ${USER_FIELD}    ${USER}
    Sleep    1s
    Input Text    ${PASSWORD_FIELD}    ${PASSWD}
    Sleep    1s
    Click Button    ${LOGIN_BUTTON}

Clique no item do menu
    Sleep    5s
    [Arguments]    ${BOTAO}
    ${ITENS_MENU}    Get WebElements    ${MENU_ITENS_XPATH}
    ${ITENS_LENGHT}    Get Length    ${ITENS_MENU}
    ${BOTAO_EXISTE}    Set Variable    False
    FOR  ${INDEX}  IN RANGE    0    ${ITENS_LENGHT}
        ${MENU_CONTENT}    Get Text    ${ITENS_MENU}[${INDEX}]

        IF    '${MENU_CONTENT}' == '${BOTAO}'
            Click Element    ${ITENS_MENU}[${INDEX}]
            ${BOTAO_EXISTE}    Set Variable    True
        END

    END

    Run Keyword If    '${BOTAO_EXISTE}' == 'False'    Fail    Item ${BOTAO} não foi encontrado
    Sleep    3s

Valide os botões
    [Arguments]     @{CONTEUDO_ESPERADO_BOTOES}
    ${BOTOES}    Get WebElements    ${BOTOES_XPATH}
    ${BOTOES_LENGHT}    Get Length    ${BOTOES}
    ${BOTOES_CONTENT}    Create List

    FOR  ${INDEX}    IN RANGE    ${BOTOES_LENGHT}
        ${TEXT}    Get Text    ${BOTOES}[${INDEX}]
        Append To List    ${BOTOES_CONTENT}    ${TEXT}
    END

    Should Be Equal As Strings    ${BOTOES_CONTENT}    ${CONTEUDO_ESPERADO_BOTOES}

Clique no botão
    Sleep    5s
    [Arguments]    ${BOTAO}
    ${BOTOES}    Get WebElements    ${BOTOES_XPATH}
    ${BOTOES_LENGHT}    Get Length    ${BOTOES}
    ${BOTAO_EXISTE}    Set Variable    False

    FOR  ${INDEX}  IN RANGE    0    ${BOTOES_LENGHT}
        ${BOTOES_CONTENT}    Get Text    ${BOTOES}[${INDEX}]

        IF    '${BOTOES_CONTENT}' == '${BOTAO}'
            Click Element    ${BOTOES}[${INDEX}]
            ${BOTAO_EXISTE}    Set Variable    True
            BREAK
        END

    END

    Run Keyword If    '${BOTAO_EXISTE}' == 'False'    Fail    Botão ${BOTAO} não foi encontrado
    Sleep    3s
