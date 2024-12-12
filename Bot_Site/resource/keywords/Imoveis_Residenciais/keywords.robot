*** Settings ***
Resource    ../common_keywords.robot
Resource    ../../variables/Imoveis_Residenciais/variables.robot
Library    Collections
Library    OperatingSystem
Library    ../../../libs/ctrl_c.py
Library    ../../../libs/gerar_numero.py
Library    FakerLibrary    locale=pt_BR

*** Keywords ***

Apagar unidade de teste
   
    Logar na tela de unidade
    Pesquisar unidade
    Sleep    4s
    Apagar unidade
    Sleep    5s
    Close Browser

Apagar unidade
    ${ABRIR_UNIDADE}   Set Variable  xpath=//a[contains(@title,'Teste Elera Unidade') and contains(text(),'Teste Elera Unidade')]
    ${BOTAO_APAGAR}    Set Variable  xpath=//button[contains(@class,'slds-button slds-button_neutral') and contains(@name,'Delete')]

   Sleep    3s
   Click Element    ${ABRIR_UNIDADE}
   Sleep    5s
   Click Button    ${BOTAO_APAGAR}
    Sleep    5s
    Confirmar Deleção
    Sleep    5s
Confirmar Deleção
    ${CONFIRMAR_DELEÇÃO}    Set Variable    xpath=//button[contains(@class,'slds-button slds-button_neutral uiButton--default uiButton--brand uiButton forceActionButton')and contains(@title,'Delete')]
    Click Button    ${CONFIRMAR_DELEÇÃO}
Pesquisar unidade 
    
    Input Text   ${BARRA_DE_PESQUISA}    ${NOME_UNIDADE}
    Sleep    3s
    Press Keys    ${BARRA_DE_PESQUISA}    RETURN

Logar na tela de unidade 

    Open Browser  ${BASE_URL_UNIDAES}
    Sleep  3s
    Preencher campos
    Sleep  15s
   

Criar Nova Unidade
    [Documentation]    Abre o modal inicial e o formulário para a criação de uma unidade.

    ${BOTAO_NEW_UNIDADE}  Set Variable    xpath=//a[contains(@class,'forceActionLink') and contains(@title,'New')] 
    ${BOTAO_NEXT_UNIDADE}  Set Variable  xpath=/html/body/div[4]/div[2]/div/div[2]/div/div[2]/div/div/div[2]/div/button[2]
    Sleep  5s
    Click Element      ${BOTAO_NEW_UNIDADE}
    Sleep              5s
    Click Button       ${BOTAO_NEXT_UNIDADE}
    Sleep              4s
    Preencher formulario para criação de unidade
    Sleep              5s
    Close Browser

Preencher formulario para criação de unidade 

    ${PESQUISA_EMPREENDIMENTO}  Set Variable  xpath=//lightning-grouped-combobox//lightning-base-combobox-item[1]
    ${OPÇAO_TESTE_ELERA_BOT}  Set Variable  xpath=//table/tbody/tr/td[1]/a[contains(@title, 'Gojira') and contains(text(), 'Gojira')]
    ${INPUT_NOME_EMPREENDIMENTO}    Set Variable    xpath=//input[contains(@class,'slds-combobox__input') and contains(@placeholder,'Search Empreendimentos...')]
    ${INPUT_NOME_STATUS}   Set Variable  xpath=/html/body/div[4]/div[2]/div[2]/div[2]/div/div[2]/div/div/div/records-modal-lwc-detail-panel-wrapper/records-record-layout-event-broker/slot/records-lwc-detail-panel/records-base-record-form/div/div[2]/div/div/records-lwc-record-layout/forcegenerated-detailpanel_cbns__unidade__c___0125f000000ijcqaam___full___create___recordlayout2/records-record-layout-block/slot/records-record-layout-section[1]/div/div/dl/slot/records-record-layout-row[2]/slot/records-record-layout-item[2]/div/span/slot/records-record-picklist/records-form-picklist/lightning-picklist/lightning-combobox/div/div[1]/lightning-base-combobox/div/div/div[1]/button
    ${INPUT_NOME_UNIDADE}    Set Variable    xpath=//input[contains(@class,'slds-input')and contains(@name,'Name')]
   
    Input Text   ${INPUT_NOME_UNIDADE}    ${NOME_UNIDADE}
    Sleep  3s
    Input Text   ${INPUT_NOME_EMPREENDIMENTO}    ${NOME_EMPREENDIMENTO}
    Sleep   3s
    Click Element  ${PESQUISA_EMPREENDIMENTO}  
    Sleep  5s
    [Documentation]   clicando no empreendimento 
    Click Element   ${OPÇAO_TESTE_ELERA_BOT}
    Sleep   5s 
    Abrir comboBox
   
    Sleep  5s

 Abrir comboBox
    ${STATUS_COMBOBOX}    Get WebElements    ${STATUS_COMBOBOX_XPATH}
    Click Element    ${STATUS_COMBOBOX}[0]
    Sleep    2s
    FOR   ${i}  IN RANGE   7 
        Press Keys    None    ARROW_DOWN
    
    Sleep    1s
    END
    Press Keys    None    ENTER
    Sleep    4s

    ${BOTAO_SALVAR}  Set Variable    xpath=/html/body/div[4]/div[2]/div/div[2]/div/div[2]/div/div/div[1]/records-modal-lwc-detail-panel-wrapper/records-record-layout-event-broker/slot/records-lwc-detail-panel/records-base-record-form/div/div[2]/div/records-form-footer/div/div/div/runtime_platform_actions-actions-ribbon/ul/li[3]/runtime_platform_actions-action-renderer/runtime_platform_actions-executor-lwc-headless/slot[1]/slot/lightning-button/button

    Click Button  ${BOTAO_SALVAR}
        Sleep  3s

