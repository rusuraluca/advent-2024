# **Strong Password Generator**

A Go-based command-line tool for generating random, secure passwords. This utility allows users to create passwords of desired lengths and customize character inclusion (symbols, numbers, uppercase letters) for enhanced security.

---

## **Features**
- **Customizable Passwords**: Users can specify the password length and choose to include symbols, numbers, and uppercase letters.
- **High Security**: Uses crypto/rand for generating cryptographically secure random characters.
- **Easy to Use**: Simple command-line interface for quick password generation.

---

## **Technologies Used**
- **Go**: Core programming language for the application.
- **crypto/rand**: Ensures secure random number generation.
- **Strings Builder**: Efficiently constructs the password string.

---

## **Setup Instructions**

### **Prerequisites**
- Go programming language installed (version 1.16 or higher recommended).

### **Clone or Download the Repository**
Download the project files or clone the repository:
```bash
$ git clone https://github.com/rusuraluca/advent-2024
$ cd day10
```

### **Compile and Run the Application**
Run the following command:
```bash
$ go run main.go
$ go build -o main
$ ./main
```
Use the following command-line flags to customize your password:

- `length`: Length of the password (default: 12)
- `symbols`: Include symbols like !@#$%^&* (default: true).
- `numbers`: Include numbers (default: true).
- `uppercase`: Include uppercase letters (default: true).

### **Example**
```bash
$ ./main -length 20 -symbols=true -numbers=true -uppercase=true
Generated Password: Wr{j8xaE#Gtq&W@ELKW[
```