# Elera-Automação

## Arquitetura
## User-Defined Keywords
São as keywords (resources/keywords). As keyword podem ter keywords comuns, ou seja, aquelas keywords que todos (ou a maioria) dos testes irão usar e podem existir keywords especificas, por exemplo o **_login_keyword.robot_**

## Page object
É a junção das pastas de locators e pages. Locators ficará todas as variáveis essenciais para cada página ou componente. A page é onde terá todas as interações na tela daquela página

# Configuração do Ambiente para Testes com Robot Framework e Selenium

Este guia orienta na instalação e configuração do ambiente para execução de testes automatizados usando Python, Robot Framework, Selenium, ChromeDriver e EdgeDriver.

Requisitos

[Python](https://www.python.org)

[Robot Framework](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

[Selenium](https://www.selenium.dev/documentation/)

[ChromeDriver](https://googlechromelabs.github.io/chrome-for-testing/)

[EdgeDriver](https://developer.microsoft.com/pt-br/microsoft-edge/tools/webdriver/?form=MA13LH)

[Visual Studio Code](https://code.visualstudio.com/download)

Passo a Passo
1. Instalar Python
Acesse Python Downloads e baixe a última versão.
Durante a instalação, selecione "Add Python to PATH" para facilitar o uso do Python e suas bibliotecas no terminal.
Para verificar a instalação, execute:

```python
python --version
```
2. Instalar o Robot Framework
No terminal, execute:

```python
pip install robotframework
```
3. Instalar o Selenium com o Robot Framework
Instale a biblioteca SeleniumLibrary para uso com o Robot Framework:

```bash
pip install robotframework-seleniumlibrary
```
4. Instalar uma Versão Específica do Selenium
Para evitar problemas de compatibilidade, instale a versão 4.9.0 do Selenium:

```bash
pip install selenium==4.9.0
```
5. Baixar o ChromeDriver
Acesse [ChromeDriver](https://googlechromelabs.github.io/chrome-for-testing/) para testes e baixe a versão compatível com o seu navegador.
Extraia o chromedriver.exe e copie para o diretório de scripts do Python, que geralmente é:

```C:\Users\Usuário\AppData\Local\Programs\Python\Python312\Scripts\```

6. Baixar o [EdgeDriver](https://developer.microsoft.com/pt-br/microsoft-edge/tools/webdriver/?form=MA13LH) (Alternativa ao ChromeDriver)
Caso o ChromeDriver não funcione corretamente, você pode usar o EdgeDriver para rodar os testes no Microsoft Edge:

Acesse Edge WebDriver e baixe a versão do EdgeDriver correspondente à versão do seu navegador Microsoft Edge.
Extraia o msedgedriver.exe e copie para o diretório de scripts do Python:

```C:\Users\Usuário\AppData\Local\Programs\Python\Python312\Scripts\```

7. Instalar o Visual Studio Code
Baixe e instale o [Visual Studio Code](https://code.visualstudio.com/download).
No VS Code, instale a extensão Robot Framework IntelliSense para facilitar a edição dos arquivos .robot.

## Definir variáveis
Crie um arquivo **_locator.robot_** na pasta locator. Nele crie 4 variáveis, sendo elas, BASE_URL, USER, PASSWD e BROWSER

Exemplo:
```
${BASE_URL}   https://www.youtube.com
${USER}   example@example.com
${PASSWD}   ******
${BROWSER}    chrome
```