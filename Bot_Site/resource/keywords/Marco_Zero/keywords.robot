*** Settings ***
Resource    ../common_keywords.robot
Resource    ../../variables/Marco_Zero/variables.robot

*** Keywords ***

Dado que o usuário clique no ícone de chat
    Clicar no chat
    Sleep    2s

Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Sleep    10s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}

    FOR  ${INDEX}    IN RANGE    0    2
        ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]
        ${TEXT}    Strip String    ${TEXT}
        ${TEXT}    Remove String    ${TEXT}    \s+    ""
        ${TEXT}    Remove String    ${TEXT}    \n
        Should Be Equal    ${TEXT}    ${EXPECTED_MESSAGES}[${INDEX}]
    END
    Sleep    2s

Quando o usuário clica no botão Concordo
    Sleep    2s
    ${BOTOES_ACEITAR_POLITICA}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES_ACEITAR_POLITICA}[0]

Quando o usuário clica no botão Não Concordo
    Sleep    2s
    ${BOTOES_ACEITAR_POLITICA}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES_ACEITAR_POLITICA}[1]


Então o bot solicita o primeiro nome
    Sleep    3s
    Validar ultimas mensagens    Para começarmos, qual seu primeiro nome? 


Dado que o usuário preencha o seu primeiro nome
    Sleep    3s
    Wait Until Element Is Visible    ${CHAT_INPUT}    3s
    Input Text    ${CHAT_INPUT}    ${PRIMEIRO_NOME} 
    Press Keys    ${CHAT_INPUT}    ENTER


Então o bot solicita o sobrenome
    Sleep    3s
    Validar ultimas mensagens    E sobrenome?

Dado que o usuário preencha o seu sobrenome
    Sleep    3s
    Wait Until Element Is Visible    ${CHAT_INPUT}    2s
    Input Text    ${CHAT_INPUT}    ${SOBRENOME} 
    Press Keys    ${CHAT_INPUT}    ENTER


Então o bot deve perguntar se o usuário já é um cliente
    Sleep    5s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    Validar ultimas mensagens    ${PRIMEIRO_NOME}, agora me diz se você já é cliente Pacaembu, por favor.

E exibir os botões "Sim, sou" e "Ainda não"
    Sleep    5s
    ${BOTOES_SOU_CLIENTE}    Get WebElements    ${BOTOES_XPATH}
    @{CONTEUDO_ESPERADO_BOTOES}    Set Variable    Sim, sou    Ainda não

    FOR  ${INDEX}    IN RANGE    2
        ${TEXT}    Get Text    ${BOTOES_SOU_CLIENTE}[${INDEX}]
        Should Be Equal    ${TEXT}    ${CONTEUDO_ESPERADO_BOTOES}[${INDEX}]
    END


Dado que o usuário clique no botão "Ainda não"
    ${BOTOES_SOU_CLIENTE}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES_SOU_CLIENTE}[1]

Dado que o usuário clique no botão "Sim, sou"
    ${BOTOES_SOU_CLIENTE}    Get WebElements    ${BOTOES_XPATH}
    Click Element    ${BOTOES_SOU_CLIENTE}[0]

Então o bot deve apresentar uma mensagem e exibir o menu
    Sleep    10s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    Validar ultimas mensagens    Certo, ${PRIMEIRO_NOME}! Sobre o que gostaria de conversar? 🥰
    Validar itens no menu     Imóveis Residenciais    Seja um parceiro imobiliário    Outros
    
Então o bot deve apresentar uma mensagem e exibir o menu de estados
    Sleep    5s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    Validar ultimas mensagens    Legal! De qual estado gostaria de conhecer nossos imóveis, por favor? 😊
    @{ESTADOS_ESPERADOS}    Set Variable    BA    MG     MT    PR    SP    ZZ

Dado que o usuário clique em "ZZ" no menu de estados
    ${MENU_ITENS}    Get WebElements    ${MENU_ITENS_XPATH}
    Clique no item do menu    ZZ
    Sleep    2s
Dado que o usuário clique em "Imóveis Residenciais" no menu
    Clique no item do menu    Imóveis Residenciais
Então o bot deve mostrar as mensagens de encerramento
    Sleep    5s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    10s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    @{MENSAGENS_ESPERADAS}    Set Variable    Infelizmente, sem o seu aceite ao termo não posso continuar com o atendimento por aqui. 😕    
    ...    Mas, você ainda pode ligar para a nossa Central de Relacionamento, pelo número 0800 730 2020, ou me chamar novamente dando o aceite ao termo, combinado? Um abraço da Pam ❤️
    FOR  ${INDEX}    IN RANGE    2    4
        ${J} =        Evaluate    ${INDEX} - 2
        ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]
        ${TEXT}    Strip String    ${TEXT}
        ${TEXT}    Remove String    ${TEXT}    \s+    ""
        Should Be Equal    ${TEXT}    ${MENSAGENS_ESPERADAS}[${J}]
    END

