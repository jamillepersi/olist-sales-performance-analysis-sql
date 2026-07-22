/*
=========================================================
PROJETO: Análise de Vendas e Desempenho Comercial - Olist
Ferramenta: MySQL

Autor: Jamille Silva

Objetivo:
Utilizar SQL para responder perguntas de negócio relacionadas
ao desempenho comercial da empresa, identificando oportunidades
de crescimento, comportamento dos clientes, desempenho dos
vendedores e indicadores que apoiem a tomada de decisão.
=========================================================
*/

/*
 Conhecendo as tabelas

Tabela clientes
→ Informações cadastrais dos clientes (nome, cidade, estado).

Tabela pedidos
→ Informações dos pedidos realizados.

Tabela itens_pedido
→ Produtos vendidos em cada pedido, preço e frete.

Tabela produtos
→ Informações sobre os produtos e suas categorias.

Tabela pagamentos
→ Forma de pagamento e valores pagos.

Tabela vendedores
→ Informações sobre os vendedores responsáveis pelas vendas.
*/

-- ==========================================
-- ANÁLISE 1 — Receita por categoria
-- ==========================================

/*
Quais categorias de produtos geram mais receita?
Objetivo:
Descobrir onde a empresa ganha dinheiro.
*/

SELECT 
product_category_name,
sum(price) as receita_total
FROM itens_pedido
JOIN produtos
ON itens_pedido.product_id = produtos.product_id
GROUP BY product_category_name
ORDER BY receita_total DESC;

/*
Insight:

As categorias com maior faturamento representam os principais motores de receita da empresa.
Esses resultados podem orientar decisões relacionadas ao aumento de investimento em marketing, planejamento de estoque e negociação com fornecedores,
priorizando categorias que apresentam maior retorno financeiro.
Também é recomendável acompanhar a evolução dessas categorias ao longo do tempo para identificar tendências de crescimento ou queda.
*/

-- ==========================================
-- ANÁLISE 2 — Produtos mais vendidos
-- ==========================================

/* 
Quais produtos apresentam maior volume de vendas?
Objetivo
Identificar os produtos com maior saída para apoiar decisões relacionadas ao estoque, compras e campanhas promocionais.
*/

SELECT 
    product_id,
    COUNT(order_item_id) AS quantidade_vendida
FROM itens_pedido
GROUP BY product_id
ORDER BY quantidade_vendida DESC
LIMIT 5;

/*
Insight:

Os produtos mais vendidos demonstram maior aceitação pelos consumidores e podem servir como referência para ações promocionais, 
reposição de estoque e estratégias de venda cruzada.
Entretanto, volume de vendas não significa necessariamente maior lucratividade, 
sendo recomendável comparar essa análise com indicadores de receita e margem de lucro.
*/

-- ==========================================
-- ANÁLISE 3 — Vendedores
-- ==========================================
/*
Pergunta:
Quais vendedores geram maior receita?
Objetivo:
Identificar os vendedores com melhor desempenho.
*/

SELECT
    seller_id,
    SUM(price) AS receita_total
FROM itens_pedido
GROUP BY seller_id
ORDER BY receita_total DESC;

/*
Insight:
A análise identifica os vendedores que mais contribuíram para a receita da empresa no período analisado.
Esse resultado pode apoiar ações de reconhecimento, definição de metas e compartilhamento de boas práticas entre a equipe comercial.
Para compreender os fatores que explicam esse desempenho, recomenda-se complementar a análise com indicadores como quantidade de vendas, 
ticket médio e região de atuação dos vendedores.
Além da receita gerada, recomenda-se acompanhar indicadores como ticket médio, 
quantidade de pedidos e taxa de conversão para avaliar o desempenho de forma mais completa.
*/

-- ==========================================
-- ANÁLISE 4 — Forma de pagamento
-- ==========================================

/*
Pergunta:
Qual forma de pagamento é mais utilizada?
Objetivo:
Entender o comportamento financeiro dos clientes.
*/

SELECT
    payment_type,
    COUNT(order_id) AS quantidade
FROM pagamentos
GROUP BY payment_type
ORDER BY quantidade DESC;

/*
Insight:

Conhecer a preferência dos clientes pelos meios de pagamento permite otimizar campanhas comerciais, 
negociar taxas com operadoras financeiras e melhorar a experiência de compra.
Essa informação também pode auxiliar na criação de incentivos para formas de pagamento que reduzam custos operacionais.
*/

