# Shipay Business Intelligence Analyst Challenge

***Nota: Utilizaremos os seguintes critérios para a avaliação: Desempenho, Testes, Manutenabilidade, Separação de responsabilidades e boas práticas de engenharia de software.***



1.- Tomando como base a representação da estrutura do banco de dados fornecida (conforme diagrama [ER_Transact_Diagram.png], o script DDL [1_create_database_ddl.sql], e o script exemplos de registros [2_seed_data.sql] disponibilizados no repositório do github): Construa uma consulta SQL que será utilizada em um relatório que retornará o valor do ticket médio de transações por cliente, e por região do país (norte [AC,AM,AP,PA,RO,RR,TO], nordeste [AL,BA,CE,MA,PB,PE,PI,RN,SE], centro-oeste [GO,MT,MS], sul [PR,RS,SC], sudeste [ES,MG,RJ,SP]) conforme o endereço do Ponto de Venda(POS) do cliente, ordenados de forma decrescente pelo valor do ticket médio.



2.- Utilizando a mesma estrutura de banco de dados fornecida para a questão anterior responda.
O time de S.R.E Shipay identificou alguns alertas indicando “slow queries” no banco de dados réplica (SGBD/RDBMS) através das plataformas de monitoramento utilizadas pela empresa. 
Uma análise mais apurada sobre os alertas indicaram que as consultas são utilizadas para a geração de relatórios na plataforma de relatórios).
Foi disponibilizada a query indicada como mais custosa (listada logo após o enunciado da corrente questão), bem como a listagens dos índices criados no banco de dados (conforme a figura - [Query_Check_Indexes.png]).

Quais sugestões você faria para melhorar a performance de execução da consulta referenciada? Não limite suas sugestões, temos a liberdade para propor alterações de configurações no banco de dados, alterar a consulta, adição de sub sistemas, etc. 

***Consulta indicada como mais custosa:

SELECT to_char(x.created_date::timestamp,'YYYY-MM-DD'), 
       COUNT(distinct(x.orders_id)) as num_orders, 
       SUM(x.orders_value) as total
FROM (
       SELECT orders.id as orders_id,
              orders.created_at as created_date,  
              orders.payment_date,
              CAST(orders.total_order as decimal) as orders_value, 
              orders.status as order_status,
              order_items."name" as sales_item,
              CAST(order_items.unit_price as decimal),
              psp.psp_name,
              LOWER(pos."name") as pos_name,
              pos_type.description as pos_type,
              customers.cnpj,
              LOWER(customers."name") as customer_name,
              addresses.state_name 
         FROM orders 
         LEFT JOIN order_items on order_items.order_id = orders.id
         LEFT JOIN pos ON pos.id = orders.pos_id
         LEFT JOIN pos_type on pos_type.id = pos.pos_type_id 
         LEFT JOIN customers on customers.id = pos.customer_id
         LEFT JOIN customer_addresses on customer_addresses.customer_id = customers.id
         LEFT JOIN addresses on addresses.id = customer_addresses.address_id
         LEFT JOIN psp on psp.id = orders.psp_id 
         WHERE addresses.active = true AND LOWER(pos.name) NOT LIKE '%shipay%') AS x
 WHERE x.created_date BETWEEN '2021-01-01 00:00:00' AND '2021-11-30 23:59:59'
 GROUP BY x.created_date, x.orders_id, x.orders_value;
 
 
 
 3.- Utilizando a mesma estrutura de banco de dados fornecida para as questões anteriores responda.
 O time propôs a utilização de uma ferramenta de ETL (Extract Transform Load) para realizar validações de cadastros de clientes (por exemplo, se um CNPJ está ativo e válido na receita federal). Durante o rito de planejamento da próxima sprint, foi proposto a criação de um "workflow" no ETL que irá conter três passos, o primeiro passo irá consultar a tabela de "customers" para obter a lista de CNPJs a serem validados, o segundo passo irá consumir um serviço/API REST que irá validar o cadastro da pessoa jurídica atendendo ao seguinte exemplo de contrato: "$ curl -X GET https://www.receitaws.com.br/v1/cnpj/27865757000102" e por fim, o terceiro passo irá fundir/concatenar as informações da tabela customers com a resposta da API "ReceitaWS" e irá armazenar esse novo conjunto de informações em uma collection em um NoSQL baseado em documentos (JSON). Caso deseje, você poderá visualizar a proposta da implementação do workflow de ETL no diagrama [ETL_Diagram.png].
 
 Detalhe como você confeccionaria o workflow de ETL em uma platforma de mercado (Pentaho, NiFi, Airflow). Nesse detalhamento você poderá nos disponibilizar o workflow em sí (Kettle no caso do Pentaho DI, Processors no NiFi, DAG no Airflow), caso você possua acesso fácil a alguma dessas plataformas/ferramentas, bem como a descrição dos componentes que você utilizaria para desenvolver cada um dos passos em alguma dessas plataformas, o que seria necessário realizar para executar o Workflow, etc.
 
*Caso o acesso a plataforma não seja possível, nos encaminhe o detalhamento dos passos, sem problemas.



BOA SORTE!
