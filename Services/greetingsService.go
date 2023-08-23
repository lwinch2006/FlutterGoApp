package Services

type GreetingService struct{}

func (gs *GreetingService) GetGreeting() string {
	return "Привет \"Вермишель и профитрольки\""
}