Então o bot apresenta a mensagem de rede de vizinhos e um menu
    Sleep    5s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    @{MENSAGEM_ESPERADA}    Set Variable    Ótimo saber que você já faz parte da nossa rede de vizinhos.😍Vamos te direcionar para nosso Time de Relacionamento, mas lembre-se que para 2ª via de boleto, acompanhamento de obras, acesso ao saldo devedor e mais você pode acessar o Portal do Cliente.    Como prefere seguir?

    FOR  ${INDEX}    IN RANGE    4    6
        ${J} =        Evaluate    ${INDEX} - 4
        ${TEXT}    Get Text    ${MESSAGES_LIST}[${INDEX}]
        ${TEXT}    Strip String    ${TEXT}
        ${TEXT}    Remove String    ${TEXT}    \s+    ""
        ${TEXT}    Remove String    ${TEXT}    \n    ""
        Should Be Equal    ${MENSAGEM_ESPERADA}[${J}]    ${TEXT}
    END

    @{CONTEUDOS_ESPERADOS_ITENS}    Set Variable    Acessar Portal do Cliente    Falar por WhatsApp    Encerrar atendimento
    ${MENU_ITENS}    Get WebElements    ${MENU_ITENS_XPATH}
    
    FOR  ${INDEX}  IN RANGE    3
        ${CONTEUDO_ITEM}    Get Text    ${MENU_ITENS}[${INDEX}]
        Should Be Equal    ${CONTEUDOS_ESPERADOS_ITENS}[${INDEX}]    ${CONTEUDO_ITEM}
    END

E clicar no botão de portal do cliente
    ${MENU_ITENS}    Get WebElements    ${MENU_ITENS_XPATH}
    Click Element    ${MENU_ITENS}[0]
    Sleep    2s

E clicar no botão de Falar por whatsapp
    ${MENU_ITENS}    Get WebElements    ${MENU_ITENS_XPATH}
    Click Element    ${MENU_ITENS}[1]
    Sleep    2s

E clicar no botão de Encerrar atendimento
    ${MENU_ITENS}    Get WebElements    ${MENU_ITENS_XPATH}
    Click Element    ${MENU_ITENS}[2]
    Sleep    2s

Então o bot deve enviar o link para acessar o portal do cliente
    Sleep    5s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${TEXT}    Get Text    ${MESSAGES_LIST}[6]
    Should Be Equal    ${TEXT}    Entendi, ${NOME_COMPLETO}! É só acessar esse link aqui: 👉https://pacaembu.com/portaldocliente

Então o bot deve enviar o link para o whatsapp
    Sleep    5s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${TEXT}    Get Text    ${MESSAGES_LIST}[6]
    Should Be Equal    ${TEXT}    Entendi, ${NOME_COMPLETO}! É só acessar esse link aqui: 👉https://api.whatsapp.com/send?phone=5508007302020


Então o bot deve enviar a mensagem de encerramento
    Sleep    5s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    ${MESSAGES_LIST}    Get WebElements    ${MESSAGES_XPATH}
    ${TEXT}    Get Text    ${MESSAGES_LIST}[6]
    ${TEXT}    Strip String    ${TEXT}
    ${TEXT}    Remove String    ${TEXT}    \s+    ""
    ${TEXT}    Remove String    ${TEXT}    \n    ""
    Should Be Equal    ${TEXT}    Obrigada por entrar em contato com a gente! Estamos por aqui sempre que precisar!Quero te convidar também a nos acompanhar pelo Instagram Um abraço da Pam ❤️

Redefinir nome padrão
    [Documentation]    Aqui o nome é redefinido para utilizar o nome necessario no teste
    [Arguments]    ${NOVO_NOME}   ${NOVOSGND_NOME}
    Set Global Variable    ${PRIMEIRO_NOME}    ${NOVO_NOME}
    Set Global Variable    ${SOBRENOME}    ${NOVOSGND_NOME}

Definir nome como João Pedro
    Redefinir nome padrão    João    Pedro 

Definir nome como Amanda Pompéia
    Redefinir nome padrão    Amanda     Pompéia


Definir nome como João Pedro Santos
    Redefinir nome padrão    João Pedro     Santos

Definir nome como icaro Bezerra
    Redefinir nome padrão    icaro     Bezerra
    
Redefinir nome Para Teste Elera
    Redefinir nome padrão    Teste     Elera


Então o bot deve apresentar uma mensagem e exibir o menu de cidades
    Sleep    5s
    Wait Until Element Is Visible    ${MESSAGES_XPATH}    15s
    Validar ultimas mensagens   Agora escolha a cidade.
    Valida presença do botão voltar no menu

Validar Ocultação de Cidades
    [Arguments]    ${STATUS ESPERADO}    ${MENU_ITENS_XPATH}
    ${MENU_ITENS}    Get WebElements    ${MENU_ITENS_XPATH}
    ${CIDADES_EXIBIDAS}    Create List

    FOR    ${ITEM}    IN    @{MENU_ITENS}
        ${texto_item}    Get Text    ${ITEM}
        Append To List    ${CIDADES_EXIBIDAS}    ${texto_item}
    END

    Log    Cidades exibidas no menu: ${CIDADES_EXIBIDAS}

    # Verifica se nenhuma cidade com o status esperado está visível
    FOR    ${cidade}    IN    ${status_esperado}
        Should Not Contain    ${CIDADES_EXIBIDAS}    ${cidade}
    END