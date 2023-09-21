# Obsidian
## Descrição
O script Obsidian é uma ferramenta de linha de comando que permite filtrar linhas de um arquivo de entrada com base em valores de dBm (decibéis miliwatt) especificados pelo usuário. Ele oferece a capacidade de filtrar valores maiores ou iguais a um limite máximo e menores ou iguais a um limite mínimo. Além disso, o script pode opcionalmente extrair linhas com um valor específico de -40 dBm.

## Uso
Para usar o script Obsidian, siga estas etapas:

1. Execute o script no terminal usando o comando `./obsidian.sh`.

2. O script solicitará as seguintes informações ao usuário:
   - Limite máximo de valor em dBm.
   - Limite mínimo de valor em dBm (deve ser menor que o limite máximo).
   - Nome do arquivo de entrada.
   - Nome do arquivo de saída.

3. O script aplicará os filtros especificados no arquivo de entrada e salvará o resultado no arquivo de saída.

4. O usuário pode optar por extrair linhas com um valor específico de -40 dBm quando solicitado.

## Funções
### `color_message(color, message)`
Esta função é usada para exibir mensagens coloridas no terminal.

- `color` (string): A cor da mensagem, que pode ser "red" (vermelho), "green" (verde), "blue" (azul), "yellow" (amarelo) ou qualquer outra cor.
- `message` (string): A mensagem a ser exibida.

### Fluxo Principal
O script segue o seguinte fluxo principal:

1. Solicita informações ao usuário, incluindo limites de dBm e nomes de arquivos de entrada e saída.

2. Aplica filtros com AWK para extrair linhas que atendem aos critérios especificados (maior ou igual ao limite máximo e menor ou igual ao limite mínimo).

3. Remove linhas vazias do arquivo de saída com SED.

4. Verifica se o arquivo de saída foi criado com sucesso.

5. Opcionalmente, permite que o usuário extraia linhas com um valor específico de -40 dBm.

6. Exibe mensagens de conclusão e informações sobre o resultado.

## Correções
As seguintes correções foram feitas no código:

- Correção do operador de comparação na extração de valores de -40 dBm de `=` para `==`.
- Verificação de resposta para aceitar tanto "n" quanto "N".
- Remoção da linha `i =`, que não estava sendo usada.

## Testes
É importante testar o script com diferentes casos de entrada para garantir que ele funcione conforme o esperado e que as correções tenham sido aplicadas corretamente.

---
