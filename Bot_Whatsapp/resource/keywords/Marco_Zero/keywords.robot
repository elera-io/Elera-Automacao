*** Settings ***
Library    SeleniumLibrary
Library    String
Library    ./format.py
Resource    ../common_keywords.robot

*** Variables ***
${INPUT_SEARCH}    xpath=//*[@id="side"]/div[1]/div/div[2]/div[2]/div/div/p
${INPUT_MESSAGE}    xpath=//*[@id="main"]/footer/div[1]/div/span/div/div[2]/div[1]/div/div[1]/p
@{EXPECTED_MESSAGES_BOAS_VINDAS}    Olá! Tudo bem? Eu sou a Pam, Atendente Virtual da Pacaembu. Seja bem-vindo (a) à nossa Central de Relacionamento Digital.
...    Ao seguir com o atendimento, você está concordando com a nossa Política de Privacidade (https://pacaembu.com/politica-de-privacidade). Se estiver de acordo, é só clicar em "concordo"
@{EXPECTED_MESSAGES_NAO_CONCORDO}    infelizmente, sem o seu aceite ao termo não posso continuar com o atendimento por aqui.
...    Mas, você ainda pode ligar para a nossa Central de Relacionamento, pelo número 0800 730 2020, ou me chamar novamente dando o aceite ao termo, combinado? Um abraço da Pam
${MESSAGES_XPATH}    xpath=//span[contains(@class,'copyable-text')]

*** Keywords ***
Dado que, o bot apresenta as mensagens de boas vindas e política de privacidade
    Sleep    3
    # Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${LENGTH}    Get Length    ${MESSAGES_LIST}
    ${INDEX}    Evaluate    ${LENGTH} - 2
    ${MESSAGE}    Evaluate    0

    FOR  ${I}    IN RANGE    ${INDEX}    ${LENGTH}
        ${TEXT}    Get Text    ${MESSAGES_LIST}[${I}]

        ${TEXT}    Remove String    ${TEXT}    \n    ""
        ${TEXT}    Strip String    ${TEXT}
        Log To Console    Texto: ${TEXT}
        ${TEXT_LIMPO}    Remove Horario        ${TEXT}
        Log To Console    RESULTADO: ${TEXT_LIMPO}
        Log To Console    ESPERADO: ${EXPECTED_MESSAGES_BOAS_VINDAS}[${MESSAGE}]
        Should Be Equal    ${TEXT_LIMPO}    ${EXPECTED_MESSAGES_BOAS_VINDAS}[${MESSAGE}]
        ${MESSAGE}    Evaluate    ${MESSAGE} + 1
    END
    Sleep    2s

Dado que, não concorde com os termos
    Input Text    ${INPUT_MESSAGE}    2
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    15

Dado que, concorde com os termos
    # @{TERMS}    Get WebElements   xpath=//div[contains(@class, '_ahei')]
    Input Text    ${INPUT_MESSAGE}    1
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Então o bot apresenta as mensagens de despedidas
    Sleep    3
    # Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${LENGTH}    Get Length    ${MESSAGES_LIST}
    ${INDEX}    Evaluate    ${LENGTH} - 2
    ${MESSAGE}    Evaluate    0

    FOR  ${I}    IN RANGE    ${INDEX}    ${LENGTH}
        ${TEXT}    Get Text    ${MESSAGES_LIST}[${I}]

        ${TEXT}    Remove String    ${TEXT}    \n    ""
        ${TEXT}    Strip String    ${TEXT}
        ${TEXT_LIMPO}    Remove Horario        ${TEXT}
        Log To Console    RESULTADO: ${TEXT_LIMPO}
        Log To Console    ESPERADO: ${EXPECTED_MESSAGES_NAO_CONCORDO}[${MESSAGE}]
        Should Be Equal    ${TEXT_LIMPO}    ${EXPECTED_MESSAGES_NAO_CONCORDO}[${MESSAGE}]
        ${MESSAGE}    Evaluate    ${MESSAGE} + 1
    END
    Sleep    2s

Quando o bot encontra o CPF digitado
    Sleep    3
    # Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${LENGTH}    Get Length    ${MESSAGES_LIST}
    ${INDEX}    Evaluate    ${LENGTH} - 1

    ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]

    ${TEXT}    Remove String    ${TEXT}    \n    ""
    ${TEXT}    Strip String    ${TEXT}
    ${TEXT_LIMPO}    Remove Horario        ${TEXT}
    Log To Console    RESULTADO: ${TEXT_LIMPO}
    Log To Console    ESPERADO: Sobre o que você gostaria de conversar?
    Should Be Equal    ${TEXT_LIMPO}    Sobre o que você gostaria de conversar?
    Sleep    2s

Então o atendimento é encerrado
    Sleep    3
    # Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${LENGTH}    Get Length    ${MESSAGES_LIST}
    ${INDEX}    Evaluate    ${LENGTH} - 1

    ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]

    ${TEXT}    Remove String    ${TEXT}    \n    ""
    ${TEXT}    Strip String    ${TEXT}
    Log To Console    ${TEXT}
    ${TEXT_LIMPO}    Remove Horario        ${TEXT}
    Log To Console    RESULTADO: ${TEXT_LIMPO}
    Log To Console    ESPERADO: Obrigada por entrar em contato com a gente. Estamos por aqui sempre que precisar!Quer saber todas as novidades? Siga a Paca no Instagram. Um abraço da Pam
    Should Be Equal    ${TEXT_LIMPO}    Obrigada por entrar em contato com a gente. Estamos por aqui sempre que precisar!Quer saber todas as novidades? Siga a Paca no Instagram. Um abraço da Pam
    Sleep    2s
    
Quando a página carregue
    Wait Until Element Is Visible    ${INPUT_SEARCH}    60

Dado que, o input apareça
    Input Text    ${INPUT_SEARCH}    chatbot uat
    Sleep    5

Dado que, o chat apareça
    ${ABA_CHAT}    Get WebElements    xpath=//div[@role='listitem']
    ${LENGTH}    Get Length    ${ABA_CHAT}
    Click Element    ${ABA_CHAT}[0]
    Sleep    10

Então o chat é clicado
    Wait Until Element Is Visible    ${INPUT_MESSAGE}    10
    Input Text    ${INPUT_MESSAGE}    Oi
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Dado que, queira continuar com o atendimento
    Input Text    ${INPUT_MESSAGE}    1
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Dado que, não queira continuar com o atendimento
    Input Text    ${INPUT_MESSAGE}    2
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Dado que, o CPF é solicitado
    [Arguments]    ${CPF}
    Input Text    ${INPUT_MESSAGE}    ${CPF}
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Dado que, o queira digitar novamente o CPF
    Input Text    ${INPUT_MESSAGE}    1
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Dado que, queira falar com especialista
    Input Text    ${INPUT_MESSAGE}    3
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Dado que, é solicitado o nome
    Input Text    ${INPUT_MESSAGE}    victor hugo
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Dado que, é solicitado o email
    Input Text    ${INPUT_MESSAGE}    victor@gmail.com
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Dado, queira encerrar atendimento
    Input Text    ${INPUT_MESSAGE}    2
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Encerrar conversa
    Input Text    ${INPUT_MESSAGE}    stop
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10