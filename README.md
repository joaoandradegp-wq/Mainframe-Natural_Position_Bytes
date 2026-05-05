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

<pre>
01 CLIENTE (A10)
02 IDADE (N3)
02 SALDO (P7,2)
</pre>

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
- **L, D, T, C:** tratados como tipos especiais  

Além disso, o parser também entende estruturas mais complexas:

- `,` → casas decimais  
- `/` → multiplicadores  
- `:` → intervalos  

Essas regras são aplicadas automaticamente sem necessidade de intervenção manual.

---

## 📏 Resultado gerado

A saída é estruturada com as posições calculadas ao lado de cada variável:

<pre>
01 CLIENTE (A10)  /* 001 - 010
02 IDADE (N3)     /* 011 - 013
02 SALDO (P7,2)   /* 014 - XXX
</pre>

Isso permite visualizar rapidamente o layout completo da estrutura em memória.

---

## 🚀 Como usar

1. Cole a estrutura Natural no campo principal  
2. Clique em **Processar**  
3. Aguarde a execução  
4. Visualize o resultado com offsets  
5. Confira o tamanho total na barra inferior  

---

## 🎯 Problemas que resolve

O **Natural Position Bytes** elimina tarefas manuais repetitivas e reduz erros comuns, como:

- Cálculo incorreto de offsets  
- Erros em variáveis Packed (P)  
- Interpretação errada de estruturas com repetição  
- Dificuldade em validar estruturas legadas  
- Perda de tempo com conferência manual  

---

## ⚠️ Validações automáticas

Durante o processamento, o sistema protege contra inconsistências:

- Parênteses não fechados  
- Tipos de variáveis inválidos  
- Estruturas mal formadas  
- Uso incorreto de `REDEFINES` (COBOL)  
- Variáveis sem definição adequada  

Caso algum erro seja encontrado, o processamento é interrompido e o ponto exato é destacado.

---

## 🖥️ Interface

A aplicação possui uma interface simples e funcional:

- Área de entrada para colar a estrutura  
- Área de saída com resultado formatado  
- Barra de progresso durante execução  
- Status com tamanho total em bytes  

---

## 🛠️ Tecnologias

- Delphi 7  
- VCL (Visual Component Library)  
- Componentes nativos (Memo, Gauge, StatusBar)  

---

## 📸 Preview

<p align="center">
  <i>(Adicione aqui um print da aplicação)</i>
  <img width="500" height="356" alt="image" src="https://github.com/user-attachments/assets/23afe9f7-105d-4897-97da-443b25e46d83" />

</p>

---

## 📥 Download

<p align="center">
  <a href="#">
    <img src="https://img.shields.io/badge/Download-Natural%20Position%20Bytes-blue?style=for-the-badge">
  </a>
</p>

---

<p align="center">
Feito para automatizar o que antes era manual em sistemas Natural 😄
</p>
