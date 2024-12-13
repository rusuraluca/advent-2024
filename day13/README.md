# **Mini Sudoku Solver**

A C-based program that solves 4x4 Sudoku puzzles efficiently. The solver takes an incomplete 4x4 Sudoku grid as input and outputs a solved grid, adhering to Sudoku rules.

---

## **Features**

- **Efficient Solving**: Implements backtracking to solve any valid 4x4 Sudoku puzzle.
- **Input Validation**: Ensures the provided grid is well-formed and adheres to Sudoku constraints.

---

## **Technologies Used**

- **C Language**: Provides a fast and efficient implementation.

---

## **Setup Instructions**

### **Clone or Download the Repository**

Download the project files or clone the repository:

```bash
git clone https://github.com/rusuraluca/advent-2024
cd day13
```

### **Run the Application**

### **Using VS Code Dev Containers**

- Open the project in Visual Studio Code.
- Reopen the project in the Dev Container:
  - Open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P) and select Dev Containers: Reopen in Container.
- Open a terminal inside the container and run:

    ```bash
    gcc -o sudoku_solver sudoku_solver.c
    ./sudoku_solver < puzzle.txt
    ```

Locate the output plot (snowfall_trends.png) in your project folder.
