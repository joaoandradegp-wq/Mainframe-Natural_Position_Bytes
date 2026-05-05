<h1 align="center">📊 Natural Variable Size Analyzer</h1>

<p align="center">
Ferramenta para análise, validação e cálculo automático de tamanho de variáveis em estruturas Natural (Adabas).
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Legado-yellow">
  <img src="https://img.shields.io/badge/Linguagem-Delphi%207-blue">
  <img src="https://img.shields.io/badge/Tipo-Utility-lightgrey">
</p>

---

## 📌 Sobre

O **Natural Variable Size Analyzer** foi desenvolvido para automatizar a análise de estruturas de variáveis em sistemas legados escritos em Natural.

A ferramenta interpreta definições de variáveis, valida a sintaxe e calcula automaticamente o tamanho em bytes, além de gerar os offsets de posição (início e fim).

Ideal para quem trabalha com manutenção, migração ou entendimento de sistemas antigos.

---

## ⚙️ Funcionalidades

<table style="border: none; border-collapse: collapse;">

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

### 🔍 LEITURA DE ESTRUTURA

Interpreta linhas no padrão Natural como:

01 VAR (A10)  
02 CAMPO (N5,2)

Identificando índice, nome e tipo da variável.

<br><br>
</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

### 🧠 VALIDAÇÃO INTELIGENTE

Detecta automaticamente:

- Parênteses não fechados  
- Tipos inválidos  
- Uso incorreto de REDEFINES  
- Estruturas inconsistentes  

<br>
</td>
</tr>

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

### 🧮 CÁLCULO DE TAMANHO

Calcula automaticamente o tamanho em bytes considerando:

- Tipos (A, N, P, etc.)  
- Decimais (,)  
- Multiplicadores (/)  
- Intervalos (:)  

Inclui regra especial para tipo **Packed (P)**.

<br><br>
</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

### 📏 GERAÇÃO DE OFFSETS

Define automaticamente:

- Posição inicial  
- Posição final  

Exemplo:

/* 001 - 010 */

<br>
</td>
</tr>

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

### 🔁 SUPORTE A REDEFINE

Reconhece blocos com <b>REDEFINE</b> (Natural)  
Ignora corretamente no cálculo principal para evitar duplicidade.

<br><br>
</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

### 📊 INTERFACE COM PROGRESSO

Interface simples com:

- Barra de progresso  
- Status com total em bytes  
- Saída formatada automaticamente  

<br>
</td>
</tr>

</table>

---

## 🚀 Como usar

1. Cole sua estrutura Natural no campo principal  
2. Clique em **Processar**  
3. Aguarde o cálculo automático  
4. Visualize os offsets gerados  
5. Confira o tamanho total na barra inferior  

---

## 🎯 Problema resolvido

- Cálculo manual de tamanho de variáveis  
- Erros humanos em offsets  
- Dificuldade em interpretar estruturas Natural  
- Inconsistências em definições legadas  

---

## 📊 Exemplo

**Entrada:**
