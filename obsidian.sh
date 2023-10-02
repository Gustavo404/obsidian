#!/bin/bash

# Função para mostrar mensagens coloridas
function color_message() {
  local color=$1
  local message=$2
  case $color in
    "red")
      echo -e "\e[91m$message\e[0m"
      ;;
    "green")
      echo -e "\e[92m$message\e[0m"
      ;;
    "blue")
      echo -e "\e[94m$message\e[0m"
      ;;
    "yellow")
      echo -e "\e[93m$message\e[0m"
      ;;
    *)
      echo "$message"
      ;;
  esac
}

# Função para solicitar os parâmetros de entrada
function solicitar_parametros() {
  # Solicita o limite maximo de valor em dBm ao usuário
  color_message "yellow" "\n[...] Por favor, insira o limite maximo:"
  read teto_dBm

  # Solicita o limite minimo de valor em dBm ao usuário
  color_message "yellow" "\n[...] Por favor, insira o limite minimo inferior a $teto_dBm:"
  read piso_dBm

  # Solicita o nome do arquivo de entrada
  color_message "yellow" "[...] Agora, insira o nome do arquivo de entrada:"
  read input

  # Solicita o nome do arquivo de saída
  color_message "yellow" "[...] Insira o nome do arquivo de saída:"
  read output
}

# Função para processar as opções da linha de comando
function processar_opcoes() {
  while getopts "t:p:i:o:" opt; do
    case $opt in
      t) teto_dBm="$OPTARG" ;;
      p) piso_dBm="$OPTARG" ;;
      i) input="$OPTARG" ;;
      o) output="$OPTARG" ;;
      \?)
        color_message "red" "Opção inválida: -$OPTARG"
        exit 1
        ;;
      :)
        color_message "red" "A opção -$OPTARG requer um argumento."
        exit 1
        ;;
    esac
  done

  # Verifica se todas as opções obrigatórias foram fornecidas
  if [[ -z "$teto_dBm" || -z "$piso_dBm" || -z "$input" || -z "$output" ]]; then
    color_message "red" "Erro: Você deve fornecer todas as opções -t, -p, -i e -o."
    exit 1
  fi
}

# Função para verificar se os limites de dBm são números válidos
function verificar_limites() {
  if ! [[ "$teto_dBm" =~ ^-?[0-9]+$ ]]; then
    color_message "red" "O limite máximo '$teto_dBm' não é um número válido."
    exit 1
  fi
  if ! [[ "$piso_dBm" =~ ^-?[0-9]+$ ]]; then
    color_message "red" "O limite mínimo '$piso_dBm' não é um número válido."
    exit 1
  fi
}

# Função para verificar se o arquivo de entrada existe
function verificar_arquivo_entrada() {
  if [ ! -f "$input" ]; then
    color_message "red" "O arquivo de entrada '$input' não existe."
    exit 1
  fi
}

# Função para aplicar o filtro com AWK usando o limite especificado
function aplicar_filtro_awk() {
  awk -v teto="$teto_dBm" -F'\t' '$3 >= teto' "$input" > .tmp
  awk -v piso="$piso_dBm" -F'\t' '$3 <= piso' .tmp > "$output"
}

# Função para aplicar o filtro com SED para remover linhas vazias
function aplicar_filtro_sed() {
  sed -i '/^$/d' "$output"
  sleep 0.5
}

# Função para verificar se o arquivo foi criado com sucesso
function verificar_arquivo_saida() {
  if [ -e "$output" ]; then
    color_message "green" "[!] O arquivo $output criado com sucesso!"
    rm .tmp
  else
    color_message "red" "[!] Houve um erro ao criar o arquivo $output, verifique obsidian/.tmp"
  fi
}

# Função para extrair clientes com sinal igual a -40 dBm
function extrair_clientes_40dbm() {
  read -p "[?] Deseja copiar os clientes com sinal igual a -40 e 0.00 dBm, e com erro de $input para 40dBm_$input? (Y/n)" response
  if [ "$response" = "n" ] || [ "$response" = "N" ]; then
    color_message "yellow" "[!] Processo finalizado."
    sleep 0.5
  else
    color_message "blue" "[.] Prosseguindo..."
    grep '\(-40\|RECV POWER\|(Dbm)\|\[ ERR\|onu\)' "$input" > 40dbm_$input
  fi
}

# Função para exibir a mensagem de conclusão
function exibir_mensagem_conclusao() {
  if [[ -e "$output" ]]; then
    color_message "green" "\n-----------------------------"
    color_message "green" "Filtro concluído com sucesso!"
    if [[ -e "40dBm_$input.txt" ]]; then
      echo -e "\e[92m[!]\e[0m As linhas com sinal igual a \e[94m-40 dBm\e[0m foram salvas em \e[94m40dBm_$input.txt\e[0m"
    fi
    echo -e "\e[92m[!]\e[0m As linhas com valores de dBm superiores a \e[94m$teto_dBm\e[0m, e inferiores a \e[94m$piso_dBm\e[0m foram removidas."
    echo -e "\e[92m[!]\e[0m Os resultados foram salvos em \e[94m$output\e[0m."
  else
    color_message "red" "\n-----------------------------"
    color_message "red" "[!] Ocorreu um erro!"
    exit 1
  fi
}

# Diálogo de boas-vindas
if [ $# -eq 0 ]; then
  clear
  color_message "green" "Bem-vindo ao Obsidian"
  echo -e "Este script irá filtrar as linhas com valores de dBm inferiores ao limite especificado."
  echo -e "exemplos de valores:    maximo: -26    minimo: -39"
  solicitar_parametros
else
  processar_opcoes "$@"
fi

verificar_limites
verificar_arquivo_entrada
aplicar_filtro_awk
aplicar_filtro_sed
verificar_arquivo_saida
extrair_clientes_40dbm
exibir_mensagem_conclusao
