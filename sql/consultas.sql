Alana é uma empreendedora apaixonada por arte e cultura regional. Depois de anos participando de feiras de
artesanato em Minas Gerais, ela decidiu criar sua própria loja online: a Artesanato&Co.

A proposta da loja é conectar artesãos locais de cidades históricas, como Ouro Preto, Tiradentes e São
João del Rei, a clientes de todo o Brasil. Cada peça vendida é feita à mão e carrega uma história única.
Na Artesanato&Co, Alana organiza os produtos por categorias como cerâmica, tecelagem e madeira. Ela
gerencia os cadastros dos artesãos, os pedidos dos clientes, o pagamento, e ainda monitora o status
das entregas.

Com o crescimento da loja, Alana percebeu a necessidade de um banco de dados relacional para controlar
tudo com segurança e eficiência. Agora ela precisa da ajuda de desenvolvedores como você para construir
esse sistema completo, com consultas que ajudem a entender o negócio, como:

● Quem mais compra?
● Quais produtos vendem mais?
● Quais pedidos ainda não foram pagos?
● Quais artesãos estão vendendo mais?
● Há produtos cadastrados que nunca foram vendidos?

CONSULTAS:

PARTE 1 – CONSULTAS SIMPLES (SELECT)

1. Liste todos os produtos com preço maior que R$ 80.
R: SELECT nome, preco FROM produtos WHERE preco > 80;

2. Mostre o nome dos artesãos que moram em cidades que começam com "S".
R: SELECT nome FROM artesaos WHERE cidade LIKE "S%";

3. Liste todos os produtos da categoria 'Tecelagem'.
R: SELECT nome FROM produtos where id_categoria = 2;

4. Traga todos os pedidos cujo status de pagamento é 'PENDENTE'.
R: SELECT id_cliente, data_pedido FROM pedidos WHERE status_pagamento = 'PENDENTE';

PARTE 2 – FUNÇÕES E AGRUPAMENTOS
  
5. Liste os produtos que foram vendidos mais de 2 vezes.
R: SELECT nome, preco, SUM(quantidade) FROM produtos JOIN itens_pedido ON produtos.id = itens_pedido.id_produto
GROUP BY nome, preco
HAVING SUM(quantidade)>2;

6. Mostre quantos pedidos cada cliente já fez.
R: SELECT nome, COUNT(id_cliente) FROM clientes JOIN pedidos ON clientes.id = id_cliente
GROUP BY id_cliente;

7. Qual o valor total de cada pedido (quantidade × preço)?
R: SELECT nome, id_pedido, SUM(quantidade * preco_unitario) AS VALOR TOTAL FROM itens_pedido join pedidos ON pedidos.id = itens_pedido.id_pedido
join clientes ON clientes.id = pedidos.id_cliente
GROUP BY nome, id_pedido;

8. Liste os artesãos e a quantidade de produtos que cada um cadastrou.
R: SELECT artesaos.nome, artesaos.id, count(id_artesao) AS QUANTIDADE FROM artesaos join produtos ON artesaos.id = produtos.id_artesao 
  group by artesaos.id, artesaos.nome;

PARTE 3 – JUNÇÕES (JOINS)
9. Mostre os pedidos com nome do cliente, data e status de pagamento.
R: Select clientes.nome, data_pedido, status_pagamento FROM pedidos join clientes ON pedidos.id_cliente = clientes.id;

10. Liste os produtos pedidos por cada cliente (nome do cliente + produto).
R: SELECT clientes.nome, produtos.nome, itens_pedido.id 
FROM pedidos 
JOIN clientes ON pedidos.id_cliente = clientes.id
JOIN produtos  ON itens_pedido.id_produto  = produtos.id
JOIN itens_pedidos ON itens_pedido.id_pedido = pedidos.id;

11. Mostre todos os produtos e suas respectivas categorias.
R: SELECT produtos.nome AS "Nome do Produto", categorias.nome AS "Categoria do Produto" from produtos JOIN categorias on produtos.id_categoria = categorias.id;

12. Liste os pedidos com nome do cliente e o status da entrega.
R: SELECT clientes.nome AS "Nome do Cliente" , pedidos.status_pagamento AS "Status do Pagamento", entregas.status_entrega AS "Status da Entrega" FROM 
clientes JOIN pedidos ON clientes.id = pedidos.id_cliente
JOIN entregas on pedidos.id = entregas.id;

PARTE 4 – SUBCONSULTAS (SUBQUERIES)

13. Liste os produtos que nunca foram vendidos.
R: SELECT produtos.nome from produtos
WHERE NOT EXISTS(SELECT * FROM itens_pedidos WHERE produtos.id = itens_pedidos.id_produto)
#Continuar Daqui

