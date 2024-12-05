# **Mini HTTP File Server**

A lightweight Go-based HTTP server for sharing local files, demonstrating the simplicity and efficiency of Go's networking capabilities. This file server enables you to share files from a directory on your machine through a web browser.

---

## **Features**
- **File Sharing:** Serves files from a specified directory (`./shared` by default).
- **Simple Setup:** No additional dependencies—leverages Go's powerful standard library.
- **Directory Browsing:** Displays a list of files and subdirectories in the shared directory.
- **Download Support:** Easily download files directly from your browser.

---

## **Technologies Used**
- **Go (Golang):** Programming language for building efficient and scalable web servers.

---

## **Setup Instructions**

### **Prerequisites**
- Install Go (1.20 or higher recommended).

### **Clone the Repository**
```bash
git clone https://github.com/rusuraluca/advent-2024
cd day5
```

### **Run the Servers**
Ensure the shared directory exists:
```bash
mkdir shared
```
Add files to the shared directory for sharing.
```bash
echo "Hello, World!" > shared/hello.txt
```

### **Start the server**

```bash
go run main.go
```