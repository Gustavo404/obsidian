# Obsidian

[![ShellScript Bash](https://img.shields.io/badge/ShellScript-Bash-blue)](https://www.gnu.org/software/bash/) [![Licença](https://img.shields.io/badge/Licen%C3%A7a-GPL%202.0-yellow)](https://github.com/gustavo404/obsidian/blob/main/LICENSE) [![Youtube](https://img.shields.io/badge/Youtube-Gustavo404-red.svg)](https://youtube.com/gustavo404)

<img src="obsidian.jpg" alt="Obsidian Logo" width="520">
 

## Visão Geral

O script Obsidian é uma ferramenta versátil projetada para processar dados de análise de potência de sinal em dBm. Ele oferece duas funcionalidades principais:

1. Extrair um intervalo de linhas de dados com base em limites de potência de sinal especificados pelo usuário. Por exemplo, pode ser usado para extrair todas as linhas com potência de sinal entre -26 dBm e -39 dBm.

2. Extrair todas as linhas de dados com potência de sinal igual a -40 dBm.

O script faz parte do Projeto VORTEX e foi desenvolvido com portabilidade em mente, permitindo sua incorporação em outros scripts ou sistemas automatizados.

## Modo de Uso

### Uso Interativo

Ao ser executado sem argumentos, o script entrará no modo interativo, onde solicitará ao usuário as seguintes informações:

- Limite máximo de potência de sinal (dBm).
- Limite mínimo de potência de sinal (dBm).
- Nome do arquivo de entrada.
- Nome do arquivo de saída.

### Uso com Argumentos

O script também pode ser executado com argumentos de linha de comando, o que é útil para automatizar tarefas. Os argumentos disponíveis são:

- `-t <valor>`: Especifica o limite máximo de potência de sinal (dBm).
- `-p <valor>`: Especifica o limite mínimo de potência de sinal (dBm).
- `-i <arquivo>`: Especifica o nome do arquivo de entrada.
- `-o <arquivo>`: Especifica o nome do arquivo de saída.

Exemplo de uso com argumentos:

```bash
bash obsidian.sh -t -26 -p -39 -i input.txt -o output.txt
```

## Funções
O código do script Obsidian contém funções que auxiliam na exibição de mensagens coloridas e informativas para o usuário. Abaixo estão essas funções:

**`color_message()`**: Esta função exibe mensagens coloridas no terminal, facilitando a diferenciação de mensagens de sucesso (verde), erro (vermelho), informações (azul) e avisos (amarelo).

## Processamento de Dados
O script utiliza as seguintes etapas para processar os dados:

1. Aplica um filtro usando o AWK para extrair linhas de dados com potência de sinal dentro do intervalo especificado pelo usuário.
2. Aplica um segundo filtro usando o SED para remover linhas vazias do arquivo de saída.
3. Verifica se o arquivo de saída foi criado com sucesso e fornece mensagens informativas ao usuário.

## Conclusão
O script Obsidian é uma ferramenta poderosa para processar dados de análise de potência de sinal em dBm. Ele pode ser usado interativamente ou incorporado em fluxos de trabalho automatizados, fornecendo flexibilidade e eficiência.
