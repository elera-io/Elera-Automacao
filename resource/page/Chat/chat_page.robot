*** Settings ***
Resource    ../../keywords/common_keywords.robot
Resource    ../page.robot

*** Variables ***
${MESSAGES_XPATH}    xpath=//div[contains(@class,'agent') and contains(@class,'chatMessage')]
@{EXPECTED_MESSAGES}    Olá! Tudo bem? Sou a Pam, Atendente Virtual da Pacaembu, especialista no desenvolvimento de bairros planejados. 🏠 Tô muito feliz em falar com você!
...    Ao seguir com o atendimento, você está concordando com a nossa Política de privacidade. Se estiver de acordo, é só clicar em "concordo".
...    Infelizmente, sem o seu aceite ao termo não posso continuar com o atendimento por aqui. 😕
...    Mas, você ainda pode ligar para a nossa Central de Relacionamento, pelo número 0800 730 2020, ou me chamar novamente dando o aceite ao termo, combinado? Um abraço da Pam ❤️

*** Keywords ***
Validar mensagens de boas vindas
    Sleep    2s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}

    FOR  ${INDEX}    IN RANGE    1    2
        ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]
        ${TEXT}    Strip String    ${TEXT}
        ${TEXT}    Remove String    ${TEXT}    \s+    ""
        ${EXPECTED}    Replace String    ${EXPECTED_MESSAGES}[${INDEX}]    \s+    ""
        Log To Console   RESULTADO: ${TEXT}
        Log To Console    ESPERADO: ${EXPECTED_MESSAGES}[${INDEX}]
        Should Be Equal    ${TEXT}    ${EXPECTED}
    END
    Sleep    2s

Nao concordar
    Wait Until Element Is Visible    xpath=//span[contains(@class,'bBody') and contains(@class,'label')]    timeout=10s
    ${SPANS}    Get WebElements    xpath=//span[contains(@class,'bBody') and contains(@class,'label')]
    Click Element    ${SPANS}[1]

Validar Respostas
    Sleep    7s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    
     FOR  ${INDEX}    IN RANGE    2    4
        ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]
        ${TEXT}    Remove String    ${TEXT}    \s+    ""
        ${EXPECTED}    Replace String    ${EXPECTED_MESSAGES}[${INDEX}]    \s+    ""
        Log To Console   RESULTADO: ${TEXT}
        Log To Console    ESPERADO: ${EXPECTED_MESSAGES}[${INDEX}]
        Should Be Equal    ${TEXT}    ${EXPECTED}
    END
    Sleep    2s