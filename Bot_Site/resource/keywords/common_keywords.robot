*** Settings ***
Library    SeleniumLibrary
Resource    ../../locator/locator.robot
Library    String
Resource    ../variables/common_variables.robot
Resource    ../variables/Marco_Zero/variables.robot
Resource    ../keywords/Imoveis_Residenciais/keywords.robot
Resource    ../keywords/Marco_Zero/keywords.robot
Library    Collections

*** Keywords ***
Abrir navegador
    Open Browser    ${BASE_URL}    ${BROWSER}

Efetuar Login
    Abrir navegador
    Preencher campos

Clicar no chat
    Sleep    10s
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
    ${LAST_MESSAGE_INDEX}    Evaluate    ${LENGTH} - 1
    ${LAST_MESSAGE}    Get Text    ${MESSAGES_LIST}[${LAST_MESSAGE_INDEX}]
    Log To Console    ESPERADO=${MENSAGEM_RETORNO}
    Log To Console    RESULTADO=${LAST_MESSAGE}
    Should Be Equal    ${MENSAGEM_RETORNO}    ${LAST_MESSAGE}

Dado que, o usuário fique inativo por 5 minutos
    Sleep    310
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${LENGTH}    Get Length    ${MESSAGES_LIST}
    ${LENGTH}    Evaluate    ${LENGTH} - 1
    ${MESSAGE}    Get Text    ${MESSAGES_LIST}[${LENGTH}]
    Log To Console    ${MESSAGE}
    Sleep    5

    Should Be Equal    ${MESSAGE}    Oi! 👋 Notei que não nos falamos há algum tempo. Sua sessão será encerrada automaticamente em 24 horas. Pra não voltarmos nossa conversa do início, continue conversando comigo, por favor. 🥰

Dado que, o usuário continue a conversa
    [Arguments]    ${MESSAGE}
    Sleep    10
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${LENGTH}    Get Length    ${MESSAGES_LIST}
    ${LENGTH}    Evaluate    ${LENGTH} - 1
    ${TEXT}    Get Text    ${MESSAGES_LIST}[${LENGTH}]
    Should Be Equal    ${TEXT}    ${MESSAGE}

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

Clique no botão
    Sleep    5s
    [Arguments]    ${BOTAO}
    ${BOTOES}    Get WebElements    ${BOTOES_XPATH}
    ${BOTOES_LENGTH}    Get Length    ${BOTOES}
    ${BOTAO_EXISTE}    Set Variable    False
    FOR  ${INDEX}  IN RANGE    0    ${BOTOES_LENGTH}
        ${BOTAO_CONTENT}    Get Text    ${BOTOES}[${INDEX}]

        IF    '${BOTAO_CONTENT}' == '${BOTAO}'
            Click Element    ${BOTOES}[${INDEX}]
            ${BOTAO_EXISTE}    Set Variable    True
            BREAK
        END

    END

    Run Keyword If    '${BOTAO_EXISTE}' == 'False'    Fail    Botão "${BOTAO}" não foi encontrado
    Sleep    3s

Validar itens no menu
    Sleep    5s
    [Arguments]    @{ITENS_ESPERADOS}
    ${ITENS_MENU}    Get WebElements    ${MENU_ITENS_XPATH}
    ${ITENS_LENGHT}    Get Length    ${ITENS_MENU}
    ${ITENS_ESPERADOS_LENGTH}    Get Length    ${ITENS_ESPERADOS}
    IF  ${ITENS_LENGHT} != ${ITENS_ESPERADOS_LENGTH}
        Fail    Quantidade de itens no menu diferente do esperado
    END

    FOR  ${INDEX}  IN RANGE    0    ${ITENS_LENGHT}
        ${MENU_CONTENT}    Get Text    ${ITENS_MENU}[${INDEX}]
        Should Be Equal    ${MENU_CONTENT}    ${ITENS_ESPERADOS}[${INDEX}]
    END

Valida presença do botão voltar no menu
    Sleep    5s
    ${ITENS_MENU}    Get WebElements    ${MENU_ITENS_XPATH}
    ${ITENS_LENGHT}    Get Length    ${ITENS_MENU}
    ${BOTAO_EXISTE}    Set Variable    False

    FOR  ${INDEX}  IN RANGE    0    ${ITENS_LENGHT}
        ${MENU_CONTENT}    Get Text    ${ITENS_MENU}[${INDEX}]

        IF    '${MENU_CONTENT}' == 'Voltar'
            ${BOTAO_EXISTE}    Set Variable    True
            BREAK
        END

    END

    Run Keyword If    '${BOTAO_EXISTE}' == 'False'    Fail    Botão Voltar não foi encontrado
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

Validar ultimas mensagens
    [Arguments]    @{MENSAGENS_ESPERADAS}
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${QTD_MENSAGENS}    Get Length    ${MENSAGENS_ESPERADAS}
    ${MENSAGENS_LENGTH}    Evaluate    ${MENSAGENS_LENGTH} - 1
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - ${QTD_MENSAGENS}
    ${ULTIMAS_TRES_MENSAGENS}    Create List


    FOR    ${INDEX}    IN RANGE    ${MENSAGENS_LENGTH}    ${ULTIMAS_TRES_MENSAGENS_INDEX}    -1
        ${TEXT}    Get Text    ${MENSAGENS}[${INDEX}]
        ${TEXT}    Remove String    ${TEXT}    \n    ''
        ${TEXT}    Strip String    ${TEXT}
        Append To List    ${ULTIMAS_TRES_MENSAGENS}    ${TEXT}
    END

    Should Be Equal As Strings    ${ULTIMAS_TRES_MENSAGENS}    ${MENSAGENS_ESPERADAS}

Marco Zero | Ramificação ainda não é cliente 
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome    
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    E exibir os botões "Sim, sou" e "Ainda não"
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu