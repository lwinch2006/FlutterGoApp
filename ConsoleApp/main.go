package main

import (
	"fmt"
	"github.com/lwinch2006/FlutterGoApp/Services"
)

func main() {
	var greetingsService = Services.GreetingService{}
	var mathService = Services.MathService{}

	fmt.Printf("%s"+"\n", greetingsService.GetGreeting())
	fmt.Printf("%d"+"\n", mathService.GetRandomNumber())
}
