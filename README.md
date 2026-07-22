# 📊 Análise de Vendas e Desempenho Comercial | Olist

> Um projeto de análise de dados desenvolvido em **MySQL**, com foco na transformação de dados em informações estratégicas para apoiar decisões de negócio.

---

# Sobre o projeto

Este projeto foi desenvolvido utilizando a base pública da **Olist**, uma das maiores bases de e-commerce disponíveis para estudos em análise de dados.

O objetivo não foi apenas escrever consultas SQL, mas responder perguntas reais de negócio através da exploração e relacionamento dos dados.

Durante o desenvolvimento foram realizadas análises voltadas para faturamento, comportamento dos clientes, desempenho comercial, distribuição geográfica das vendas e indicadores executivos.

Cada consulta foi construída pensando em uma situação que poderia ser encontrada no dia a dia de uma empresa.

---

# Problema de negócio

Uma empresa de e-commerce deseja compreender melhor seu desempenho comercial para responder perguntas como:

- Onde está concentrada a maior parte da receita?
- Quais produtos possuem maior demanda?
- Quais vendedores apresentam melhor desempenho?
- Quais regiões representam os mercados mais importantes?
- Como os clientes preferem pagar?
- Quem são os clientes mais valiosos?
- Clientes que compram mais são realmente os que geram maior faturamento?

Responder essas perguntas permite transformar dados em decisões estratégicas.

---

# Base de dados

Foram utilizadas seis tabelas relacionais da base pública da Olist.

|Tabela|Descrição|
|-------|---------|
|Clientes|Informações cadastrais dos consumidores|
|Pedidos|Pedidos realizados|
|Itens do Pedido|Produtos vendidos, preço e frete|
|Produtos|Categorias e características dos produtos|
|Pagamentos|Forma de pagamento e valor pago|
|Vendedores|Informações dos vendedores responsáveis pelas vendas|

---

# Tecnologias

- MySQL
- SQL
- MySQL Workbench

---

# Técnicas utilizadas

Ao longo do projeto foram aplicados conceitos como:

✔ SELECT

✔ FROM

✔ JOIN

✔ ON

✔ GROUP BY

✔ ORDER BY

✔ COUNT()

✔ SUM()

✔ AVG()

✔ LIMIT

✔ Alias (AS)

✔ Relacionamento entre tabelas

✔ Agregação de dados

✔ Análise exploratória

✔ Geração de indicadores de negócio

---

# Perguntas de negócio respondidas

O projeto foi estruturado em **12 análises**.

|Análise|Objetivo|
|--------|--------|
|Receita por categoria|Identificar as categorias mais rentáveis|
|Produtos mais vendidos|Encontrar os produtos com maior saída|
|Receita por vendedor|Avaliar o desempenho comercial|
|Forma de pagamento|Entender a preferência dos clientes|
|Receita por forma de pagamento|Comparar utilização e faturamento|
|Receita por cidade|Identificar mercados estratégicos|
|Receita por estado|Analisar o faturamento por região|
|Ticket médio|Calcular o valor médio dos pedidos|
|Clientes mais valiosos|Identificar clientes de maior receita|
|Frequência x Receita|Comparar recorrência e faturamento|
|Produtos de baixo giro|Identificar oportunidades no estoque|
|Indicadores Gerais|Construir uma visão executiva do negócio|

---

# Principais aprendizados

Este projeto consolidou conhecimentos fundamentais de SQL e reforçou uma habilidade essencial para um Analista de Dados:

> Antes de escrever uma consulta, é preciso compreender o problema de negócio.

Durante o desenvolvimento foi necessário identificar corretamente os relacionamentos entre tabelas, selecionar os indicadores adequados para cada pergunta e interpretar os resultados obtidos para gerar insights que pudessem apoiar decisões estratégicas.

---

# Estrutura do projeto

```
📁 Projeto

├── Base de Dados
├── Script SQL
├── README.md
└── Imagens dos Resultados
```

---

# Conclusão

Mais do que um exercício de SQL, este projeto representa a aplicação da linguagem para resolver problemas reais de negócio.

As análises desenvolvidas demonstram como consultas bem estruturadas podem transformar grandes volumes de dados em informações relevantes para apoiar decisões relacionadas a vendas, marketing, clientes, estoque e desempenho comercial.

Este projeto também representa minha evolução prática no aprendizado de SQL, passando da compreensão dos comandos para a construção de análises orientadas por perguntas de negócio.

---
