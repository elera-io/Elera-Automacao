*** Settings ***
Resource    ../common_keywords.robot
Resource    ../../variables/Imoveis_Residenciais/variables.robot
Library    Collections

*** Keywords ***

Dado que o usuário escolha "Imóveis Residenciais" no menu
    Clique no item do menu    Imóveis Residenciais
    
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

Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Sleep    2
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${ULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    Should Be Equal    ${ULTIMA_MENSAGEM}    Agora escolha a cidade.

Dado que o usuário escolha "Taubaté" no menu
    Clique no item do menu    Taubaté

Então o bot deverá responder com a mensagem de imóveis disponíveis
    Sleep    5
    Validar ultimas mensagens    @{MENSAGEM_ESPERADA_IMOVEIS}

Dado que o usuário escolha um imóvel no menu
    Clique no item do menu    Mirante das Flores

Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Sleep    5
    Validar ultimas mensagens    @{MENSAGEM_IMOVEL}

Dado que o usuário informe seu número
    Enviar mensagem    ${CELULAR}   

Então o bot deverá solicitar seu email
    Sleep    5s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    ${ULTIMA_MENSAGEM}    Get Text    ${MENSAGENS}[-1]
    Should Be Equal    ${ULTIMA_MENSAGEM}    Insira seu e-mail:

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