package main

import (
	"crypto/rand"
	"flag"
	"fmt"
	"math/big"
	"strings"
)

func GeneratePassword(length int, useSymbols, useNumbers, useUppercase bool) string {
	lowercase := "abcdefghijklmnopqrstuvwxyz"
	numbers := "0123456789"
	symbols := "!@#$%^&*()-_+=<>?/{}[]"
	uppercase := strings.ToUpper(lowercase)

	charset := lowercase
	if useUppercase {
		charset += uppercase
	}
	if useNumbers {
		charset += numbers
	}
	if useSymbols {
		charset += symbols
	}

	password := strings.Builder{}
	for i := 0; i < length; i++ {
		index, _ := rand.Int(rand.Reader, big.NewInt(int64(len(charset))))
		password.WriteByte(charset[index.Int64()])
	}

	return password.String()
}

func main() {
	length := flag.Int("length", 12, "Length of the password")
	useSymbols := flag.Bool("symbols", true, "Include symbols (!@#$%^&*)")
	useNumbers := flag.Bool("numbers", true, "Include numbers (0-9)")
	useUppercase := flag.Bool("uppercase", true, "Include uppercase letters (A-Z)")

	flag.Parse()

	password := GeneratePassword(*length, *useSymbols, *useNumbers, *useUppercase)
	fmt.Println("Generated Password:", password)
}
