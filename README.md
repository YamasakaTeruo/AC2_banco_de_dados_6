# Atividade individual - Tema: Base de Dados Pizzaria (Modelo Lógico)
## Descrição
introdução e implementação do modelo logico em banco de dados. 

## Atividade:
Transforme o modelo conceitual

![image](https://github.com/YamasakaTeruo/AC2_banco_de_dados_5/assets/144747935/c940a98c-6fb2-48f4-aada-2e6b8d2c06d7)

em modelo lógico;

![image](https://github.com/YamasakaTeruo/AC2_banco_de_dados_5/assets/144747935/70a054d9-e136-4ac1-a9cc-ddc3bc526a9a)

Escreva o script SQL que cria o banco de dados;
```
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
 ```

Insira dados no banco criado;
```
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
(1,1),(2,1),
(3,2),(4,2),(5,2),
(6,3),(7,3);

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
(1,1),(1,2),(1,3),
(2,1),(2,2),(2,4),
(3,1),(3,2),(3,5),
(4,1),(4,2),(4,6),
(5,1),(5,2),(5,7),(5,8),(5,9),
(6,1),(6,2),(6,10),
(7,1),(7,2),(7,11);
 ```

Crie um relatório com todas as pizzas e os pizzaiolos aptos a produzi-las;

![image](https://github.com/YamasakaTeruo/AC2_banco_de_dados_5/assets/144747935/6d713eb9-0d4b-4118-96cb-6776d171f0c3)

Crie um relatório com todas as pizzas e seus ingredientes;

![image](https://github.com/YamasakaTeruo/AC2_banco_de_dados_5/assets/144747935/1e23905b-78e4-406c-8285-6c0fc935de63)

Crie um relatório com todos os ingredientes e as pizzas onde são utilizados;

![image](https://github.com/YamasakaTeruo/AC2_banco_de_dados_5/assets/144747935/363e6e34-dd99-4421-b7b7-cc7bc6321a12)

Crie um relatório com os sabores de todas as pizzas, o nome dos pizzaiolos que as fazem e as instruções para produzi-las;

![image](https://github.com/YamasakaTeruo/AC2_banco_de_dados_5/assets/144747935/f762834b-4ff6-4f85-a961-710793bb1237)


