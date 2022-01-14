package controllers

import (
	"net/http"

	. "pokemon-crud/models"
	. "pokemon-crud/requests"
	"pokemon-crud/services"
	. "pokemon-crud/validators"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
)

func GetPokemons(c *gin.Context) {
	var pokemons []Pokemon = []Pokemon{}

	err := services.GetAllPokemons(&pokemons, c.Query("limit"))

	if err != nil {
		c.AbortWithStatus(http.StatusNotFound)
		return
	} 

	c.JSON(http.StatusOK, gin.H{
		"message": "OK",
		"data":    gin.H{"pokemons": pokemons},
	})
}

func GetPokemon(c *gin.Context) {
	var pokemon Pokemon = Pokemon{}

	err := services.GetPokemon(&pokemon, c.Param("id"))

	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"message": "Resource Not Found",
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "OK",
		"data":    gin.H{"pokemon": pokemon},
	})
}

func StorePokemon(c *gin.Context) {
	var req StorePokemonRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		for _, fieldErr := range err.(validator.ValidationErrors) {
			c.JSON(http.StatusBadRequest, gin.H{
				"message": "error",
				"error":   FieldError{Err: fieldErr}.String(),
			})
			return
		}
	}

	err := services.CreatePokemon(&req)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "Internal Server Error",
			"data":    err,
		})
	} else {
		c.JSON(http.StatusCreated, gin.H{
			"message": "OK",
		})
	}
}

func UpdatePokemon(c *gin.Context) {
	var req UpdatePokemonRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		for _, fieldErr := range err.(validator.ValidationErrors) {
			c.JSON(http.StatusBadRequest, gin.H{
				"message": "error",
				"error":   FieldError{Err: fieldErr}.String(),
			})
			return
		}
	}

	err := services.UpdatePokemon(&req, c.Param("id"))

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "Internal Server Error",
			"data":    err,
		})
	} else {
		c.JSON(http.StatusOK, gin.H{
			"message": "OK",
		})
	}
}

func DeletePokemon(c *gin.Context) {
	err := services.DeletePokemon(c.Param("id"))

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "Internal Server Error",
			"data":    err,
		})
	} else {
		c.JSON(http.StatusOK, gin.H{
			"message": "OK",
		})
	}
}
