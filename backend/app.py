from flask import Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from config import Config
from routes import bp as routes_blueprint

# Initialize extensions
db = SQLAlchemy()
bcrypt = Bcrypt()
login_manager = LoginManager()

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Initialize Flask extensions
    db.init_app(app)
    bcrypt.init_app(app)
    login_manager.init_app(app)

    # Enable CORS for all origins (adjust as needed for production)
    CORS(app, resources={r"/*": {"origins": "*"}})

    # Register blueprints
    app.register_blueprint(routes_blueprint)

    # Create database tables before the first request
    @app.before_first_request
    def create_tables():
        with app.app_context():
            db.create_all()

    # Set up login manager
    login_manager.login_view = 'routes.login'
    login_manager.login_message = 'Please log in to access this page.'

    return app

if __name__ == "__main__":
    app = create_app()
    app.run(debug=True)
