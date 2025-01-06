*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Test Teardown    Close All Browsers

*** Keywords ***
Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Efetuar login
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
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha o municipio
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe seu email

Verificar Tipo de Moradia do Lead
    Abrir lista de leads no ambiente
    Sleep    10
    Pesquisar lead
    Sleep    7
    Click Link    xpath=//table/tbody/tr[1]/td[4]/span/a
    Sleep    30
    ${FIELDS}    Get WebElements    xpath=//div[contains(@class,'test-id__field-label')]
    ${RESULT_TIPO_MORADIA}    Get WebElements    xpath=//div[contains(@class,'slds-form-element__control')]
    ${ITENS_LENGTH}    Get Length    ${FIELDS}
    ${LENGTH_RESULT}    Set Variable    -1
    Log To Console    ${ITENS_LENGTH}

    FOR    ${INDEX}    IN RANGE    ${ITENS_LENGTH}
        ${MENU_CONTENT}    Get Text    ${FIELDS}[${INDEX}]
        Log To Console    ${MENU_CONTENT}

        IF    '${MENU_CONTENT}' == 'Tipo de Moradia'
            ${LENGTH_RESULT}    Set Variable    ${INDEX}
        END
    END

    Log To Console    ${LENGTH_RESULT}

    ${TESTE}    Get Text    ${RESULT_TIPO_MORADIA}[${LENGTH_RESULT}]
    Log To Console    ${TESTE}

    # Run Keyword If    ${EXISTS_FIELD} == ${False}   Fail    Campo Tipo de moradia não existe não foi encontrado

Verificar existencia do Tipo de Moradia
    Abrir lista de leads no ambiente
    Sleep    10
    Pesquisar lead
    Sleep    7
    Click Link    xpath=//table/tbody/tr[1]/td[4]/span/a
    Sleep    30
    ${FIELDS}    Get WebElements    xpath=//span[contains(@class,'test-id__field-label')]
    Sleep    3
    ${ITENS_LENGTH}    Get Length    ${FIELDS}
    Log To Console    ${ITENS_LENGTH}

    ${EXISTS_FIELD}    Set Variable    ${False}

    FOR    ${INDEX}    IN RANGE    ${ITENS_LENGTH}
        ${MENU_CONTENT}    Get Text    ${FIELDS}[${INDEX}]
        Log To Console    ${MENU_CONTENT}

        IF    '${MENU_CONTENT}' == 'Tipo de Moradia'
            Log To Console    ${INDEX}
            ${EXISTS_FIELD}    Set Variable    ${True}
        END
    END

    Run Keyword If    ${EXISTS_FIELD} == ${False}   Fail    Campo Tipo de Moradia não existe não foi encontrado

*** Test Cases ***
TC01:Validando a atualização do campo Tipo de Moradia com Morar
    # Gerar evidência    W-006691
    Redefinir nome padrão    João     Pedro Silva
    Redefinir email padrão    teste@gmail.com
    Redefinir celular padrão    11 99999-8888
    # Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    # Então o bot não identifique o imóvel
    # Dado que, o usuário selecione nos próximos 12 meses
    # Então o bot deverá exibir a mensagem se deseja morar ou investir
    # Dado que, o usuário selecione Morar
    # Então o bot deverá exibir a mensagem se está trabalhando no momento
    # Dado que, o usuário concorde que trabalha
    Verificar Tipo de Moradia do Lead
    # Stop Video Recording

TC02:Validando a atualização do campo Tipo de Moradia com Investir
    # Gerar evidência    W-006691
    Redefinir nome padrão    Teste    Asd Novo
    Redefinir email padrão    testezinho_novo@gmail.com
    Redefinir celular padrão    (11) 97643-9762
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot não identifique o imóvel
    Dado que, o usuário selecione nos próximos 12 meses
    Então o bot deverá exibir a mensagem se deseja morar ou investir
    Dado que, o usuário selecione Investir
    Então o bot deverá exibir a mensagem se está trabalhando no momento
    Dado que, o usuário concorde que trabalha
    Sleep    10
    # Stop Video Recording

TC03:Validando a existência do campo Tipo de moradia dentro do lead
    # Gerar evidência    W-006691
    Redefinir nome padrão    João     Pedro Silva
    Verificar existencia do Tipo de Moradia
    Sleep    10
    # Stop Video Recording