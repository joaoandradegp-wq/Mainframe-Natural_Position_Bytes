<h1 align="center">📊 Natural Position Bytes</h1>

<p align="center">
Ferramenta para análise e cálculo automático de posições (bytes) em estruturas de variáveis Natural.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Legado-yellow">
  <img src="https://img.shields.io/badge/Linguagem-Delphi%207-blue">
  <img src="https://img.shields.io/badge/Tipo-Utility-lightgrey">
</p>

---

## 📌 Sobre

O **Natural Position Bytes** foi criado para resolver um problema clássico em sistemas legados:  
o cálculo manual de posições e tamanho de variáveis em estruturas Natural.

Ao trabalhar com definições como:
01 CLIENTE (A10)
02 IDADE (N3)
02 SALDO (P7,2)


é comum precisar calcular manualmente offsets, tamanhos e regras específicas de cada tipo — o que é propenso a erro e consome tempo.

A aplicação automatiza todo esse processo, interpretando cada linha, validando a estrutura e gerando o resultado com as posições corretas em bytes.

---

## ⚙️ O que o sistema faz

O aplicativo lê a estrutura informada, identifica cada variável e aplica automaticamente as regras de cálculo conforme o padrão Natural.

Durante o processamento, ele:

- Interpreta o nível da variável (01, 02, etc.)
- Identifica o nome e o tipo
- Extrai os parâmetros dentro dos parênteses
- Valida a estrutura completa
- Calcula o tamanho em bytes
- Define a posição inicial e final (offset)
- Gera a saída já comentada

Tudo isso em uma única execução.

---

## 🧠 Inteligência de cálculo

O sistema não apenas soma tamanhos — ele entende as particularidades do Natural.

Tipos diferentes seguem regras diferentes:

- **A (Alfanumérico):** tamanho direto
- **N (Numérico):** considera dígitos e decimais
- **P (Packed):** cálculo especial com divisão por 2 e arredondamento
- **L, D, T, C:** tratados como tipos especiais (sem tamanho explícito)

Além disso, o parser também entende estruturas mais complexas:

- `,` → casas decimais  
- `/` → multiplicadores  
- `:` → intervalos  

Essas regras são aplicadas automaticamente sem necessidade de intervenção manual.

---

## 📏 Resultado gerado

A saída é estruturada com as posições calculadas ao lado de cada variável:
