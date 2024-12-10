*** Settings ***
Resource    ../Marco_Zero/variables.robot

*** Variables ***
${STATUS_COMBOBOX_XPATH}    xpath=//button[contains(@class,'slds-combobox__input') and contains(@class, 'slds-input_faux')]
${NOME_UNIDADE}    Teste Elera Unidade
${BASE_URL_UNIDAES}   https://pacaembuconstrutorasa--uat.sandbox.lightning.force.com/lightning/o/cbns__Unidade__c/list?filterName
${SETUP_XPATH}    //a[contains(@class, 'slds-global-actions__setup')]
${DEV_CONSOLE_XPATH}    //li[contains(@id, 'developer')]
${DEVELOPER_CONSOLE}    class:CodeMirror-code
${EXECUTE_BUTTON}    id:button-1188