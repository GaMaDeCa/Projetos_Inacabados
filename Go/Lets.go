package main
// Go is good tho, reminds me C/C++
import (
	"fmt"
	"math/rand"
)
// Magic 8 Ball, execute the program and gets your magical answer
type Magic8Ball struct {
	answers []string
}
func InitMagic8Ball() *Magic8Ball {
	return &Magic8Ball{
		answers: []string{
			// Positive (10)
			"It is certain.",
			"It is decidedly so.",
			"Without a doubt.",
			"Yes – definitely.",
			"You may rely on it.",
			"As I see it, yes.",
			"Most likely.",
			"Outlook good.",
			"Yes.",
			"Signs point to yes.",
			// Non-committal (5)
			"Reply hazy, try again.",
			"Ask again later.",
			"Better not tell you now.",
			"Cannot predict now.",
			"Concentrate and ask again.",
			// Negative (5)
			"Don't count on it.",
			"My reply is no.",
			"My sources say no.",
			"Outlook not so good.",
			"Very doubtful.",
		},
	}
}
func (b *Magic8Ball) Predict() string {
	return b.answers[rand.Intn(len(b.answers)-1)]
}
func main() {
	magic8Ball := InitMagic8Ball()
	fmt.Println(magic8Ball.Predict())
}