-- ==========================================
-- ANÁLISE 5 — Receita por forma de pagamento
-- ==========================================

/*
Pergunta:
Qual forma de pagamento gera maior receita?
Objetivo:
Comparar quais meios de pagamento têm maior impacto no faturamento da empresa.
*/

SELECT
    payment_type,
    SUM(payment_value) AS receita_total
FROM pagamentos
GROUP BY payment_type
ORDER BY receita_total DESC;

/*
Insight:
A análise permite identificar quais formas de pagamento geram maior receita para a empresa.
Essas informações podem apoiar decisões relacionadas às condições de pagamento oferecidas aos clientes,
ao planejamento financeiro e às estratégias comerciais, priorizando os meios de pagamento que apresentam maior impacto no faturamento.
Ao comparar esta análise com a frequência de utilização das formas de pagamento,
é possível identificar se o meio mais utilizado também é responsável pelo maior faturamento da empresa.
*/


-- ==========================================
-- ANÁLISE 6 — Receita por cidade
-- ==========================================

/*
Pergunta:
Quais cidades geram maior receita?
Objetivo:
Identificar mercados estratégicos.
*/

SELECT
    customer_city,
    SUM(payment_value) AS receita_total
FROM clientes
JOIN pedidos
    ON clientes.customer_id = pedidos.customer_id
JOIN pagamentos
    ON pedidos.order_id = pagamentos.order_id
GROUP BY customer_city
ORDER BY receita_total DESC
LIMIT 10;

 
/*
Insight:

A concentração da receita em determinadas cidades evidencia mercados prioritários para a empresa.
Essas informações podem orientar ações de expansão comercial, campanhas regionais,
definição de centros logísticos e estratégias específicas para localidades com maior potencial de consumo.
Também é interessante comparar o faturamento com o número de clientes de cada cidade para identificar mercados ainda pouco explorados.
*/

-- ==========================================
-- ANÁLISE 7 — Receita por estado
-- ==========================================

/*
Pergunta:
Quais estados apresentam maior faturamento?
Objetivo:
Encontrar regiões prioritárias.
*/

SELECT
    customer_state,
    SUM(payment_value) AS receita_total
FROM clientes
JOIN pedidos
    ON clientes.customer_id = pedidos.customer_id
JOIN pagamentos
    ON pedidos.order_id = pagamentos.order_id
GROUP BY customer_state
ORDER BY receita_total DESC
LIMIT 10;

/*
Insight:
A análise identifica os estados com maior participação no faturamento da empresa.
Esses resultados podem apoiar decisões relacionadas à expansão comercial,
distribuição de investimentos em marketing e definição de estratégias regionais.
Uma análise complementar pode comparar o faturamento com a quantidade de clientes
em cada estado, permitindo avaliar o potencial de crescimento de cada mercado.
*/


-- ==========================================
-- ANÁLISE 8 — Ticket médio
-- ==========================================

/*
Pergunta:
Qual é o valor médio dos pedidos?
Objetivo:
Identificar o valor médio gasto pelos clientes em cada pedido.
*/

SELECT
AVG(payment_value) AS ticket_medio
FROM pagamentos;

/*
Insight:

O ticket médio representa o valor gasto, em média, por pedido realizado.
Esse indicador é fundamental para acompanhar a evolução do faturamento e avaliar o impacto de estratégias como venda de produtos complementares,
aumento do mix de produtos e campanhas para elevar o valor médio das compras.
*/

-- ==========================================
-- ANÁLISE 9 — Clientes
-- ==========================================

/*
Pergunta:
Quais clientes geram maior receita?
Objetivo:
Identificar os clientes mais valiosos para o negócio.
*/

SELECT 
    clientes.customer_id,
    SUM(payment_value) AS receita_total
FROM clientes
JOIN pedidos 
    ON clientes.customer_id = pedidos.customer_id
JOIN pagamentos 
    ON pedidos.order_id = pagamentos.order_id
GROUP BY clientes.customer_id
ORDER BY receita_total DESC
LIMIT 10;

