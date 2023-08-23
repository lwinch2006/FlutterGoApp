package Services

import "math/rand"

type MathService struct{}

func (ms *MathService) GetRandomNumber() int {
	return rand.Intn(100)
}
