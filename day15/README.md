# **Holiday Gift Tracker**

A PostgreSQL-based project to organize holiday gifts and track budgets. The database keeps a record of recipients and their gifts, along with prices and purchase status.

---

## **Features**

- **Track Recipients**: Record the people you're gifting and their preferences.
- **Gift Management**: Organize gifts, including price and purchase status.
- **Budget Overview**: Fetch summaries of total spending and remaining budgets.

---

## **Technologies Used**

- **PostgreSQL**: Database for storing and querying data.
- **SQL**: For schema definition and data queries.

---

## **Setup Instructions**

### **Clone or Download the Repository**

Download the project files or clone the repository:

```bash
git clone https://github.com/rusuraluca/advent-2024
cd day15
```

### **Run the Application**

### **Using VS Code Dev Containers**

- Open the project in Visual Studio Code.
- Reopen the project in the Dev Container:
  - Open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P) and select Dev Containers: Reopen in Container.
- Open a terminal inside the container and run:

    ```bash
    docker exec -it holiday_tracker psql -U postgres -d holiday_tracker
    ```

- Run queries:

    ```bash
    \i queries/fetch_gift_list.sql
    \i queries/fetch_budget_summary.sql
    ```
