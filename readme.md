# Tes Pahamify Backend Engineer Intern
- Aplikasi REST API CRUD Pokemon

## Tech Stack
- Go 1.17
- Gin 1.7.7
- MySQL 8.0
- Docker Engine 20.10.7
- Docker Compose v2

## Endpoints
| Route  | HTTP Method   | Handler |
| ------------- | -------------  | ------------- |
| /api/v1/pokemons/  | GET    | controllers.GetPokemons |
| /api/v1/pokemons/:id  | GET    | controllers.GetPokemon  |
| /api/v1/pokemons  | POST    | controllers.StorePokemon  |
| /api/v1/pokemons/:id  | PUT    | controllers.UpdatePokemon  |
| /api/v1/pokemons/:id  | DELETE    | controllers.DeletePokemon  |

**Endpoint Documentation** : https://documenter.getpostman.com/view/14542872/UVXjKbWn
### Installation
1. Configure .env files, => copy .env.example and rename it to .env

2. Don't change anything after you copy .env.example to .env

4. Build docker image

    ```bash
    docker compose build
    ```

5. Create and run docker container using docker compose
  
    ```bash
    docker compose up -d
    ```

- If you're not using compose v2, you can use `docker-compose` instead of `docker compose`

6. The app is ready to rock and roll
7. You can access the app at http://localhost:8081
8. And don't worry about the database, it's already created and filled for you while you build the app with docker


* if you want to connect with mysql client, you can use this command:
- MySQL Client
  ```bash
    docker exec -it pokemon-docker-db mysql -uroot -psecret
  ```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
