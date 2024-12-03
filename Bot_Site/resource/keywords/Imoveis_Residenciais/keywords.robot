*** Settings ***
Resource    ../common_keywords.robot
Resource    ../../variables/Imoveis_Residenciais/variables.robot
Library    Collections

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

Dado que, o usuário escolhe horário da tarde
    Sleep    20
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    ${LENGTH}    Get Length    ${BOTOES_PERIODO}
    Click Element    ${BOTOES_PERIODO}[-3]
    
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

Dado que, o usuário não valide a presença
    Sleep    10
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    ${LENGTH}    Get Length    ${BOTOES_PERIODO}
    Click Element    ${BOTOES_PERIODO}[-1]

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
    Sleep    20
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${MENSAGENS_LENGTH}    Evaluate    ${MENSAGENS_LENGTH} - 1
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 3
    ${ULTIMAS_TRES_MENSAGENS}    Create List
    
    @{EXPECTED}    Create List    Vou pedir para que o corretor que te acompanhou siga com o seu atendimento, tá bem?    ${PRIMEIRO_NOME}, preciso apenas de mais uma informação, por favor. 🥰    Em qual horário você prefere que a gente retorne? É só selecionar uma opção abaixo.

    FOR    ${ELEMENTO}    IN RANGE    ${len(${EXPECTED})}
        ${NOVO_VALOR}    Evaluate    repr("""${EXPECTED[${ELEMENTO}]}""")
        Log To Console    ESPERADO${\n}${NOVO_VALOR}${\n}
        Set List Value    ${EXPECTED}    ${ELEMENTO}    ${NOVO_VALOR}
    END

    FOR    ${INDEX}    IN RANGE    ${MENSAGENS_LENGTH}    ${ULTIMAS_TRES_MENSAGENS_INDEX}    -1
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
    ${MENSAGENS_LENGTH}    Evaluate    ${MENSAGENS_LENGTH} - 1
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 3
    ${ULTIMAS_TRES_MENSAGENS}    Create List
    
    @{EXPECTED}    Create List    Vou pedir para que o corretor que te acompanhou siga com o seu atendimento, tá bem?    ${PRIMEIRO_NOME}, preciso apenas de mais uma informação, por favor. 🥰    Em qual horário você prefere que a gente retorne? É só selecionar uma opção abaixo.

    FOR    ${ELEMENTO}    IN RANGE    ${len(${EXPECTED})}
        ${NOVO_VALOR}    Evaluate    repr("""${EXPECTED[${ELEMENTO}]}""")
        Log To Console    ESPERADO${\n}${NOVO_VALOR}${\n}
        Set List Value    ${EXPECTED}    ${ELEMENTO}    ${NOVO_VALOR}
    END

    FOR    ${INDEX}    IN RANGE    ${MENSAGENS_LENGTH}    ${ULTIMAS_TRES_MENSAGENS_INDEX}    -1
        ${TEXT}    Get Text    ${MENSAGENS}[${INDEX}]

        ${REPR_ULTIMA}    Evaluate    repr("""${TEXT}""")
        Log To Console    RESULTADO${\n}${REPR_ULTIMA}${\n}

        Append To List    ${ULTIMAS_TRES_MENSAGENS}    ${REPR_ULTIMA}
    END

    Should Be Equal As Strings    ${ULTIMAS_TRES_MENSAGENS}    ${EXPECTED}

Dado que o usuário informe seu email
    Enviar mensagem    ${EMAIL}

Dado que o usuário informe seu número incorreto
    Enviar mensagem    (99) 99999-88888

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

Então o bot deverá exibir a mensagem de confusão
    Sleep    6s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${PENULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-2]
    ${PENULTIMA_MENSAGEM}    Remove String    ${PENULTIMA_MENSAGEM}    \n    ''
    Should Be Equal    ${PENULTIMA_MENSAGEM}    Poxa! Ainda não consegui te entender. 😩Vamos retornar para onde estávamos?OBS: Digite apenas quando pedirmos algum dado pessoal, por favor. Os campos apresentados são para seleção.

Enviar mensagem
    [Arguments]    ${MENSAGEM}
    Input Text    ${CHAT_INPUT}    ${MENSAGEM} 
    Press Keys    ${CHAT_INPUT}    ENTER

Dado que, o usuário selecione nos próximos 12 meses
    Sleep    10
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    ${LENGTH}    Get Length    ${BOTOES_PERIODO}
    Click Element    ${BOTOES_PERIODO}[-2]

Dado que, o usuário selecione Investir
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    ${LENGTH}    Get Length    ${BOTOES_PERIODO}
    Click Element    ${BOTOES_PERIODO}[-1]

Dado que, o usuário concorde que trabalha
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    ${LENGTH}    Get Length    ${BOTOES_PERIODO}
    Click Element    ${BOTOES_PERIODO}[-2]

Dado que, o usuário selecione CLT
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    ${LENGTH}    Get Length    ${BOTOES_PERIODO}
    Click Element    ${BOTOES_PERIODO}[-2]

Dado que, o usuário selecione renda mensal de Até R$2.000
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    ${LENGTH}    Get Length    ${BOTOES_PERIODO}
    Click Element    ${BOTOES_PERIODO}[-4]

Dado que, o usuário não queira Financiamento com o FGTS
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    ${LENGTH}    Get Length    ${BOTOES_PERIODO}
    Click Element    ${BOTOES_PERIODO}[-2]

Dado que, o usuário não tenha Restrição de Crédito
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    ${LENGTH}    Get Length    ${BOTOES_PERIODO}
    Click Element    ${BOTOES_PERIODO}[-2]

Dado que, o usuário queira Receber Contato
    ${BOTOES_PERIODO}    Get WebElements    ${BOTOES_XPATH}
    ${LENGTH}    Get Length    ${BOTOES_PERIODO}
    Click Element    ${BOTOES_PERIODO}[-1]

Dado que o usuário escolha "Hell Raiser" no menu
    Clique no item do menu    Hell Raiser

Logar na tela de lead
    ${BASE_URL_LEAD}=    Set Variable    
    Open Browser  ${BASE_URL_LEAD}
    Sleep  3s
    Preencher campos
    Sleep  15s

Então é exibido a mensagem de usuário já cadastrado
    Validar ultimas mensagens    ${PRIMEIRO_NOME}, vi que você falou com a gente recentemente.

    Press Keys    ${CHAT_INPUT}    ENTER
