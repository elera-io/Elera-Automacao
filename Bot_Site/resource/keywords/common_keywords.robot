*** Settings ***
Library    SeleniumLibrary
Resource    ../locator/locator.robot
Library    String
Resource    ../variables/common_variables.robot
Resource    ../variables/Marco_Zero/variables.robot
Resource    ../keywords/Imoveis_Residenciais/keywords.robot
Resource    ../keywords/Marco_Zero/keywords.robot
Resource    ../keywords/Outros/keyword.robot
Library    Collections
Library    ../../libs/remove.py
Library    ScreenCapLibrary

*** Keywords ***
Abrir navegador
    Open Browser    ${BASE_URL}    ${BROWSER}  

Abrir lista de leads no ambiente
    Open Browser    ${BASE_LEADS_URL}    ${BROWSER}
    Preencher campos

Efetuar Login
    Abrir navegador
    Preencher campos

Clicar no chat
    Sleep    10s
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
    ${EXPECTED_MESSAGES}    Set Variable    Poxa! Ainda não consegui te entender. 😩${\n}Vamos retornar para onde estávamos?${\n}${\n}OBS: Digite apenas quando pedirmos algum dado pessoal, por favor. Os campos apresentados são para seleção.
    ${REPR_EXPECTED}    Evaluate    repr("""${EXPECTED_MESSAGES}""")

    ${LENGTH}    Get Length    ${MESSAGES_LIST}
    ${MENSAGEM_RETORNO_INDEX}    Evaluate    ${LENGTH} - 3
    ${MENSAGEM_RETORNO}    Get Text    ${MESSAGES_LIST}[${MENSAGEM_RETORNO_INDEX}]

    FOR  ${INDEX}    IN RANGE    ${MENSAGEM_RETORNO_INDEX}+1    ${LENGTH}-1
        ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]
        ${TEXT}    Strip String    ${TEXT}
    ${REPR_ULTIMA}    Evaluate    repr("""${TEXT}""")
        
        Should Be Equal    ${REPR_ULTIMA}    ${REPR_EXPECTED}
    END
    Sleep    2
    ${LAST_MESSAGE}    Get Text    ${MESSAGES_LIST}[-1]
    Log To Console    ESPERADO=${MENSAGEM_RETORNO}
    Log To Console    RESULTADO=${LAST_MESSAGE}
    Should Be Equal    ${MENSAGEM_RETORNO}    ${LAST_MESSAGE}

Dado que, o usuário fique inativo por 30 segundos
    Sleep    35
    ${INATIVITY_ELEMENT}    Get WebElement    ${INATIVITY_TEXT}
    ${TEXT_INATIVITY}    Get Text    ${INATIVITY_ELEMENT}
    ${EXPECTED}    Set Variable    Você ainda está aí? Envie uma mensagem dentro de${SPACE} minutos e${SPACE} segundos ou este chat atingirá o tempo limite

    ${TEXT_INATIVITY_WITHOUT_NUMBERS}    Remove Numbers    ${TEXT_INATIVITY}

    Should Be Equal    ${TEXT_INATIVITY_WITHOUT_NUMBERS}    ${EXPECTED}

Quando acaba o limite de tempo de inatividade
    Sleep    285
    Element Should Be Visible    xpath=//button[contains(@class,'endChatButton')]

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
    ${ITENS_LENGTH}    Get Length    ${ITENS_MENU}
    ${BOTAO_EXISTE}    Set Variable    False
    FOR  ${INDEX}  IN RANGE    0    ${ITENS_LENGTH}
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
    ${BOTAO_EXISTE}    Set Variable    ${False}
    
    FOR  ${INDEX}  IN RANGE    ${BOTOES_LENGTH}
        ${BOTAO_CONTENT}    Get Text    ${BOTOES}[${INDEX}]

        IF    '${BOTAO_CONTENT}' == '${BOTAO}'
            Click Element    ${BOTOES}[${INDEX}]
            ${BOTAO_EXISTE}    Set Variable    ${True}
            BREAK
        END

    END

    Run Keyword If    ${BOTAO_EXISTE} == ${False}    Fail    Botão "${BOTAO}" não foi encontrado
    Sleep    3s

Validar itens no menu
    Sleep    5s
    [Arguments]    @{ITENS_ESPERADOS}
    ${ITENS_MENU}    Get WebElements    ${MENU_ITENS_XPATH}
    ${ITENS_LENGTH}    Get Length    ${ITENS_MENU}
    ${ITENS_ESPERADOS_LENGTH}    Get Length    ${ITENS_ESPERADOS}

    FOR  ${INDEX}  IN RANGE    ${ITENS_LENGTH}-1    ${ITENS_LENGTH}-${ITENS_ESPERADOS_LENGTH}
        ${MENU_CONTENT}    Get Text    ${ITENS_MENU}[${INDEX}]
        Should Be Equal    ${MENU_CONTENT}    ${ITENS_ESPERADOS}[${INDEX}]
    END

Valida presença do botão voltar no menu
    Sleep    5s
    ${ITENS_MENU}    Get WebElements    ${MENU_ITENS_XPATH}
    ${ITENS_LENGTH}    Get Length    ${ITENS_MENU}
    ${BOTAO_EXISTE}    Set Variable    False

    FOR  ${INDEX}  IN RANGE    0    ${ITENS_LENGTH}
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
    ${BOTOES_LENGTH}    Get Length    ${BOTOES}
    ${BOTOES_CONTENT}    Create List

    FOR  ${INDEX}    IN RANGE    ${BOTOES_LENGTH}
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

Efetuar Login no Console
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-notifications
    Open Browser    https://pacaembuconstrutorasa--uat.sandbox.lightning.force.com/    ${BROWSER}    options=${options}
    Preencher campos

Gerar evidência
    [Arguments]    ${DIRECTORY}
    ${SEGUNDOS}    Get Time    format=sec
    ${TESTE_FORMATADO}    Replace String    ${TEST_NAME}    ${SPACE}    -
    ${TESTE_FORMATADO}    Replace String    ${TESTE_FORMATADO}    :    ${EMPTY}
    ${TESTE_FORMATADO}    Replace String    ${TESTE_FORMATADO}    |    ${EMPTY}
    ${TESTE_FORMATADO}    Replace String    ${TESTE_FORMATADO}    "    ${EMPTY}
    ${TESTE_FORMATADO}    Replace String    ${TESTE_FORMATADO}    '    ${EMPTY}
    Start Video Recording    name=${DIRECTORY}/${TESTE_FORMATADO}_${SEGUNDOS}