package models

import (
	"time"

	"github.com/google/uuid"
	"github.com/jinzhu/gorm"
)

type Pokemon struct {
	ID        uuid.UUID `json:"id" gorm:"primaryKey"`
	Number    string    `json:"number"`
	Name      string    `json:"name"`
	Types     []Type    `json:"types" gorm:"many2many:pokemon_types;"`
	CreatedAt time.Time `json:"-" gorm:"default:CURRENT_TIMESTAMP;autoCreateTime"`
	UpdatedAt time.Time `json:"-" gorm:"default:CURRENT_TIMESTAMP;autoUpdateTime"`
}

func (p *Pokemon) TableName() string {
	return "pokemons"
}

func (user *Pokemon) BeforeCreate(scope *gorm.Scope) error {
	scope.SetColumn("ID", uuid.New())

	return nil
}