/*
Insight:

Os clientes que mais geram receita representam um público estratégico para o negócio.
Esses consumidores podem ser priorizados em programas de fidelização, campanhas personalizadas e ações de relacionamento,
aumentando as chances de retenção e crescimento do faturamento ao longo do tempo.
Também é recomendável analisar a frequência de compra desses clientes para identificar oportunidades de recorrência.
*/

-- ==========================================
-- ANÁLISE 10 — Comparação
-- ==========================================

/*
Pergunta:
Clientes que compram mais são os que mais geram receita?
Objetivo:
Comparar frequência de compra e receita para identificar diferentes perfis de clientes.
*/

SELECT
    pedidos.customer_id,
    COUNT(pedidos.order_id) AS frequencia_compra,
    SUM(pagamentos.payment_value) AS receita_total
FROM pedidos
JOIN clientes
    ON pedidos.customer_id = clientes.customer_id
JOIN pagamentos
    ON pedidos.order_id = pagamentos.order_id
GROUP BY pedidos.customer_id
ORDER BY receita_total DESC
LIMIT 10;

/*
Insight:
A comparação entre frequência de compra e receita demonstra que os clientes mais recorrentes nem sempre são aqueles que geram maior faturamento.
Esse resultado evidencia a existência de diferentes perfis de clientes: alguns realizam compras frequentes de menor valor,
enquanto outros compram poucas vezes, mas efetuam pedidos de maior valor.
Essas informações podem orientar estratégias distintas de fidelização, campanhas de marketing e ações comerciais voltadas para cada perfil de cliente.
*/

-- ==========================================
-- ANÁLISE 11 — Estoque
-- ==========================================

/*
Pergunta:
Existem produtos com baixo giro?
Objetivo:
Identificar produtos com baixa saída para apoiar decisões sobre estoque e portfólio.
*/

SELECT
    product_id,
    COUNT(product_id) AS quantidade_vendida
FROM itens_pedido
GROUP BY product_id
ORDER BY quantidade_vendida ASC;

/*
Insight:

Produtos com baixa frequência de venda podem indicar baixa demanda, excesso de estoque ou necessidade de revisão da estratégia comercial.
Essas informações podem apoiar decisões sobre promoções, reposição de estoque, descontinuação de produtos ou renegociação com fornecedores.
Antes de qualquer decisão, recomenda-se avaliar também a margem de lucro e a sazonalidade desses produtos.
*/

-- ==========================================
-- ANÁLISE 12 — Visão Geral
-- ==========================================

/*
Pergunta:
Quais são os principais indicadores do negócio?
Objetivo:
Apresentar um resumo executivo do desempenho da empresa.

Exemplo de indicadores:
Receita Total
Número de Clientes
Número de Pedidos
Ticket Médio
Número de Produtos
Número de Vendedores
*/
-- Receita total

SELECT
SUM(payment_value) AS receita_total
FROM pagamentos;

-- Número de clientes
SELECT 
count(customer_id) as clientes
FROM clientes;

-- Número de Pedidos
SELECT
count(order_id) as pedidos
FROM pedidos;

-- Ticket Médio
SELECT
AVG(payment_value) AS ticket_medio
FROM pagamentos;

-- Número de Produtos
SELECT
count(product_id) as produtos
FROM produtos;

-- Número de Vendedores
SELECT
count(seller_id) as vendedores
FROM vendedores;

/*
Insight:

Os indicadores consolidados oferecem uma visão executiva do desempenho da empresa, permitindo acompanhar rapidamente a evolução do negócio.
Essas métricas podem servir como base para dashboards gerenciais e para o monitoramento contínuo de resultados,
apoiando decisões estratégicas relacionadas ao crescimento da empresa.
*/


/*
=========================================================
CONCLUSÃO

A análise dos dados permitiu identificar os principais fatores que impactam o desempenho comercial da empresa, 
incluindo as categorias mais rentáveis, os produtos de maior saída, os vendedores com melhor desempenho, 
as regiões que concentram maior faturamento e o comportamento dos clientes em relação às formas de pagamento e ao consumo.
Além de responder às perguntas de negócio propostas, o projeto demonstrou como o SQL pode ser utilizado para 
transformar dados em informações estratégicas, apoiando decisões relacionadas a marketing, vendas, gestão de estoque e relacionamento com clientes.
Os resultados reforçam a importância da análise de dados como ferramenta para identificar 
oportunidades de crescimento e otimizar a tomada de decisão nas organizações.
*/



