package validators

import (
	"reflect"
	"sync"

	"github.com/gin-gonic/gin/binding"
	"github.com/go-playground/validator/v10"
)

type DefaultValidator struct {
	Once     sync.Once
	Validate *validator.Validate
}

var _ binding.StructValidator = &DefaultValidator{}

func (v *DefaultValidator) ValidateStruct(obj interface{}) error {

	if KindOfData(obj) == reflect.Struct {

		v.LazyInit()

		if err := v.Validate.Struct(obj); err != nil {
			return error(err)
		}
	}

	return nil
}

func (v *DefaultValidator) Engine() interface{} {
	v.LazyInit()
	return v.Validate
}

func (v *DefaultValidator) LazyInit() {
	v.Once.Do(func() {
		v.Validate = validator.New()
		v.Validate.SetTagName("binding")

		// add any custom validations etc. here
	})
}

func KindOfData(data interface{}) reflect.Kind {

	value := reflect.ValueOf(data)
	valueType := value.Kind()

	if valueType == reflect.Ptr {
		valueType = value.Elem().Kind()
	}
	return valueType
}
