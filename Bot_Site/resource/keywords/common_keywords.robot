*** Settings ***
Library    SeleniumLibrary
Resource    ../locator/locator.robot
Library    String
Resource    ../variables/common_variables.robot
Resource    ../variables/Marco_Zero/variables.robot

*** Keywords ***
Abrir navegador
    Open Browser    ${BASE_URL}    ${BROWSER}

Efetuar Login
    Abrir navegador
    Preencher campos

Clicar no chat
    Sleep    10s
    Click Element    ${CHAT}
    Sleep    15s

Preencher campos
    Sleep    2s
    Input Text    ${USER_FIELD}    ${USER}
    Sleep    1s
    Input Text    ${PASSWORD_FIELD}    ${PASSWD}
    Sleep    1s
    Click Button    ${LOGIN_BUTTON}

Validar mensagem resposta não reconhecidas
    Sleep    7
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${EXPECTED_MESSAGES}    Set Variable    Poxa! Ainda não consegui te entender. 😩 Vamos retornar para onde estávamos? OBS: Digite apenas quando pedirmos algum dado pessoal, por favor. Os campos apresentados são para seleção.
    ${EXPECTED_MESSAGES}    Strip String    ${EXPECTED_MESSAGES}
    ${EXPECTED_MESSAGES}    Replace String    ${EXPECTED_MESSAGES}    ${SPACE}    ${EMPTY}
    ${EXPECTED_MESSAGES}    Replace String    ${EXPECTED_MESSAGES}    ${\n}    ${EMPTY}

    ${LENGTH}    Get Length    ${MESSAGES_LIST}
    ${MENSAGEM_RETORNO_INDEX}    Evaluate    ${LENGTH} - 3
    ${MENSAGEM_RETORNO}    Get Text    ${MESSAGES_LIST}[${MENSAGEM_RETORNO_INDEX}]

    @{CONTEUDO_ESPERADO_BOTOES}    Set Variable    ${EXPECTED_MESSAGES}    ${MENSAGEM_RETORNO}

    FOR  ${INDEX}    IN RANGE    ${MENSAGEM_RETORNO_INDEX}+1    ${LENGTH}-1
        ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]
        ${TEXT}    Strip String    ${TEXT}
        ${TEXT}    Replace String    ${TEXT}    ${SPACE}    ${EMPTY}
        ${TEXT}    Replace String    ${TEXT}    \n    ${EMPTY}

        Log To Console    ESPERADO=${EXPECTED_MESSAGES}
        Log To Console    RESULTADO=${TEXT}
        
        Should Be Equal    ${TEXT}    ${EXPECTED_MESSAGES}
    END
    Sleep    2


Clique no botão
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

    Run Keyword If    '${BOTAO_EXISTE}' == 'False'    Fail    Botão de ${BOTAO} não foi encontrado
    Sleep    3s