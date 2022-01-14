package services

import (
	. "pokemon-crud/config"
	. "pokemon-crud/models"
	. "pokemon-crud/requests"
	"strconv"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

func GetAllPokemons(pokemon *[]Pokemon, limit string) (err error) {
	if limit != "" {
		lim, err := strconv.Atoi(limit)
		if err != nil {
			return err
		}

		if err = DB.Limit(lim).Preload("Types").Find(pokemon).Error; err != nil {
			return err
		}
	} else {
		if err = DB.Preload("Types").Find(pokemon).Error; err != nil {
			return err
		}
	}

	return nil
}

func GetPokemon(pokemon *Pokemon, id string) (err error) {
	if err = DB.Where("id = ?", id).Preload("Types").First(pokemon).Error; err != nil {
		return err
	}

	return nil
}

func CreatePokemon(req *StorePokemonRequest) (err error) {
	DB.Transaction(func(tx *gorm.DB) error {
		var types []Type

		for _, typeName := range req.Types {
			var t Type = Type{Name: typeName}

			tx.Where(t).FirstOrCreate(&t)
			types = append(types, t)
		}

		var pokemon Pokemon = Pokemon{
			Name:   req.Name,
			Number: req.Number,
			Types:  types,
		}

		if err = tx.Save(&pokemon).Error; err != nil {
			return err
		}

		return nil
	})

	return nil
}

func UpdatePokemon(req *UpdatePokemonRequest, id string) (err error) {
	DB.Transaction(func(tx *gorm.DB) error {
		var pokemon Pokemon
		var types []Type

		if err := GetPokemon(&pokemon, id); err != nil {
			return err
		}

		for _, typeName := range req.Types {
			var t Type = Type{Name: typeName}

			tx.Where(t).FirstOrCreate(&t)
			types = append(types, t)
		}

		pokemon.Name = req.Name
		pokemon.Number = req.Number
		tx.Model(&pokemon).Association("Types").Replace(types)

		if err = tx.Save(&pokemon).Error; err != nil {
			return err
		}

		return nil
	})

	return nil
}

func DeletePokemon(id string) (err error) {
	DB.Transaction(func(tx *gorm.DB) error {
		var pokemon Pokemon

		if err := GetPokemon(&pokemon, id); err != nil {
			return err
		}

		tx.Model(&pokemon).Association("Types").Clear()

		if err := tx.Delete(&pokemon).Error; err != nil {
			return err
		}

		return nil
	})
	return nil
}
