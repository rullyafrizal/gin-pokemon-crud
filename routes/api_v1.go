package routes

import (
	"pokemon-crud/controllers"

	"github.com/gin-gonic/gin"
)

func SetupRouter() *gin.Engine {
	r := gin.Default()

	grp1 := r.Group("/api/v1")
	{
		grp1.GET("pokemons", controllers.GetPokemons)
		grp1.GET("pokemons/:id", controllers.GetPokemon)
		grp1.POST("pokemons", controllers.StorePokemon)
		grp1.PUT("pokemons/:id", controllers.UpdatePokemon)
		grp1.DELETE("pokemons/:id", controllers.DeletePokemon)
	}

	return r
}
