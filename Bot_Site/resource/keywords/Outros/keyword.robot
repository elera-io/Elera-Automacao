*** Settings ***
Resource    ../../variables/Outros/variables.robot

*** Keywords ***
Marco Zero | Ramificação ainda não é cliente | Outros
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
    Dado que o usuário escolha "Outros" no menu

Dado que o usuário escolha "Outros" no menu
    Clique no item do menu    Outros

Então o bot deve exibir a lista de outros assuntos
    Sleep    10s
    Validar ultimas mensagens    Legal, ${PRIMEIRO_NOME}! Entendi que quer falar sobre outros assuntos, né? Selecione uma opção abaixo que melhor descreva o que precisa, por favor. 🥰

    @{CONTEUDO_ESPERADO_ITENS}    Set Variable    Voltar    Trabalhe conosco    Vendas sua área    Seja um fornecedor    Lotes comerciais
    Validar itens no menu    @{CONTEUDO_ESPERADO_ITENS}
    
Dado que o usuário escolha "Lotes comerciais" no menu
    Clique no item do menu    Lotes comerciais

Dado que o usuário escolha "Seja um fornecedor" no menu
    Clique no item do menu    Seja um fornecedor

Dado que o usuário escolha "Venda sua área" no menu
    Clique no item do menu    Venda sua Área

Dado que o usuário escolha "Trabalhe conosco" no menu
    Clique no item do menu    Trabalhe conosco

Dado que o usuário escolha "Voltar" no menu
    Clique no item do menu    Voltar

Então o bot informa sobre os Lotes Comerciais
    Sleep    15
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 5
    ${ULTIMAS_TRES_MENSAGENS}    Create List

    @{EXPECTED}    Create List
    ...    Nossos lotes comerciais são perfeitos para quem quer investir em um negócio próprio. 🙆‍♀️
    ...    ${SPACE}Aqui na Paca você encontra:${\n}${\n}✅ Taxas de juros menores;${\n}${\n}✅ Parcelamento em até 180 meses;${\n}${\n}✅ Sem necessidade de comprovação de renda;${\n}${\n}✅ Financiamento de 100% do valor do terreno;${\n}${\n}✅ Financiamento diretamente com a Pacaembu;${\n}${\n}✅ Entrada mínima de 10%, parcelada em 4 meses.
    ...    Para receber mais informações, clique no link abaixo, por favor.
    ...    https://pacaembu.com/terrenos-comerciais
    ...    Posso te ajudar em outro assunto, ${PRIMEIRO_NOME}?

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

Então o bot informa sobre Ser um Fornecedor
    Sleep    15
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 3
    ${ULTIMAS_TRES_MENSAGENS}    Create List

    @{EXPECTED}    Create List
    ...    Perfeito! Para se tornar um fornecedor da Paca, preencha o formulário abaixo, por favor. Nosso Time receberá seu contato e, se der match com nosso modelo de negócio, entraremos em contato! 🥰
    ...    https://pacaembu.com/seja-um-fornecedor
    ...    Posso te ajudar em outro assunto, ${PRIMEIRO_NOME}?

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

Então o bot informa sobre Vender sua Área
    Sleep    15
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 4
    ${ULTIMAS_TRES_MENSAGENS}    Create List

    @{EXPECTED}    Create List
    ...    Estamos ansiosos para saber um pouco mais sobre essa oportunidade de negócio. 😊
    ...    Para que possamos avaliar a sua área, vamos precisar que preencha um breve formulário. Nosso Time de Novos Negócios irá analisar e entrar em contato. É só clicar no link abaixo, tá bem?
    ...    ${SPACE}${SPACE}acessar formulário${SPACE}
    ...    Posso te ajudar em outro assunto, ${PRIMEIRO_NOME}?

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

Então o bot informa sobre Trabalhar Conosco
    Sleep    15
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 2
    ${ULTIMAS_TRES_MENSAGENS}    Create List

    @{EXPECTED}    Create List
    ...    ${SPACE}Ficamos muito felizes que deseje fazer parte do Time Pacaembu! 😊${\n}Nossa equipe foi fundamental para a transformação da vida de tantas famílias nesses mais de${\n}30 anos de história.${\n}Para conferir as vagas abertas, você pode clicar aqui.${\n}Nós também divulgamos oportunidades através do LinkedIn. Nos acompanhe por lá. 😉${\n}https://www.linkedin.com/company/pacaembuconstrutora
    ...    Posso te ajudar em outro assunto, ${PRIMEIRO_NOME}?

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