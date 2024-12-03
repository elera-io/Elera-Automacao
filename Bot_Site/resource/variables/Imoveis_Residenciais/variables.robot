*** Settings ***
Resource    ../Marco_Zero/variables.robot

*** Variables ***
${LAST_MODIFY_LEAD}    xpath= /html/body/div[4]/div[1]/section/div[1]/div[2]/div[1]/div/div/div/div/div/div/div/div[2]/div/div[1]/div[2]/div[2]/div[1]/div/div/table/thead/tr/th[4]/div/a/span[2]
${LEAD_NAME}    xpath=/html/body/div[4]/div[1]/section/div[1]/div[2]/div[1]/div/div/div/div/div/div/div/div[2]/div/div[1]/div[2]/div[2]/div[1]/div/div/table/tbody/tr[1]/td[4]/span/a
@{UFS}    BA   MG    MT    PR    SP    ZZ
@{MENSAGEM_ESPERADA_IMOVEIS}    Selecione qual deles deseja conhecer, por favor.    Na cidade que selecionou temos esse (s) imóvel (is) aqui, icaro. 👇   A Pacaembu está presente em mais de 50 cidades, mas cada uma delas é única pra gente!
${NOME_IMOVEL}    Mirante das Flores
${CELULAR}    (11) 99999-8888
${EMAIL}    Teste@gmail.com
${ESTADO}    SP
${MUNICIPIO}    Taubaté
${STATUS_COMBOBOX_XPATH}    xpath=//button[contains(@class,'slds-combobox__input') and contains(@class, 'slds-input_faux')]
${NOME_EMPREENDIMENTO}   Gojira  
${NOME_UNIDADE}    Teste Elera Unidade
${BASE_URL_UNIDAES}   https://pacaembuconstrutorasa--uat.sandbox.lightning.force.com/lightning/o/cbns__Unidade__c/list?filterName