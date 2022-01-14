package validators

import (
	"fmt"
	"strings"

	"github.com/go-playground/validator/v10"
)

type FieldError struct {
	Err validator.FieldError
}

func (q FieldError) String() string {
	var sb strings.Builder

	sb.WriteString("validation failed on field '" + q.Err.Field() + "'")
	sb.WriteString(", condition: " + q.Err.ActualTag())

	// Print condition parameters, e.g. oneof=red blue -> { red blue }
	if q.Err.Param() != "" {
		sb.WriteString(" { " + q.Err.Param() + " }")
	}

	if q.Err.Value() != nil && q.Err.Value() != "" {
		sb.WriteString(fmt.Sprintf(", actual: %v", q.Err.Value()))
	}

	return sb.String()
}