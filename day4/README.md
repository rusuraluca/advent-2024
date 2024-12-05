# **Currency Converter**

A simple and efficient console-based currency converter built with C#. It demonstrates the power of LINQ and `HttpClient` to fetch and process real-time exchange rates from an external API.

---

## **Features**
- **Currency Conversion:** Converts amounts between any two currencies using live exchange rates.
- **Real-Time Rates:** Fetches the latest exchange rates from a public API.
- **Simple Interface:** User-friendly, console-based prompts for seamless interaction.
- **Asynchronous Programming:** Leverages `HttpClient` for non-blocking API requests.
- **Efficient Filtering:** Uses LINQ for quick and easy processing of exchange rate data.

---

## **Technologies Used**
- **C#:** Modern object-oriented programming language.
- **HttpClient:** For handling API requests.
- **LINQ:** For querying and filtering data efficiently.
- **Newtonsoft.Json:** For JSON serialization and deserialization.

---

## **Setup Instructions**

### **Prerequisites**
- Install [.NET 6.0](https://dotnet.microsoft.com/download/dotnet/6.0) or later.

### **Clone the Repository**
```bash
git clone https://github.com/rusuraluca/advent-2024
cd day4
```

### **Install Dependencies**
Ensure the necessary NuGet package is installed:

```bash
dotnet add package Newtonsoft.Json
```

---

## **Run the Application**

### **Start the Application**

```bash
dotnet run
```

### **Follow the Prompts**
```bash
Enter the base currency (e.g., USD).
Enter the target currency (e.g., EUR).
Enter the amount to convert.
```

### **Example**

```bash
Enter Base Currency (e.g., USD): USD
Enter Target Currency (e.g., EUR): EUR
Enter Amount to Convert: 100
100 USD = 91.23 EUR (Rate: 0.9123)
```