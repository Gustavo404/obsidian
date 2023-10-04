# Obsidian

[![AWK 1.3.4](https://img.shields.io/badge/AWK-1.3.4-darkred)](https://packages.debian.org/stable/awk) 
[![SED 4.9-1](https://img.shields.io/badge/SED-4.9.1-darkgreen)](https://packages.debian.org/stable/sed) 
[![ShellScript Bash](https://img.shields.io/badge/ShellScript-Bash-blue)](https://packages.debian.org/stable/bash)
[![ShellScript expect](https://img.shields.io/badge/ShellScript-Expect-darkred)](https://wiki.debian.org/Expect)
[![Licença](https://img.shields.io/badge/Licen%C3%A7a-GPL%202.0-yellow)](https://github.com/gustavo404/vortex/blob/main/LICENSE)
[![Youtube](https://img.shields.io/badge/Youtube-Gustavo404-darkred.svg)](https://youtube.com/gustavo404)

<img src="obsidian.jpg" alt="Obsidian Logo" width="520">
 

## Visão Geral

O script Obsidian é uma ferramenta versátil projetada para processar dados de análise de potência de sinal em dBm. Ele oferece duas funcionalidades principais:

1. Extrair um intervalo de linhas de dados com base em limites de potência de sinal especificados pelo usuário. Por exemplo, pode ser usado para extrair todas as linhas com potência de sinal entre -26 dBm e -39 dBm.

2. Extrair todas as linhas de dados com potência de sinal igual a -40 dBm.

O script faz parte do Projeto VORTEX e foi desenvolvido com portabilidade em mente, permitindo sua incorporação em outros scripts ou sistemas automatizados.

<br>

## **Uso**

Para usar o script Obsidian, siga os seguintes passos:

1. **Execução do Script**:
    
    Você pode executar o script sem argumentos, o que iniciará um diálogo interativo para coletar as informações necessárias:
    
    ```bash
    bash obsidian.sh
    ```
    
    Alternativamente, você pode fornecer argumentos diretamente na linha de comando, como abaixo:
    
    ```bash
    bash obsidian.sh -t limite_maximo -p limite_minimo -i arquivo_entrada
    ```
    
2. **Solicitação de Parâmetros**:
    
    Se você optar por iniciar o diálogo interativo, o script solicitará as seguintes informações:
    
    - Limite máximo em dBm.
    - Limite mínimo em dBm (deve ser inferior ao limite máximo).
    - Nome do arquivo de entrada contendo os dados a serem filtrados.
3. **Processamento de Opções**:
    
    Se você preferir fornecer os parâmetros diretamente na linha de comando, você pode usar as seguintes opções:
    
    - **`t`**: Limite máximo em dBm.
    - **`p`**: Limite mínimo em dBm.
    - **`i`**: Nome do arquivo de entrada.
    
    Por exemplo:
    
    ```bash
    bash obsidian.sh -t -26 -p -39 -i dados.txt
    ```
    
4. **Verificação de Limites**:
    
    O script verifica se os limites de dBm fornecidos são números válidos.
    
5. **Verificação do Arquivo de Entrada**:
    
    Verifica se o arquivo de entrada especificado existe.
    
6. **Aplicação do Filtro com AWK**:
    
    O script utiliza o AWK para filtrar os dados do arquivo de entrada com base nos limites de dBm fornecidos.
    
7. **Aplicação do Filtro com SED**:
    
    Remove linhas vazias do arquivo filtrado.
    
8. **Verificação do Arquivo de Saída**:
    
    Verifica se o arquivo filtrado foi criado com sucesso.
    
9. **Extração de Clientes com Sinal Igual a -40 dBm**:
    
    O script permite extrair informações de clientes com sinal igual a -40 dBm e identificar erros no arquivo de entrada.
    
10. **Mensagem de Conclusão**:
    
    Exibe uma mensagem de conclusão informando se o processo foi bem-sucedido e onde os resultados foram salvos.
    
    ## **Funções Principais**
    
    O script Obsidian possui as seguintes funções principais:
    
    ### **`color_message()`**
    
    Esta função é responsável por exibir mensagens coloridas no terminal. Ela aceita dois parâmetros: a cor da mensagem (como "red", "green", "blue" ou "yellow") e o texto da mensagem.
    
    ### **`solicitar_parametros()`**
    
    Essa função inicia o diálogo interativo com o usuário para coletar informações, como o limite máximo e mínimo em dBm e o nome do arquivo de entrada.
    
    ### **`processar_opcoes()`**
    
    Esta função processa as opções da linha de comando, permitindo que o usuário forneça os parâmetros diretamente na chamada do script.
    
    ### **`verificar_limites()`**
    
    Verifica se os limites de dBm fornecidos pelo usuário são números válidos.
    
    ### **`verificar_arquivo_entrada()`**
    
    Verifica se o arquivo de entrada especificado pelo usuário existe.
    
    ### **`aplicar_filtro_awk()`**
    
    Esta função aplica o filtro com AWK para filtrar os dados do arquivo de entrada com base nos limites de dBm fornecidos.
    
    ### **`aplicar_filtro_sed()`**
    
    Remove linhas vazias do arquivo filtrado usando o SED.
    
    ### **`verificar_arquivo_saida()`**
    
    Verifica se o arquivo filtrado foi criado com sucesso.
    
    ### **`extrair_clientes_40dbm()`**
    
    Permite extrair informações de clientes com sinal igual a -40 dBm e identificar erros no arquivo de entrada.
    
    ### **`exibir_mensagem_conclusao()`**
    
    Exibe uma mensagem de conclusão informando se o processo foi bem-sucedido e onde os resultados foram salvos.

## Feedback, Perguntas e Relatórios de Problemas

Se quiser contribuir para a melhoria do projeto Obsidian, sugestões, perguntas ou encontrar algum problema, estou aqui para ajudar.

### Sugestões e Melhorias

Se você tiver sugestões ou ideias para melhorar o projeto Obsidian, sinta-se à vontade para compartilhá-las. Você pode fazer isso das seguintes maneiras:

- **Pull Request (PR)**: Se você deseja contribuir diretamente com código, abra um Pull Request com suas alterações propostas. Analisaremos suas contribuições e trabalharemos juntos para incorporá-las ao projeto.
- **Issues**: Use as Issues para sugerir melhorias ou novos recursos. Descreva detalhadamente sua ideia para que eu possa entender e discutir como implementá-la.

### Relatórios de Problemas (Bugs)

Encontrou um bug ou problema em Obsidian? Você pode relatar problemas das seguintes maneiras:

- **Issues**: Abra uma Issue descrevendo o problema. Inclua informações relevantes, como o ambiente em que o erro ocorreu, etapas para reproduzi-lo e qualquer mensagem de erro que tenha recebido.
- **Site**: Você também pode reportar bugs em [gustavo404.com/sobre](https://www.gustavo404.com/sobre). Use os meios de contato para enviar detalhes sobre o problema encontrado.

### Perguntas e Suporte

Se você tiver alguma pergunta sobre como usar Obsidian ou precisar de suporte, Você pode fazer o seguinte:

- **Issues Existentes**: Verifique se já existe uma Issue relacionada à sua pergunta. Talvez a resposta que você procura já esteja lá.
- **Novas Issues**: Se sua pergunta não estiver coberta nas Issues existentes, sinta-se à vontade para criar uma nova Issue com sua pergunta. Ficarei feliz em responder e ajudar.
- **Contato pelo Site**: Você também pode entrar em contato conosco através do site [gustavo404.com/sobre](https://www.gustavo404.com/sobre). Utilize os meios de contato para enviar suas perguntas ou dúvidas.

Agradeço por sua contribuição, feedback e envolvimento na comunidade do projeto Obsidian.

## Licença

O código-fonte do projeto Obsidian é disponibilizado sob os termos da Licença Pública Geral GNU versão 2.0 (GPL 2.0). Isso significa que você é livre para usar, modificar e distribuir o código de acordo com os termos da GPL 2.0. Certifique-se de ler e entender os detalhes da licença antes de utilizar o projeto.
