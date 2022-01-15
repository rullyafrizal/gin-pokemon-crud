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
- Demo Video : https://www.loom.com/share/5804207837fc494eb0f12c60d3a8775c

1. Configure .env files, => copy .env.example and rename it to .env

2. Don't change anything after you copy .env.example to .env

3. Build docker image, If you're not using compose v2, you can use `docker-compose` instead of `docker compose`

    ```bash
    docker compose build
    ```

4. Create and run docker container using docker compose
  
    ```bash
    docker compose up -d
    ```
* tips = make sure to wait for the container to start before running the tests, usually it takes about 5-10 seconds after you run `docker-compose up -d`
* The app is ready to rock and roll, use http://localhost:8081
* And don't worry about the database, it's already created and filled for you while you build the app with docker

5. If you want to stop and remove the container
   
    ```bash
    docker compose down
    ```

* if you want to connect with mysql client, you can use this command:
- MySQL Client
  ```bash
    docker exec -it pokemon-docker-db mysql -uroot -psecret
  ```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
