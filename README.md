# Obsidian

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
