# **Plot Snowfall Trends**

A Dockerized R-based application that visualizes snowfall trends using a line graph. The app processes data from a CSV file and outputs a trend plot for analyzing regional snowfall patterns.

---

## **Features**
- **Dynamic Visualization**: Generates a line graph to showcase snowfall trends over time.
- **Data-Driven Insights**: Processes data from a user-provided CSV file to create meaningful visualizations.
- **Exportable Plot**: Saves the resulting graph as a PNG file for easy sharing and analysis.

---

## **Technologies Used**
- **R Language**: For data processing and visualization.
- **ggplot2**: A powerful library for creating plots and charts.
- **Docker**: Ensures consistent and portable runtime environments.

---

## **Setup Instructions**

### **Clone or Download the Repository**
Download the project files or clone the repository:
```bash
$ git clone https://github.com/rusuraluca/advent-2024
$ cd day12
```

### **Run the Application**

### **Using VS Code Dev Containers**
- Open the project in Visual Studio Code.
- Reopen the project in the Dev Container:
- Open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P) and select Dev Containers: Reopen in Container.
- Open a terminal inside the container and run:
    ```bash
    $ Rscript snowfall_trends.R
    ```
Locate the output plot (snowfall_trends.png) in your project folder.