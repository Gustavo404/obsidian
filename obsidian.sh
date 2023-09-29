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

# Diálogo de boas-vindas
# Verifica se foram fornecidos argumentos de linha de comando
if [ $# -eq 0 ]; then
  # Diálogo de boas-vindas
  clear
  color_message "green" "Bem-vindo ao Obsidian"
  echo -e "Este script irá filtrar as linhas com valores de dBm inferiores ao limite especificado."
  echo -e "exemplos de valores:    maximo: -26    minimo: -39"

  # Solicita o limite maximo de valor em dBm ao usuário
  echo
  color_message "yellow" "\n[...] Por favor, insira o limite maximo:"
  read teto_dBm

  # Solicita o limite minimo de valor em dBm ao usuário
  echo
  color_message "yellow" "\n[...] Por favor, insira o limite minimo inferior a $teto_dBm:"
  read piso_dBm

  # Solicita o nome do arquivo de entrada
  echo
  color_message "yellow" "[...] Agora, insira o nome do arquivo de entrada:"
  read input

  # Solicita o nome do arquivo de saída
  echo
  color_message "yellow" "[...] Insira o nome do arquivo de saída:"
  read output
else
  # Processa as opções da linha de comando
  while getopts "t:p:i:o:" opt; do
    case $opt in
      t)
        teto_dBm="$OPTARG"
        ;;
      p)
        piso_dBm="$OPTARG"
        ;;
      i)
        input="$OPTARG"
        ;;
      o)
        output="$OPTARG"
        ;;
      \?)
        echo "Opção inválida: -$OPTARG" >&2
        exit 1
        ;;
      :)
        echo "A opção -$OPTARG requer um argumento." >&2
        exit 1
        ;;
    esac
  done

  # Verifica se todas as opções obrigatórias foram fornecidas
  if [[ -z "$teto_dBm" || -z "$piso_dBm" || -z "$input" || -z "$output" ]]; then
    color_message "red" "Erro: Você deve fornecer todas as opções -t, -p, -i e -o."
    exit 1
  fi
fi

color_message "blue" "[!] Efetuando alterações!"
# Aplicando o filtro com AWK usando o limite especificado
awk -v teto="$teto_dBm" -F'\t' '$3 >= teto' "$input" > .tmp
awk -v piso="$piso_dBm" -F'\t' '$3 <= piso' .tmp > "$output"

# Aplicando o filtro com SED para remover linhas vazias
sed -i '/^$/d' "$output"
sleep 0.5

# Verifica se o arquivo foi criado com sucesso
if [ -e "$output" ]; then
  color_message "green" "[!] O arquivo $output criado com sucesso!"
  rm .tmp
else
  color_message "red" "[!] Houve um erro ao criar o arquivo $output, verifique obsidian/.tmp"
fi

# Extrair clientes com sinal igual a -40 dBm
read -p "[?] Deseja copiar os clientes com sinal igual a -40 e 0.00 dBm, e com erro de $input para 40dBm_$input.txt? (Y/n)" response
if [ "$response" = "n" ] || [ "$response" = "N" ]; then
  color_message "yellow" "[!] Processo finalizado."
  sleep 0.5
else
  color_message "blue" "[.] Prosseguindo..."
  grep '\(-40\|RECV POWER\|(Dbm)\|\[ ERR\|onu\)' "$input" > 40dbm_$input
fi

# Mensagem de conclusão
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
  exit 
fi