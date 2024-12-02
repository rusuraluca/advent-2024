# **80/20 Rule Daily Metrics Calendar**

A simple Flask-based web application for tracking daily metrics in a visually appealing calendar format. This app allows users to input daily metrics (20% or 80%) and displays them on a calendar with color-coded feedback.

---

## **Features**
- **Interactive Calendar:** View a monthly calendar with metrics displayed as color-coded days:
  - **Red (#FF6060):** Represents 20%.
  - **Green (#87DF5E):** Represents 80%.
- **Metric Input:** Add or update metrics for specific dates using a simple form.
- **Navigation:** Switch between months seamlessly using navigation buttons.

---

## **Technologies Used**
- **Python 3.9+**
- **Flask**: Web framework for backend development.
- **Flask-SQLAlchemy**: For database management using SQLite.
- **HTML/CSS**: For UI/UX.
- **SQLite**: Lightweight database for storing metrics.

---

## **Setup Instructions**

### **Prerequisites**
- Python 3.9 or higher installed.
- A virtual environment tool (optional but recommended).

### **Clone the Repository**
```bash
git clone https://github.com/rusuraluca/advent-2024
cd day1
```

### **Install Dependencies**
Create and activate a virtual environment (optional):
```bash
python -m venv venv
source venv/bin/activate  
# On Windows: venv\Scripts\activate
```

### **Install required packages**
```bash
pip install -r requirements.txt
```

### **Run the Application**
```bash
python app.py
```

Open your browser and navigate to http://127.0.0.1:5000/.

### **Exit the virtual environment**
```bash
deactivate
```
