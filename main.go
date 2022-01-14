package main

import (
	"fmt"
	"log"
	"pokemon-crud/config"
	"pokemon-crud/models"
	"pokemon-crud/routes"

	"github.com/jinzhu/gorm"
	"github.com/joho/godotenv"
)

var err error

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	config.DB, err = gorm.Open("mysql", config.DbUrl(config.BuildDbConfig()))

	if err != nil {
		fmt.Println("Error:", err)
	}

	defer config.DB.Close()
	config.DB.AutoMigrate(&models.Pokemon{}, &models.Type{})

	r := routes.SetupRouter()

	r.Run()
}
