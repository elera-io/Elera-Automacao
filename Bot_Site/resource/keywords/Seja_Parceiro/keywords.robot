*** Settings ***
Resource    ../common_keywords.robot
Resource    ../../variables/Imoveis_Residenciais/variables.robot
Resource    ../../keywords/Marco_Zero/keywords.robot


*** Keywords ***

Dado que o usuário clique em "Seja um parceiro imobiliário" no menu
    Clique no item do menu    Seja um parceiro imobiliário

Então o bot deverá exibir a mensagem de credenciamento
    Sleep    7s
    ${MENSAGENS}    Get WebElements    ${MESSAGES_XPATH}
    @{MENSAGENS_ESPERADAS}    Set Variable    Posso te ajudar em outro assunto, ${NOME_COMPLETO}?    Perfeito! Para fazer seu credenciamento aqui na Paca, preencha o formulário abaixo, por favor. Nosso Time fará a análise e entrará em contato em breve, combinado? 😊
    
    ${MENSAGENS_LENGTH}    Get Length    ${MENSAGENS}
    ${MENSAGENS_LENGTH}    Evaluate    ${MENSAGENS_LENGTH} - 1
    ${ULTIMAS_TRES_MENSAGENS_INDEX}    Evaluate    ${MENSAGENS_LENGTH} - 3
    ${ULTIMAS_TRES_MENSAGENS}    Create List

    FOR    ${INDEX}    IN RANGE    ${MENSAGENS_LENGTH}    ${ULTIMAS_TRES_MENSAGENS_INDEX}    -1
        ${TEXT}    Get Text    ${MENSAGENS}[${INDEX}]
        Continue For Loop If    '${TEXT}' == 'Link formulário (a fazer)'    
        Append To List    ${ULTIMAS_TRES_MENSAGENS}    ${TEXT}
    END
    
    Should Be Equal As Strings    ${ULTIMAS_TRES_MENSAGENS}    ${MENSAGENS_ESPERADAS}    

E exibir os botões "Sim" e "Não"
    Valide os botões    Sim    Não

Dado que o usuário clique no botão "Não"
    Clique no botão    Não    

Dado que o usuário clique no botão "Sim"
    Clique no botão    Sim

Então o bot apresenta a mensagem de despedida
    Validar ultimas mensagens    Obrigada por entrar em contato com a gente. Estamos por aqui sempre que precisar!Quero te convidar também a nos acompanhar pelo Instagram. Um abraço da Pam ❤️