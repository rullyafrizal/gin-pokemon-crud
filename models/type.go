package models

import (
	"time"
)

type Type struct {
	ID        uint      `json:"id" gorm:"primaryKey"`
	Name      string    `json:"name" required:"true"`
	CreatedAt time.Time `json:"-" gorm:"default:CURRENT_TIMESTAMP;autoCreateTime"`
	UpdatedAt time.Time `json:"-" gorm:"default:CURRENT_TIMESTAMP;autoUpdateTime"`
}

func (t *Type) TableName() string {
	return "types"
}
