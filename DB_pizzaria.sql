CREATE TABLE pizzas(
id_pizzas INT PRIMARY KEY AUTO_INCREMENT,
  sabor VARCHAR(60) NOT NULL,
  preco DECIMAL(5,2),
  descricao VARCHAR(100),
  tamanho VARCHAR(15),
  emb_material VARCHAR(50),
  emb_preco DECIMAL(5,2),
  emb_tamanho VARCHAR(15),
  id_pizza_receita INT
  
);

CREATE TABLE receitas(
id_receita INT PRIMARY KEY AUTO_INCREMENT,
instrucoes VARCHAR(500),
pizzaiolo VARCHAR(60),

 FOREIGN KEY(id_receita) REFERENCES pizzas(id_pizzas)

);

CREATE TABLE pizzaiolos (
id_pizzaiolos INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60),
salario DECIMAL(6,2)
);

CREATE TABLE pizzas_pizzaiolos(
id_pizzas INT,
id_pizzaiolos INT,

FOREIGN KEY(id_pizzas) REFERENCES pizzas(id_pizzas),
FOREIGN KEY(id_pizzaiolos) REFERENCES pizzaiolos(id_pizzaiolos)

);

CREATE TABLE ingredientes(
id_ingredientes INT PRIMARY KEY AUTO_INCREMENT,
ingredientes VARCHAR(50)
);

CREATE TABLE pizzas_ingredientes(
id_pizzas INT,
id_ingredientes INT,

FOREIGN KEY(id_pizzas) REFERENCES pizzas(id_pizzas),
FOREIGN KEY(id_ingredientes) REFERENCES ingredientes(id_ingredientes)

);

INSERT INTO pizzas(sabor, preco, descricao, tamanho, emb_material, emb_preco, emb_tamanho, id_pizza_receita) VALUES
('margherita', 12.99, 'Pizza clássica com molho de tomate, muçarela e manjericão.', 'media', 'papelao', 2.00, 'media',1),
('pepperoni', 14.99, 'Pizza com molho de tomate, pepperoni e muçarela derretido.', 'grande', 'papelao', 3.00, 'grande',2),
('calabresa', 13.99, 'Pizza com molho de tomate, calabresa e muçarela derretido.', 'media', 'papelao', 2.50, 'media',3),
('frango', 15.99, 'Pizza com frango grelhado, molho de tomate e muçarela.', 'grande', 'papelao', 3.00, 'grande',4),
('portuguesa', 14.50, 'Pizza com presunto, ovos, azeitonas e muçarela.', 'media', 'papelao', 2.50, 'media',5),
('vegetariana', 13.99, 'Pizza com varios legumes, molho de tomate e muçarela.', 'media', 'papelao', 2.00, 'media',6),
('lombo', 12.50, 'Pizza com molho de tomate, muçarela e lombo.', 'media', 'papelao', 2.00, 'media',7);

INSERT INTO receitas(instrucoes, pizzaiolo) VALUES
('Misture o molho de tomate, a muçarela e o manjericão. Espalhe a mistura sobre a massa da pizza e asse no forno a 220°C por 15 minutos.', 'mario'),
('Espalhe o molho de tomate sobre a massa da pizza. Adicione o pepperoni e o queijo derretido. Asse no forno a 200°C por 12 minutos.', 'mario'),
('Cubra a massa da pizza com molho de tomate, calabresa e queijo derretido. Asse a pizza a 220°C por 13 minutos.', 'peppino spaghetti'),
('Grelhe o frango e corte em pedaços. Espalhe o molho de tomate na massa da pizza, adicione o frango e o queijo. Asse a 210°C por 12 minutos.', 'peppino spaghetti'),
('Cubra a massa da pizza com presunto, ovos e azeitonas. Asse no forno a 200°C por 14 minutos.', 'peppino spaghetti'),
('Espalhe molho de tomate na massa da pizza e adicione vários legumes e queijo. Asse a 220°C por 13 minutos.', 'monica bellucci'),
('Misture o molho de tomate, a muçarela e o manjericão. Espalhe a mistura sobre a massa da pizza e asse no forno a 220°C por 15 minutos.', 'monica bellucci');

INSERT INTO pizzaiolos(nome, salario) VALUES
('mario', 3000.00),
('peppino spaghetti', 4000.00),
('monica bellucci', 3680.00);

INSERT INTO pizzas_pizzaiolos (id_pizzas, id_pizzaiolos) VALUES
(1,1),
(2,1),
(3,2),
(4,2),
(5,2),
(6,3),
(7,3);

INSERT INTO ingredientes (ingredientes) VALUES
('molho de tomate'),
('muçarela'),
('manjericao'),
('peperoni'),
('calabresa'),
('frango'),
('presunto'),
('ovo'),
('azeitona'),
('legumes'),
('lombo');
	
INSERT INTO pizzas_ingredientes (id_pizzas,id_ingredientes) VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,4),
(3,1),
(3,2),
(3,5),
(4,1),
(4,2),
(4,6),
(5,1),
(5,2),
(5,7),
(5,8),
(5,9),
(6,1),
(6,2),
(6,10),
(7,1),
(7,2),
(7,11);

SELECT 
    pizzas.sabor AS Sabor_Pizza, 
    GROUP_CONCAT(pizzaiolos.nome) AS Pizzaiolo
FROM
    pizzas
        JOIN
    pizzas_pizzaiolos ON pizzas.id_pizzas = pizzas_pizzaiolos.id_pizzas
        JOIN
    pizzaiolos ON pizzas_pizzaiolos.id_pizzaiolos = pizzaiolos.id_pizzaiolos
    
    GROUP BY pizzas.sabor;
    

select 
	pizzas.sabor as sabores,
    GROUP_CONCAT(ingredientes.ingredientes) as ingredientes 
    
    from pizzas
     
    join pizzas_ingredientes  on pizzas.id_pizzas = pizzas_ingredientes.id_pizzas 
    
    join ingredientes on pizzas_ingredientes.id_ingredientes = ingredientes.id_ingredientes
    
    GROUP BY pizzas.sabor;


SELECT 
		ingredientes.ingredientes as ingredientes,
        GROUP_CONCAT(pizzas.sabor) as sabores
        
	from ingredientes
    
		join pizzas_ingredientes on ingredientes.id_ingredientes = pizzas_ingredientes.id_ingredientes
        
        join pizzas on pizzas_ingredientes.id_pizzas = pizzas.id_pizzas
    
    GROUP BY ingredientes.ingredientes;
    
    SELECT 
    pizzas.sabor AS sabor,
    pizzaiolos.nome AS nome,
    receitas.instrucoes AS instrucoes
FROM
    pizzas
        JOIN
    pizzas_pizzaiolos ON pizzas.id_pizzas = pizzas_pizzaiolos.id_pizzas
        JOIN
    pizzaiolos ON pizzas_pizzaiolos.id_pizzaiolos = pizzaiolos.id_pizzaiolos
        JOIN
    receitas ON pizzas.id_pizza_receita = receitas.id_receita


