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

<h2>📌 Sobre</h2>

<p>
O <b>Natural Position Bytes</b> foi criado para facilitar a análise de estruturas de variáveis em sistemas legados escritos em Natural.
</p>

<p>
Em vez de calcular manualmente o tamanho e as posições de cada campo, a ferramenta interpreta a estrutura, valida a sintaxe e gera automaticamente os offsets em bytes.
</p>

<p>
Isso reduz erros e acelera bastante o trabalho em manutenção e entendimento de código legado.
</p>

---

<h2>⚙️ O que ele faz</h2>

<p>Durante o processamento, o aplicativo:</p>

<ul>
  <li>Lê cada linha da estrutura Natural</li>
  <li>Identifica nível, nome e tipo da variável</li>
  <li>Extrai e interpreta os parâmetros</li>
  <li>Valida possíveis erros de sintaxe</li>
  <li>Calcula o tamanho em bytes</li>
  <li>Define posição inicial e final (offset)</li>
  <li>Gera a saída já comentada</li>
</ul>

<p>Tudo isso acontece automaticamente em uma única execução.</p>

---

<h2>🧠 Regras de cálculo</h2>

<p>A ferramenta aplica as regras do próprio Natural para cada tipo:</p>

<ul>
  <li><b>A (Alfanumérico):</b> tamanho direto</li>
  <li><b>N (Numérico):</b> considera dígitos e decimais</li>
  <li><b>P (Packed):</b> cálculo com divisão por 2 e arredondamento</li>
  <li><b>L, D, T, C:</b> tratados como tipos especiais</li>
</ul>

<p>Também entende estruturas mais avançadas:</p>

<ul>
  <li><code>,</code> define casas decimais</li>
  <li><code>/</code> atua como multiplicador</li>
  <li><code>:</code> define intervalos</li>
</ul>

---

<h2>📊 Exemplo</h2>

<p><b>Entrada:</b></p>

<pre>
01 CLIENTE (A10)
02 IDADE (N3)
02 SALDO (P7,2)
</pre>

<p><b>Saída:</b></p>

<pre>
01 CLIENTE (A10)  /* 001 - 010
02 IDADE (N3)     /* 011 - 013
02 SALDO (P7,2)   /* 014 - XXX
</pre>

---

<h2>🚀 Como usar</h2>

<ol>
  <li>Cole a estrutura Natural no campo principal</li>
  <li>Clique em <b>Processar</b></li>
  <li>Aguarde o processamento</li>
  <li>Veja o resultado com os offsets calculados</li>
  <li>Confira o total em bytes na barra inferior</li>
</ol>

---

<h2>🎯 O que isso resolve</h2>

<ul>
  <li>Evita cálculo manual de offsets</li>
  <li>Reduz erros em variáveis Packed (P)</li>
  <li>Ajuda a entender estruturas antigas</li>
  <li>Acelera análise de código Natural</li>
</ul>

---

<h2>⚠️ Validações</h2>

<p>O sistema interrompe o processamento quando encontra problemas como:</p>

<ul>
  <li>Parênteses não fechados</li>
  <li>Tipos inválidos</li>
  <li>Estruturas inconsistentes</li>
  <li>Uso incorreto de REDEFINES</li>
</ul>

---

<h2>🖥️ Interface</h2>

<ul>
  <li>Área de entrada para colar a estrutura</li>
  <li>Saída com resultado formatado</li>
  <li>Barra de progresso</li>
  <li>Status com tamanho total em bytes</li>
</ul>

---

<h2>🛠️ Tecnologias</h2>

<ul>
  <li>Delphi 7</li>
  <li>VCL (Visual Component Library)</li>
  <li>Componentes nativos</li>
</ul>

---

<h2>📸 Preview</h2>

<p align="center">
  <img width="500" height="356" alt="image" src="https://github.com/user-attachments/assets/23afe9f7-105d-4897-97da-443b25e46d83" />
</p>

---

<p align="center">
Ferramenta feita para evitar cálculo manual em estruturas Natural. 🤖
</p>
