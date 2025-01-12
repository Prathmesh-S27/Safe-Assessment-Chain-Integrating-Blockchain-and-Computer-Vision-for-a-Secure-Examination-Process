import os

BASE_DIR = os.path.abspath(os.path.dirname(__file__))

# SQLite database configuration
SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(BASE_DIR, 'database.db')
SQLALCHEMY_TRACK_MODIFICATIONS = False

# Secret key for session management
SECRET_KEY = 'your_secret_key_here'
