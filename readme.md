# Tes Pahamify Backend Engineer Intern
- Aplikasi REST API CRUD Pokemon

## Tech Stack
- Go 1.18
- MySQL 8.0
- Docker Engine 20.10.7
- Docker Compose v2

### Installation
1. Configure .env files, => copy .env.example and rename it to .env

2. Set up all configuration in .env files

4. Build docker image

    ```bash
    $ docker compose build
    ```

4. Create and run docker container using docker compose
  
    ```bash
    $ docker compose up -d  **or** $ docker-compose up -d
    ```

5. The app is ready to rock and roll
6. You can access the app at http://localhost:8081

- MySQL Client
  ```bash
    $ docker exec -it pokemon-docker-db mysql -uroot -psecret
  ```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