Dado que o usuário escolha "Imóveis Residenciais" no menu
    Clique no item do menu    Imóveis Residenciais

Dado que, o usuário escolha horário da manhã
    Sleep    15
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES_PERIODO}[-4]

Dado que, o usuário escolha horário da tarde
    Sleep    15
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES_PERIODO}[-3]

Dado que, o usuário escolha horário da noite
    Sleep    15
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES_PERIODO}[-2]

Dado que, o usuário escolha qualquer horário
    Sleep    20
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES_PERIODO}[-1]

Então o bot deve mostrar o menu de estados em ordem alfabetica
    ${MENSAGEM_ESPERADA}    Set Variable    
    ...    Legal! De qual estado gostaria de conhecer nossos imóveis, por favor? 😊
    Sleep    4s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${ULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]    
    
    ${ITENS_MENU}    Get WebElements    ${MENU_ITENS_XPATH}
    ${ITENS_MENU_LENGTH}    Get Length    ${ITENS_MENU}
    ${ULTIMO_ITEM}    Get Text    ${ITENS_MENU}[-1]
    ${ITENS_CONTENT}    Create List

    FOR  ${I}  IN RANGE    0    ${ITENS_MENU_LENGTH}
        ${TEXT}    Get Text    ${ITENS_MENU}[${I}]
        ${TEXT_LENGTH}    Get Length    ${TEXT}
        IF    ${TEXT_LENGTH} < 3
            Append To List    ${ITENS_CONTENT}    ${TEXT}
        END     
    END
    
    Sort List    ${ITENS_CONTENT}
    Should Be Equal    ${ULTIMA_MENSAGEM}    ${MENSAGEM_ESPERADA}
    Should Be Equal As Strings    ${ITENS_CONTENT}    ${UFS}
    Should Be Equal    ${ULTIMO_ITEM}    Voltar

E exibir uma lista com os empreendimentos com Unidades disponíveis exibindo 'Gojira'

     ${LISTA_EMPREENDIMENTOS}    Set Variable    xpath=//ul[contains(@class,'rich-menu-items')and contains(@data-aura-rendered-by,'2566:0')]

    ${EMPREENDIMENTOS}    Get Webelements    ${LISTA_EMPREENDIMENTOS}
    FOR    ${EMPREENDIMENTO}    IN    @{EMPREENDIMENTOS}
        ${texto}    Get Text    ${EMPREENDIMENTO}
        Run Keyword If    '${texto}' == 'Gojira'    Click Element    ${EMPREENDIMENTO}
    END



Dado que o usuário escolha "SP" no menu
    Clique no item do menu    SP
    
Dado que o usuário escolha "ZZ" no menu
    Clique no item do menu    ZZ

Dado que o usuário escolha o estado
    Clique no item do menu    ${ESTADO}

Redefinir Estado
    [Arguments]    ${NOVO_ESTADO}
    Set Global Variable    ${ESTADO}    ${NOVO_ESTADO}

Dado que o usuário escolha o municipio
    Clique no item do menu    ${MUNICIPIO}

Redefinir Municipio
    [Arguments]    ${NOVO_MUNICIPIO}
    Set Global Variable    ${MUNICIPIO}    ${NOVO_MUNICIPIO}

Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Sleep    2
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${ULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    Should Be Equal    ${ULTIMA_MENSAGEM}    Agora escolha a cidade.

Dado que o usuário escolha "Taubaté" no menu
    Clique no item do menu    Taubaté

Dado que o usuário escolha "Goiânia" no menu
    Clique no item do menu    Goiânia

Então o bot deverá responder com a mensagem de imóveis disponíveis
    Sleep    5
    Validar ultimas mensagens    Selecione qual deles deseja conhecer, por favor.    Na cidade que selecionou temos esse (s) imóvel (is) aqui, ${PRIMEIRO_NOME}. 👇    A Pacaembu está presente em mais de 50 cidades, mas cada uma delas é única pra gente!



Dado que o usuário escolha um imóvel no menu
    Clique no item do menu    ${NOME_IMOVEL}

Redefinir Imóvel
    [Arguments]    ${NOVO_IMOVEL}
    Set Global Variable    ${NOME_IMOVEL}    ${NOVO_IMOVEL}

Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Sleep    5
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${MENSAGENS_LENGTH}    Evaluate    ${MENSAGENS_LENGTH} - 1
    ${ULTIMAS_DUAS_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 2
    ${ULTIMAS_DUAS_MENSAGENS}    Create List

    @{MENSAGEM_IMOVEL}    Create List    Insira seu telefone whatsapp:    Aqui na Pacaembu você tem condições exclusivas de entrada e parcelamento. 🎊😚Pra te passar mais detalhes sobre o imóvel ${NOME_IMOVEL}, vou pedir alguns dados adicionais, combinado?

    FOR    ${INDEX}    IN RANGE    ${MENSAGENS_LENGTH}    ${ULTIMAS_DUAS_MENSAGENS_INDEX}    -1
        ${TEXT}    Get Text    ${MENSAGENS}[${INDEX}]
        ${TEXT}    Remove String    ${TEXT}    \n    ""
        Append To List    ${ULTIMAS_DUAS_MENSAGENS}    ${TEXT}
    END

    Should Be Equal As Strings    ${ULTIMAS_DUAS_MENSAGENS}    ${MENSAGEM_IMOVEL}

Dado que, o usuário não queira falar mais sobre outros assuntos
    Sleep    10
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES_PERIODO}[-1]

Dado que, o usuário queira falar mais sobre outros assuntos
    Sleep    10
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES_PERIODO}[-2]

