package requests

type UpdatePokemonRequest struct {
	Name   string   `json:"name" binding:"required"`
	Number string   `json:"number" binding:"required"`
	Types  []string `json:"types"`
}
