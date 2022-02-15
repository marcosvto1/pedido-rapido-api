# Instalação

# Requisitos

- GIT
- DOCKER instaldo
- Ruby

## Para rodar o projeto

1. Clonar o projeto
2. acessar a pasta do projeto
3. Exec: `docker-compose up` (Vai subir o banco de dados do POSTGRES)

Após rodar subir o docker

4. Exec:
	1. `rails db:create` 
    2. `rails db:migrate`
5. Exec: 
	`rails s` (Vai subir a aplicação rails)
* Caso vc já esteja utilizando a porta 3000 em outro projeto rodar o comando baixo
`rails s --port=3001

6. Dentro do projeto tem uma pasta chamada docs e dentro dela vai ter um arquivo chamado "api_collection.json", este arquivo vai conter toda documentação da api no postman, basta pegar o arquivo e importar no postman