Então o bot encerra a conversa
    Sleep    6s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${ULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    ${ULTIMA_MENSAGEM}    Strip String    ${ULTIMA_MENSAGEM}
    ${EXPECTED}    Set Variable    Obrigada por entrar em contato com a gente. Estamos por aqui sempre que precisar!${\n}${\n}Quero te convidar também a nos acompanhar pelo Instagram. Um abraço da Pam ❤️
    
    ${REPR_ULTIMA}    Evaluate    repr("""${ULTIMA_MENSAGEM}""")
    ${REPR_EXPECTED}    Evaluate    repr("""${EXPECTED}""")
    Log To Console    RESULTADO=${\n}${REPR_ULTIMA}${\n}
    Log To Console    ESPERADO=${\n}${REPR_EXPECTED}${\n}

    Should Be Equal    ${REPR_ULTIMA}    ${REPR_EXPECTED}

Dado que o usuário informe seu número
    Enviar mensagem    ${CELULAR}   

Então o bot deverá solicitar seu email
    Sleep    5s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${ULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    Should Be Equal    ${ULTIMA_MENSAGEM}    Insira seu e-mail:

Então o bot identifique o imóvel
    Sleep    25
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 3
    ${ULTIMAS_TRES_MENSAGENS}    Create List

    @{EXPECTED}    Create List    Vou pedir para que o corretor que te acompanhou siga com o seu atendimento, tá bem?    ${PRIMEIRO_NOME}, preciso apenas de mais uma informação, por favor. 🥰    Em qual horário você prefere que a gente retorne? É só selecionar uma opção abaixo.

    ${LENGTH_EXPECTED}    Get Length    ${EXPECTED}
    FOR    ${ELEMENTO}    IN RANGE    ${LENGTH_EXPECTED}
        ${NOVO_VALOR}    Evaluate    repr("""${EXPECTED[${ELEMENTO}]}""")
        Log To Console    ESPERADO${\n}${NOVO_VALOR}${\n}
        Set List Value    ${EXPECTED}    ${ELEMENTO}    ${NOVO_VALOR}
    END

    FOR    ${INDEX}    IN RANGE    ${ULTIMAS_TRES_MENSAGENS_INDEX}    ${MENSAGENS_LENGTH}
        ${TEXT}    Get Text    ${MENSAGENS}[${INDEX}]

        ${REPR_ULTIMA}    Evaluate    repr("""${TEXT}""")
        Log To Console    RESULTADO${\n}${REPR_ULTIMA}${\n}

        Append To List    ${ULTIMAS_TRES_MENSAGENS}    ${REPR_ULTIMA}
    END

    Should Be Equal As Strings    ${ULTIMAS_TRES_MENSAGENS}    ${EXPECTED}

Então o bot não identifique o imóvel
    Sleep    20
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 3
    ${ULTIMAS_TRES_MENSAGENS}    Create List
    
    @{EXPECTED}    Create List    Como você selecionou um imóvel diferente do primeiro contato, vou te encaminhar a um novo corretor, tá bem?    Para seguirmos, preciso de alguns dados adicionais. ✅    ${PRIMEIRO_NOME}, quando você pretende comprar sua casa?

    ${LENGTH_EXPECTED}    Get Length    ${EXPECTED}
    FOR    ${ELEMENTO}    IN RANGE    ${LENGTH_EXPECTED}
        ${NOVO_VALOR}    Evaluate    repr("""${EXPECTED[${ELEMENTO}]}""")
        Log To Console    ESPERADO${\n}${NOVO_VALOR}${\n}
        Set List Value    ${EXPECTED}    ${ELEMENTO}    ${NOVO_VALOR}
    END

    FOR    ${INDEX}    IN RANGE    ${ULTIMAS_TRES_MENSAGENS_INDEX}    ${MENSAGENS_LENGTH}
        ${TEXT}    Get Text    ${MENSAGENS}[${INDEX}]

        ${REPR_ULTIMA}    Evaluate    repr("""${TEXT}""")
        Log To Console    RESULTADO${\n}${REPR_ULTIMA}${\n}

        Append To List    ${ULTIMAS_TRES_MENSAGENS}    ${REPR_ULTIMA}
    END

    Should Be Equal As Strings    ${ULTIMAS_TRES_MENSAGENS}    ${EXPECTED}

Dado que o usuário informe seu email
    Enviar mensagem    ${EMAIL}

Dado que o usuário informe um email inválido com @@
    Enviar mensagem    Teste@@gmail.com

Dado que o usuário informe um email inválido sem @
    Enviar mensagem    Testegmail.com

Dado que o usuário informe um email inválido sem .
    Enviar mensagem    Teste@gmailcom

Dado que o usuário informe um email inválido sem .com
    Enviar mensagem    Teste@gmail.

Dado que o usuário informe um email inválido sem o final .com
    Enviar mensagem    Teste@gmail

Dado que o usuário informe um email inválido sem UserName
    Enviar mensagem    @gmail.com

Dado que o usuário informe um número com letras
    Enviar mensagem    11995ABCD13

Dado que o usuário informe um número faltando digitos
    Enviar mensagem    (11) 9951-301

Dado que o usuário informe seu número incorreto
    Enviar mensagem    (99) 99999-88888

Dado que o usuário informe seu número inválido
    Enviar mensagem    11-99513-01

Então o bot deverá exibir a mensagem de confusão
    Sleep    6s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${PENULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-2]
    ${PENULTIMA_MENSAGEM}    Remove String    ${PENULTIMA_MENSAGEM}    \n    ''
    Should Be Equal    ${PENULTIMA_MENSAGEM}    Poxa! Ainda não consegui te entender. 😩Vamos retornar para onde estávamos?OBS: Digite apenas quando pedirmos algum dado pessoal, por favor. Os campos apresentados são para seleção.

Então o bot deverá exibir a mensagem quando o usuário deseja comprar
    Sleep    5
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${PENULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    ${EXPECTED}    Set Variable    ${PRIMEIRO_NOME}, quando você pretende comprar sua casa?

    ${REPR_EXPECTED}    Evaluate    repr("""${EXPECTED}""")
    ${RESULT_MESSAGE_REPR}    Evaluate    repr("""${PENULTIMA_MENSAGEM}""")

    Should Be Equal    ${RESULT_MESSAGE_REPR}    ${REPR_EXPECTED}

Então o bot deverá exibir a mensagem se deseja morar ou investir
    Sleep    5s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${PENULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    ${EXPECTED}    Set Variable    Legal! E você vai comprar para morar ou investir?

    ${REPR_EXPECTED}    Evaluate    repr("""${EXPECTED}""")
    ${RESULT_MESSAGE_REPR}    Evaluate    repr("""${PENULTIMA_MENSAGEM}""")

    Should Be Equal    ${RESULT_MESSAGE_REPR}    ${REPR_EXPECTED}

Então o bot deverá exibir a mensagem se está trabalhando no momento
    Sleep    5s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${PENULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    ${EXPECTED}    Set Variable    Você está trabalhando no momento?

    ${REPR_EXPECTED}    Evaluate    repr("""${EXPECTED}""")
    ${RESULT_MESSAGE_REPR}    Evaluate    repr("""${PENULTIMA_MENSAGEM}""")

    Should Be Equal    ${RESULT_MESSAGE_REPR}    ${REPR_EXPECTED}

Então o bot deverá exibir a mensagem qual regime de trabalho
    Sleep    5s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${PENULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    ${EXPECTED}    Set Variable    Certo! Qual seria o tipo de regime de trabalho, ${PRIMEIRO_NOME}?

    ${REPR_EXPECTED}    Evaluate    repr("""${EXPECTED}""")
    ${RESULT_MESSAGE_REPR}    Evaluate    repr("""${PENULTIMA_MENSAGEM}""")

    Should Be Equal    ${RESULT_MESSAGE_REPR}    ${REPR_EXPECTED}

Então o bot deverá exibir a mensagem qual a renda familiar
    Sleep    5s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${PENULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    ${EXPECTED}    Set Variable    Entendi! Qual é a sua faixa de renda familiar (soma da renda das pessoas que irão morar com você)?

    ${REPR_EXPECTED}    Evaluate    repr("""${EXPECTED}""")
    ${RESULT_MESSAGE_REPR}    Evaluate    repr("""${PENULTIMA_MENSAGEM}""")

    Should Be Equal    ${RESULT_MESSAGE_REPR}    ${REPR_EXPECTED}

Então o bot deverá exibir a mensagem se possui FGTS
    Sleep    5s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${PENULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    ${EXPECTED}    Set Variable    Estamos quase lá, ${PRIMEIRO_NOME}... Você ou a pessoa que desejaria compor o financiamento tem FGTS? Caso não tenha FGTS, mas possua alguma reserva pode clicar em "Sim" também.

    ${REPR_EXPECTED}    Evaluate    repr("""${EXPECTED}""")
    ${RESULT_MESSAGE_REPR}    Evaluate    repr("""${PENULTIMA_MENSAGEM}""")

    Should Be Equal    ${RESULT_MESSAGE_REPR}    ${REPR_EXPECTED}

Então o bot deverá exibir a mensagem se possui restrição de crédito
    Sleep    5s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${PENULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    ${EXPECTED}    Set Variable    Você tem alguma restrição de crédito? Caso não se sinta à vontade em informar por aqui, tudo bem. 😊

    ${REPR_EXPECTED}    Evaluate    repr("""${EXPECTED}""")
    ${RESULT_MESSAGE_REPR}    Evaluate    repr("""${PENULTIMA_MENSAGEM}""")

    Should Be Equal    ${RESULT_MESSAGE_REPR}    ${REPR_EXPECTED}

Então o bot deverá exibir a mensagem de qual maneira quer receber contato
    Sleep    8
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${ULTIMAS_DUAS_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 2
    ${ULTIMAS_DUAS_MENSAGENS}    Create List
    
    @{EXPECTED}    Create List    Já temos todas as informações necessárias para seguir com o seu atendimento e fazer sua simulação!    Agora você pode conversar com um de nossos corretores por aqui ou, se preferir, receber o contato por WhatsApp. Como prefere seguir?

    ${LENGTH_EXPECTED}    Get Length    ${EXPECTED}
    FOR    ${ELEMENTO}    IN RANGE    ${LENGTH_EXPECTED}
        ${NOVO_VALOR}    Evaluate    repr("""${EXPECTED[${ELEMENTO}]}""")
        Log To Console    ESPERADO${\n}${NOVO_VALOR}${\n}
        Set List Value    ${EXPECTED}    ${ELEMENTO}    ${NOVO_VALOR}
    END

    FOR    ${INDEX}    IN RANGE    ${ULTIMAS_DUAS_MENSAGENS_INDEX}    ${MENSAGENS_LENGTH}
        ${TEXT}    Get Text    ${MENSAGENS}[${INDEX}]

        ${REPR_ULTIMA}    Evaluate    repr("""${TEXT}""")
        Log To Console    RESULTADO${\n}${REPR_ULTIMA}${\n}

        Append To List    ${ULTIMAS_DUAS_MENSAGENS}    ${REPR_ULTIMA}
    END

    Should Be Equal As Strings    ${ULTIMAS_DUAS_MENSAGENS}    ${EXPECTED}

Então o bot deverá exibir a mensagem de qual horário para entrar em contato
    Sleep    5s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${PENULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    ${EXPECTED}    Set Variable    Estamos quase lá... 🤩 Qual é o melhor horário para entrarmos em contato?

    ${REPR_EXPECTED}    Evaluate    repr("""${EXPECTED}""")
    ${RESULT_MESSAGE_REPR}    Evaluate    repr("""${PENULTIMA_MENSAGEM}""")

    Should Be Equal    ${RESULT_MESSAGE_REPR}    ${REPR_EXPECTED}

Enviar mensagem
    [Arguments]    ${MENSAGEM}
    Input Text    ${CHAT_INPUT}    ${MENSAGEM} 
    Press Keys    ${CHAT_INPUT}    ENTER

Dado que, o usuário selecione nos próximos 12 meses
    Sleep    5
    Clique no item do menu    Nos próximos 12 meses

Dado que, o usuário selecione Investir
    Sleep    5
    ${BOTOES}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES}[-1]

Dado que, o usuário concorde que trabalha
    Sleep    5
    ${BOTOES}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES}[-2]

Dado que, o usuário selecione CLT
    Sleep    5
    ${BOTOES}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES}[-3]

Dado que, o usuário selecione renda mensal de Até R$2.000
    Sleep    5
    ${BOTOES}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES}[-4]

Dado que, o usuário não queira Financiamento com o FGTS
    Sleep    5
    ${BOTOES}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES}[-1]

Dado que, o usuário não tenha Restrição de Crédito
    Sleep    5
    ${BOTOES}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES}[-3]

Dado que, o usuário queira Receber Contato
    Sleep    5
    ${BOTOES}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES}[-1]

Dado que o usuário escolha "Hell Raiser" no menu
    Clique no item do menu    Hell Raiser

Logar na tela de lead  
    Open Browser  ${BASE_URL_LEAD}
    Sleep  3s
    Preencher campos
    Sleep  15s

Procurar lead criado
    ${BARRA_DE_PESQUISA}    Set Variable    xpath=//div[contains(@class, 'slds-form-element')]/input[contains(@class, 'slds-input')]
    Click Element    ${BARRA_DE_PESQUISA}
    Input Text    ${BARRA_DE_PESQUISA}    ${PRIMEIRO_NOME} ${SOBRENOME}
    Sleep    3s
    Press Keys    ${BARRA_DE_PESQUISA}    ENTER
    Sleep    5s

Clicar no Lead
    ${LEAD_NAME}    Set Variable    xpath=//table/tbody/tr[1]/td[4]/span/a
    Click Element    ${LEAD_NAME}
    Sleep    5s
Então é exibido a mensagem de usuário já cadastrado
    Validar ultimas mensagens    ${PRIMEIRO_NOME}, vi que você falou com a gente recentemente.
    Press Keys    ${CHAT_INPUT}    ENTER

Dado que, o usuário clique em "ELERA" no menu de estados
    Sleep    2s
    Clique no item do menu    ELERA

Dado que, o usuário escolha a cidade de "Teste Atualização" no menu de cidades
    Sleep    2s
    Clique no item do menu    Teste Atualização

Dado que, o usuário clique no icone de setup
    Sleep    2s
    Wait Until Element Is Visible    ${SETUP_XPATH}    10s
    Click Element    ${SETUP_XPATH}
    Sleep    2s

E então clique no em "Developer Console"
    Wait Until Element Is Visible    ${DEV_CONSOLE_XPATH}    10s
    Click Element    ${DEV_CONSOLE_XPATH}
    Sleep    5s
    Switch Window    Developer Console
    Press Keys    None    ESC

E crie um empreedimento
    ${SCRIPT_EMPREENDIMENTO}    Get File    path=scripts\\empreendimento.apex
    Copy To Clipboard    ${SCRIPT_EMPREENDIMENTO}
    Press Keys    None    CTRL+e
    Sleep    4s
    Press Keys    ${DEVELOPER_CONSOLE}    CTRL+a    DELETE 
    Press Keys    ${DEVELOPER_CONSOLE}    CTRL+v
    Click Element    ${EXECUTE_BUTTON}
    Sleep    2s
    ${ERROR}    Run Keyword And Return Status    Element Should Be Visible    ${ERROR_XPATH}
    IF  ${ERROR}
        ${STACK_TRACE}    Get Text    xpath=//div[contains(text(), 'Line')]
        Fail    O script falhou em sua execução: ${STACK_TRACE}    
    END

Então o bot deverá exibir o novo empreendimento cadastrado
    Efetuar Login
    Marco Zero | Ramificação ainda não é cliente
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Dado que, o usuário clique em "ELERA" no menu de estados
    Sleep    2s
    Clique no item do menu    Teste Atualização
    Sleep    5s
    ${ITENS_MENU}    Get WebElements    ${MENU_ITENS_XPATH}
    ${ITENS_LENGHT}    Get Length    ${ITENS_MENU}
    ${ULTIMO_ITEM}    Get Text    ${ITENS_MENU}[-1]
    Should Be Equal    ${ULTIMO_ITEM}    Voltar
    ${PENULTIMO_INDICE}    Evaluate    ${ITENS_LENGHT} - 2
    ${QTD_EMPREENDIMENTOS}    Set Variable    0
    ${ITEM_EXISTE}    Set Variable    False
    FOR  ${INDEX}  IN RANGE    ${PENULTIMO_INDICE}    0    -1   
        ${MENU_CONTENT}    Get Text    ${ITENS_MENU}[${INDEX}]
        IF  '${MENU_CONTENT}' == 'Voltar'
            ${INDICE_VOLTAR}    Set Variable    ${INDEX}
            ${ITEM_EXISTE}    Set Variable    True
            BREAK
        END
        ${QTD_EMPREENDIMENTOS}    Evaluate    ${QTD_EMPREENDIMENTOS} + 1
    END
    Run Keyword If    '${ITEM_EXISTE}' == 'False'    Fail    Opção de voltar não foi encontrado
    Should Be Equal As Integers    ${QTD_EMPREENDIMENTOS}    2
    Sleep    10s

Dado que o usuário escolha a cidade "Lins" no menu
    Clique no item do menu    Lins

Dado que o usuário escolha um empreendimento com fotos
    Clique no item do menu    VIDA NOVA LINENSE
    Set Global Variable    ${NOME_IMOVEL}    VIDA NOVA LINENSE
    Sleep    5s

Dado que o usuário escolha um empreendimento sem fotos
    Clique no item do menu    VIDA NOVA BOULEVARD
    Set Global Variable    ${NOME_IMOVEL}    VIDA NOVA BOULEVARD
    Sleep    5s

Então o bot apresenta as informações do empreendimento
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${TEXTO}    Get Text    ${MENSAGENS}[-3]
    Should Contain    ${TEXTO}    Imagem não disponível no momento
    
Então o bot apresenta as imagens da unidade
    Element Should Be Visible    //span[contains(text(), 'Dormitorios')]//img
    ${IMAGENS}    Get WebElements    //span[contains(text(), 'Dormitorios')]//img
    ${QTD_IMAGENS}    Get Length    ${IMAGENS}
    Should Be Equal As Integers    ${QTD_IMAGENS}    3

Dado que o usuário informe um número aleartório
    ${NUMERO}    Gerar Numero Aleatório
    Enviar mensagem    ${NUMERO}

Dado que o usuário informe um email aleartório
    ${EMAIL}    FakerLibrary.Email
    Enviar mensagem    ${EMAIL}

Então o bot deverá perguntar quando pretende comprar a casa
    Sleep    10s
    Validar ultimas mensagens    ${PRIMEIRO_NOME}, quando você pretende comprar sua casa?

E mostrar as opções de meses no menu
    Validar itens no menu    Não tenho previsão    Nos próximos 12 meses    Nos próximos 6 meses    Nos próximos 3 meses

Dado que, o usuário clique em "Nos próximos 3 meses"
    Clique no item do menu    Nos próximos 3 meses

Dado que, o usuário clique em "Nos próximos 6 meses"
    Clique no item do menu    Nos próximos 6 meses

Dado que, o usuário clique em "Nos próximos 12 meses"
    Clique no item do menu    Nos próximos 12 meses

Dado que, o usuário clique em "Não tenho previsão"
    Clique no item do menu    Não tenho previsão

Então o bot deverá perguntar se pretende morar ou investir
    Sleep    3s
    Validar ultimas mensagens    Legal! E você vai comprar para morar ou investir?

E oferecer as opções de resposta "Morar" e "Investir"
    Valide os botões    Morar    Investir
    
Dado que, o usuário clique no botão "Morar"
    Clique no botão    Morar

Dado que, o usuário clique no botão "Investir"
    Clique no botão    Investir

Então o bot deverá perguntar se o usuário está trabalhando no momento
    Sleep    5s
    Validar ultimas mensagens    Você está trabalhando no momento?
    
E oferecer as opções de resposta "Estou aposentado(a)", "Sim" e "Não"
    Valide os botões    Estou aposentado (a)    Sim    Não

Então o bot deverá perguntar se o usuário pretende fazer composição de renda
    Sleep    5s
    Validar ultimas mensagens    Certo! E você pretende fazer a composição de renda com outras pessoas que estão trabalhando, ${PRIMEIRO_NOME}?
    
    
Dado que o usuário clique no botão "Sim"
    Clique no botão    Sim

Então o bot deverá perguntar o regime de trabalho do usuário
    Sleep    7s
    Validar ultimas mensagens    Certo! Qual seria o tipo de regime de trabalho, ${PRIMEIRO_NOME}?

E oferecer as opções de resposta "CLT", "PJ" e "Autônomo"
    Valide os botões    CLT    PJ    Autônomo

Dado que, o usuário clique no botão "CLT"
    Clique no botão    CLT

Dado que, o usuário clique no botão "PJ"
    Clique no botão    PJ

Dado que, o usuário clique no botão "Autônomo"
    Clique no botão    Autônomo

Então o bot deverá perguntar a faixa de renda familiar do usuário
    Sleep    5s
    Validar ultimas mensagens    Entendi! Qual é a sua faixa de renda familiar (soma da renda das pessoas que irão morar com você)?

E oferecer as opções de resposta "Até R$2.000", "De R$2.000,01 a R$2.640", "De R$2.640,01 a R$4.400" e "Acima de R$4.400,01"
    Valide os botões        Até R$2.000    De R$2.000,01 a R$2.640    De R$2.640,01 a R$4.400    Acima de R$4.400,01

Dado que o usuário clique no botão "Até R$2.000"
    Clique no botão    Até R$2.000

Dado que o usuário clique no botão "De R$2.000,01 a R$2.640"
    Clique no botão    De R$2.000,01 a R$2.640

Dado que o usuário clique no botão "De R$2.640,01 a R$4.400"
    Clique no botão    De R$2.640,01 a R$4.400

Dado que o usuário clique no botão "Acima de R$4.400,01"
    Clique no botão    Acima de R$4.400,01

Então o bot deverá perguntar se o usuário ou algum envolvido na compra possui FGTS
    Sleep    3s
    Validar ultimas mensagens    Estamos quase lá, ${PRIMEIRO_NOME}... Você ou a pessoa que desejaria compor o financiamento tem FGTS? Caso não tenha FGTS, mas possua alguma reserva pode clicar em "Sim" também.

E oferecer as opções de resposta "Sim" e "Não"
    Valide os botões    Sim    Não

Dado que, o usuário clique em "Não"
    Clique no botão    Não

Então o bot deverá perguntar se o usuário possui alguma restrição de crédito
    Sleep    3s
    Validar ultimas mensagens    Você tem alguma restrição de crédito? Caso não se sinta à vontade em informar por aqui, tudo bem. 😊

Então o bot deverá perguntar se o usuário quer entrar em contato com um corretor
    Sleep    7s
    Validar ultimas mensagens    
    ...    Agora você pode conversar com um de nossos corretores por aqui ou, se preferir, receber o contato por WhatsApp. Como prefere seguir?
    ...    Já temos todas as informações necessárias para seguir com o seu atendimento e fazer sua simulação!

E oferecer as opções de resposta "Sim", "Não" e "Prefiro não informar"
    Valide os botões    Não    Prefiro não informar    Sim

E oferecer as opções de resposta "Falar com corretor agora" e "Receber contato"
    Valide os botões    Falar com corretor agora    Receber contato

Dado que, o usuário no botão "Receber contato"
    Clique no botão    Receber contato

Dado que, o usuário no botão "Falar com corretor agora"
    Clique no botão    Falar com corretor agora

Então o bot devera apresentar a mensagem de encaminhamento
    Sleep    2s
    Validar ultimas mensagens    Vai ser um prazer te atender! 🤩Estou te encaminhando a um dos nossos corretores, tá bem?Um minuto, por favor.

Então o bot deverá perguntar o melhor horário para entrar em contato
    Sleep    3s
    Validar ultimas mensagens    Estamos quase lá... 🤩 Qual é o melhor horário para entrarmos em contato?

Dado que, o usuário clique no botão "Manhã"
    Clique no botão    Manhã

Dado que, o usuário clique no botão "Tarde"
    Clique no botão    Tarde

Dado que, o usuário clique no botão "Noite"
    Clique no botão    Noite

Dado que, o usuário clique no botão "Qualquer horário"
    Clique no botão    Qualquer horário

Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    Sleep    3s
    Validar ultimas mensagens
    ...    Posso te ajudar em outro assunto, ${PRIMEIRO_NOME}?
    ...    Certo, ${PRIMEIRO_NOME}. Muito obrigada pela confirmação!Em breve, um de nossos corretores entrará em contato com mais detalhes sobre o imóvel que deseja conhecer, combinado? 😊

Dado que, o usuário clique no botão "Não"
    Clique no botão    Não

Dado que, o usuário clique no botão "R$1 a R$500"
    Clique no botão    R$1 a R$500

Dado que, o usuário clique no botão "R$500,1 a R$1.000"
    Clique no botão    R$500,01 a R$1.000

Dado que, o usuário clique no botão "Acima de R$1.000,01"
    Clique no botão    Acima de R$1.000,01

Dado que o usuário clique no botão "Prefiro não informar"
    Clique no botão    Prefiro não informar

Então o bot deverá responder com "Não tem problema."
    Sleep    3s
    Validar ultimas mensagens  
    ...    Agora você pode conversar com um de nossos corretores por aqui ou, se preferir, receber o contato por WhatsApp. Como prefere seguir?
    ...    Já temos todas as informações necessárias para seguir com o seu atendimento e fazer sua simulação!    
    ...    Não tem problema.

Então o bot deverá apresentar a mensagem de encerramento 
    Sleep    3s
    Validar ultimas mensagens     Obrigada por entrar em contato com a gente. Estamos por aqui sempre que precisar!Quero te convidar também a nos acompanhar pelo Instagram. Um abraço da Pam ❤️

Então o bot deverá perguntar o valor da restrição de crédito
    Validar ultimas mensagens    Certo! Poderia nos informar a faixa de valor, por favor?

E oferecer as opções de resposta "R$1 a R$500", "R$500,01 a R$1.000" e "Acima de R$1.000,01"
    Validar itens no menu    R$1 a R$500    R$500,01 a R$1.000    Acima de R$1.000,01

Então o bot deverá apresentar a mensagem "Sobre o que gostaria de conversar?"
    Validar ultimas mensagens    Certo, ${PRIMEIRO_NOME}! Sobre o que gostaria de conversar? 🥰

Imóveis residênciais | Comprar imóvel
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha a cidade "Lins" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um empreendimento sem fotos
    Então o bot apresenta as informações do empreendimento
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe um número aleartório
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email aleartório
    
Imóveis residênciais | Compra nos próximos 3 meses
    Então o bot deverá perguntar quando pretende comprar a casa
    E mostrar as opções de meses no menu
    Dado que, o usuário clique em "Nos próximos 3 meses"

Imóveis residênciais | Compra nos próximos 6 meses
    Então o bot deverá perguntar quando pretende comprar a casa
    E mostrar as opções de meses no menu
    Dado que, o usuário clique em "Nos próximos 6 meses"

Imóveis residênciais | Compra nos próximos 12 meses
    Então o bot deverá perguntar quando pretende comprar a casa
    E mostrar as opções de meses no menu
    Dado que, o usuário clique em "Nos próximos 12 meses"

Imóveis residênciais | Sem previsão
    Então o bot deverá perguntar quando pretende comprar a casa
    E mostrar as opções de meses no menu
    Dado que, o usuário clique em "Não tenho previsão"

Imóveis residênciais | Morar
    Então o bot deverá perguntar se pretende morar ou investir
    E oferecer as opções de resposta "Morar" e "Investir"
    Dado que, o usuário clique no botão "Morar"

Imóveis residênciais | Investir
    Então o bot deverá perguntar se pretende morar ou investir
    E oferecer as opções de resposta "Morar" e "Investir"
    Dado que, o usuário clique no botão "Investir"

Imóveis residênciais | Renda até R$ 2.000
    Então o bot deverá perguntar a faixa de renda familiar do usuário
    E oferecer as opções de resposta "Até R$2.000", "De R$2.000,01 a R$2.640", "De R$2.640,01 a R$4.400" e "Acima de R$4.400,01"
    Dado que o usuário clique no botão "Até R$2.000"

Imóveis residênciais | Renda menor que R$2.640
    Então o bot deverá perguntar a faixa de renda familiar do usuário
    E oferecer as opções de resposta "Até R$2.000", "De R$2.000,01 a R$2.640", "De R$2.640,01 a R$4.400" e "Acima de R$4.400,01"
    Dado que o usuário clique no botão "De R$2.000,01 a R$2.640"

Imóveis residênciais | Renda menor que R$4.400,0
    Então o bot deverá perguntar a faixa de renda familiar do usuário
    E oferecer as opções de resposta "Até R$2.000", "De R$2.000,01 a R$2.640", "De R$2.640,01 a R$4.400" e "Acima de R$4.400,01"
    Dado que o usuário clique no botão "De R$2.640,01 a R$4.400"

Imóveis residênciais | Renda maior que R$4.400,0
    Então o bot deverá perguntar a faixa de renda familiar do usuário
    E oferecer as opções de resposta "Até R$2.000", "De R$2.000,01 a R$2.640", "De R$2.640,01 a R$4.400" e "Acima de R$4.400,01"
    Dado que o usuário clique no botão "Acima de R$4.400,01"
    
Imóveis residênciais | Lead empregado
    Então o bot deverá perguntar se o usuário está trabalhando no momento
    E oferecer as opções de resposta "Estou aposentado(a)", "Sim" e "Não"
    Dado que o usuário clique no botão "Sim"

Imóveis residênciais | Lead desempregado
    Então o bot deverá perguntar se o usuário está trabalhando no momento
    E oferecer as opções de resposta "Estou aposentado(a)", "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"

Imóveis residênciais | Com composição de renda
    Então o bot deverá perguntar se o usuário pretende fazer composição de renda
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que o usuário clique no botão "Sim"

Imóveis residênciais | Regime de trabalho CLT
    Então o bot deverá perguntar o regime de trabalho do usuário
    E oferecer as opções de resposta "CLT", "PJ" e "Autônomo"
    Dado que, o usuário clique no botão "CLT"

Imóveis residênciais | Regime de trabalho PJ
    Então o bot deverá perguntar o regime de trabalho do usuário
    E oferecer as opções de resposta "CLT", "PJ" e "Autônomo"
    Dado que, o usuário clique no botão "PJ"

Imóveis residênciais | Regime de trabalho Autônomo
    Então o bot deverá perguntar o regime de trabalho do usuário
    E oferecer as opções de resposta "CLT", "PJ" e "Autônomo"
    Dado que, o usuário clique no botão "Autônomo"

Imóveis residênciais | Sem FGTS
    Então o bot deverá perguntar se o usuário ou algum envolvido na compra possui FGTS
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique em "Não"

Imóveis residênciais | Com FGTS ou reserva
    Então o bot deverá perguntar se o usuário ou algum envolvido na compra possui FGTS
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que o usuário clique no botão "Sim"

Imóveis residênciais | Sem restrição de crédito
    Então o bot deverá perguntar se o usuário possui alguma restrição de crédito
    E oferecer as opções de resposta "Sim", "Não" e "Prefiro não informar"
    Dado que, o usuário clique em "Não"

Imóveis residênciais | Com restrição de crédito
    Então o bot deverá perguntar se o usuário possui alguma restrição de crédito
    E oferecer as opções de resposta "Sim", "Não" e "Prefiro não informar"
    Dado que o usuário clique no botão "Sim"

Imóveis residênciais | Prefere não informar a restrição
    Então o bot deverá perguntar se o usuário possui alguma restrição de crédito
    E oferecer as opções de resposta "Sim", "Não" e "Prefiro não informar"
    Dado que o usuário clique no botão "Prefiro não informar"
    Então o bot deverá responder com "Não tem problema."

Imóveis residênciais | Restrição de R$1 a R$500
    E oferecer as opções de resposta "R$1 a R$500", "R$500,01 a R$1.000" e "Acima de R$1.000,01"
    Dado que, o usuário clique no botão "R$1 a R$500"

Imóveis residênciais | Restrição de R$500,1 a R$ 1.000
    E oferecer as opções de resposta "R$1 a R$500", "R$500,01 a R$1.000" e "Acima de R$1.000,01"
    Dado que, o usuário clique no botão "R$500,1 a R$ 1.000"

Imóveis residênciais | Restrição acima de R$ 1.000
    E oferecer as opções de resposta "R$1 a R$500", "R$500,01 a R$1.000" e "Acima de R$1.000,01"
    Dado que, o usuário clique no botão "Acima de R$1.000,01"

Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar se o usuário quer entrar em contato com um corretor
    E oferecer as opções de resposta "Falar com corretor agora" e "Receber contato"
    Dado que, o usuário no botão "Receber contato"

Imóveis residênciais | Falar com o corretor agora
    Então o bot deverá perguntar se o usuário quer entrar em contato com um corretor
    E oferecer as opções de resposta "Falar com corretor agora" e "Receber contato"
    Dado que, o usuário no botão "Falar com corretor agora"
    Então o bot devera apresentar a mensagem de encaminhamento
