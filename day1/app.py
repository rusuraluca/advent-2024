from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///calendar.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = 'supersecretkey'

db = SQLAlchemy(app)

class DailyMetric(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.Date, unique=True, nullable=False)
    metric = db.Column(db.Integer, nullable=False)

with app.app_context():
    db.create_all()

@app.route('/')
def index():
    today = datetime.today()
    return redirect(url_for('calendar', year=today.year, month=today.month))

@app.route('/calendar/<int:year>/<int:month>', methods=['GET', 'POST'])
def calendar(year, month):
    if request.method == 'POST':
        date_str = request.form.get('date')
        metric = int(request.form.get('metric'))

        if metric not in [20, 80]:
            return redirect(url_for('calendar', year=year, month=month))

        date = datetime.strptime(date_str, '%Y-%m-%d').date()
        existing_entry = DailyMetric.query.filter_by(date=date).first()
        if existing_entry:
            existing_entry.metric = metric
        else:
            new_entry = DailyMetric(date=date, metric=metric)
            db.session.add(new_entry)
        db.session.commit()

    prev_year, prev_month = (year - 1, 12) if month == 1 else (year, month - 1)
    next_year, next_month = (year + 1, 1) if month == 12 else (year, month + 1)

    days_in_month = (datetime(year, month + 1, 1) - datetime(year, month, 1)).days if month < 12 else 31
    first_day = datetime(year, month, 1).weekday()
    metrics = {metric.date.strftime('%Y-%m-%d'): metric.metric for metric in DailyMetric.query.all()}

    return render_template(
        'calendar.html',
        year=year,
        month=month,
        prev_year=prev_year,
        prev_month=prev_month,
        next_year=next_year,
        next_month=next_month,
        days_in_month=days_in_month,
        first_day=first_day,
        metrics=metrics,
    )

if __name__ == '__main__':
    app.run(debug=True)
