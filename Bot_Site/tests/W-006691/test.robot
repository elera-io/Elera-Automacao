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

Entrar no lead
    [Arguments]    ${PESQUISAR}
    Abrir lista de leads no ambiente
    Sleep    5
    Run Keyword If    ${PESQUISAR} == ${True}    Pesquisar lead
    Sleep    5
    Click Link    xpath=//table/tbody/tr[1]/td[4]/span/a
    Sleep    20

Verificar Tipo de Moradia do Lead
    [Arguments]    ${EXPECTED_RESULT}
    Entrar no lead    ${True}
    Execute Javascript    window.scrollTo(0,1000)

    ${FIELD}    Get WebElement    xpath=//lightning-formatted-text[(text()='Morar' or text()='Investir') and @data-output-element-id='output-field']
    ${RESULT}    Get Text    ${FIELD}

    Run Keyword If    '${RESULT}' != '${EXPECTED_RESULT}'   Fail    Valor do Tipo de Moradia diferente do resultado esperado

Verificar existencia do Tipo de Moradia
    Entrar no lead    ${False}
    Execute Javascript    window.scrollTo(0,1000)
    ${EXISTS_FIELD}    Set Variable    ${False}
    ${COUNT_FIELDS}    Get Element Count    xpath=//span[text()='Tipo de Moradia' and @class='test-id__field-label']

    IF    ${COUNT_FIELDS} > 0
        ${EXISTS_FIELD}    Set Variable    ${True}
    END
        
    Log To Console    ${COUNT_FIELDS}

    Run Keyword If    ${EXISTS_FIELD} == ${False}    Fail    Campo Tipo de Moradia não existe não foi encontrado

*** Test Cases ***
TC01:Validando a atualização do campo Tipo de Moradia com Morar
    Redefinir nome padrão    João     Pedro Silva
    Redefinir email padrão    Teste@gmail.com
    Redefinir celular padrão    11 99999-8888
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    E mostrar as opções de meses no menu
    Dado que, o usuário clique em "Nos próximos 12 meses"
    Então o bot deverá exibir a mensagem se deseja morar ou investir
    Dado que, o usuário selecione Morar
    Então o bot deverá exibir a mensagem se está trabalhando no momento
    Dado que, o usuário concorde que trabalha
    Sleep    30
    Verificar Tipo de Moradia do Lead    Morar

TC02:Validando a atualização do campo Tipo de Moradia com Investir
    Redefinir nome padrão    João     Pedro Silva
    Redefinir email padrão    Teste@gmail.com
    Redefinir celular padrão    11 99999-8888
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    E mostrar as opções de meses no menu
    Dado que, o usuário clique em "Nos próximos 12 meses"
    Então o bot deverá exibir a mensagem se deseja morar ou investir
    Dado que, o usuário selecione Investir
    Então o bot deverá exibir a mensagem se está trabalhando no momento
    Dado que, o usuário concorde que trabalha
    Sleep    30
    Verificar Tipo de Moradia do Lead    Investir

TC03:Validando a existência do campo Tipo de moradia dentro do lead
    # Gerar evidência    W-006691
    Redefinir nome padrão    João     Pedro Silva
    Verificar existencia do Tipo de Moradia
    Sleep    10
    # Stop Video Recording