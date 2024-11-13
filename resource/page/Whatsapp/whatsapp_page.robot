*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${INPUT_SEARCH}    //*[@id="side"]/div[1]/div/div[2]/div[2]/div/div/p
${INPUT_MESSAGE}    xpath=//*[@id="main"]/footer/div[1]/div/span/div/div[2]/div[1]/div/div[1]/p
@{EXPECTED_MESSAGES}    Olá! Tudo bem? Sou a Pam, Atendente Virtual da Pacaembu, especialista no desenvolvimento de bairros planejados. 🏠 Tô muito feliz em falar com você!
...    Ao seguir com o atendimento, você está concordando com a nossa Política de privacidade. Se estiver de acordo, é só clicar em "concordo".
...    Infelizmente, sem o seu aceite ao termo não posso continuar com o atendimento por aqui. 😕
...    Mas, você ainda pode ligar para a nossa Central de Relacionamento, pelo número 0800 730 2020, ou me chamar novamente dando o aceite ao termo, combinado? Um abraço da Pam ❤️
${MESSAGES_XPATH}    xpath=//div[contains(@class, 'copyable-text')]/div/span[@class='ltr']/span

*** Keywords ***
Validar boas vindas
    Sleep    10
    # Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${LENGTH}    Get Length    ${MESSAGES_LIST}
    Log To Console    LENGTH === ${LENGTH}
    ${INDEX}    Evaluate    ${LENGTH} - 3
    ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]
    # Log To Console    ELEMENT === ${MESSAGES_XPATH}[${INDEX}]

    # FOR  ${INDEX}    IN RANGE    ${LENGTH}
    #     ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]
    #     ${TEXT}    Strip String    ${TEXT}
    #     ${TEXT}    Remove String    ${TEXT}    \s+    ""
    #     ${EXPECTED}    Replace String    ${EXPECTED_MESSAGES}[${INDEX}]    \s+    ""
    #     Log To Console   RESULTADO: ${TEXT}
    #     Log To Console    ESPERADO: ${EXPECTED_MESSAGES}[${INDEX}]
    #     Should Be Equal    ${TEXT}    ${EXPECTED}
    # END
    Sleep    2s

Esperar as conversas aparecerem
    Wait Until Element Is Visible    ${INPUT_SEARCH}    60

Buscar chat na pesquisar
    Input Text    ${INPUT_SEARCH}    chatbot uat
    Sleep    5

Clicar na conversa
    ${LIST_ITEMS}    Get WebElements    xpath=//div[@role='listitem']
    ${LENGTH}    Get Length    ${LIST_ITEMS}
    Click Element    ${LIST_ITEMS}[0]
    Sleep    10

Esperar o chat abrir e mandar oi
    Wait Until Element Is Visible    ${INPUT_MESSAGE}    10
    Input Text    ${INPUT_MESSAGE}    Oi
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Nao concordar
    Input Text    ${INPUT_MESSAGE}    2
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    15

Concordar
    # @{TERMS}    Get WebElements   xpath=//div[contains(@class, '_ahei')]
    Input Text    ${INPUT_MESSAGE}    1
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Continuar Atendimento
    Input Text    ${INPUT_MESSAGE}    1
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Nao Continuar Atendimento
    Input Text    ${INPUT_MESSAGE}    2
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Preencher CPF Invalido
    Input Text    ${INPUT_MESSAGE}    43511626862
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10
    
Preencher CPF
    Input Text    ${INPUT_MESSAGE}    01658969146
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Preencher CPF novamente
    Input Text    ${INPUT_MESSAGE}    1
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Falar com Atendente
    Input Text    ${INPUT_MESSAGE}    3
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Preencher Nome
    Input Text    ${INPUT_MESSAGE}    victor hugo
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Preencher Email
    Input Text    ${INPUT_MESSAGE}    victor@gmail.com
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10
    

Encerrar Atendimento
    Input Text    ${INPUT_MESSAGE}    2
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10

Encerrar conversa
    Input Text    ${INPUT_MESSAGE}    stop
    Press Keys    ${INPUT_MESSAGE}    ENTER
    Sleep    10