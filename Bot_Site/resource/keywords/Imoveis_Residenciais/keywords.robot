*** Settings ***
Resource    ../common_keywords.robot
Resource    ../../variables/Imoveis_Residenciais/variables.robot
Library    Collections

*** Keywords ***

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


Dado que o usuário escolha "SP" no menu
    Clique no item do menu    SP

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

Então o bot deverá responder com a mensagem de imóveis disponíveis
    Sleep    5
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${MENSAGENS_LENGTH}    Evaluate    ${MENSAGENS_LENGTH} - 1
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 3
    ${ULTIMAS_TRES_MENSAGENS}    Create List

    @{MENSAGEM_ESPERADA_IMOVEIS}    Create List    Selecione qual deles deseja conhecer, por favor.    Na cidade que selecionou temos esse (s) imóvel (is) aqui, ${PRIMEIRO_NOME}. 👇    A Pacaembu está presente em mais de 50 cidades, mas cada uma delas é única pra gente!

    FOR    ${INDEX}    IN RANGE    ${MENSAGENS_LENGTH}    ${ULTIMAS_TRES_MENSAGENS_INDEX}    -1
        ${TEXT}    Get Text    ${MENSAGENS}[${INDEX}]
        Append To List    ${ULTIMAS_TRES_MENSAGENS}    ${TEXT}
    END

    Should Be Equal As Strings    ${ULTIMAS_TRES_MENSAGENS}    ${MENSAGEM_ESPERADA_IMOVEIS}

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


Dado que o usuário informe um email inválido sem @
    Enviar mensagem    Testegmail.com

Dado que o usuário informe um email inválido sem .
    Enviar mensagem    Teste@gmailcom

Dado que o usuário informe um email inválido sem .com
    Enviar mensagem    Teste@gmail.

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