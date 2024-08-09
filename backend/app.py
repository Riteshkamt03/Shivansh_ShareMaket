from flask import Flask, request, jsonify
from routes import auth, user

app = Flask(__name__)
app.register_blueprint(auth.auth_blueprint)
app.register_blueprint(user.user_blueprint)

if __name__ == '__main__':
    app.run(debug=True,port=500)
