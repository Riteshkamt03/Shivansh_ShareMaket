from flask import Blueprint, request, jsonify
from models import db, User

auth_blueprint = Blueprint('auth', __name__)

@auth_blueprint.route('/create_account', methods=['POST'])
def create_account():
    data = request.get_json()
    new_user = User(
        name=data['name'],
        dob=data['dob'],
        phone=data['phone'],
        email=data['email'],
        password=data['password']
    )
    db.session.add(new_user)
    db.session.commit()
    return jsonify({'message': 'Account created successfully'}), 200

@auth_blueprint.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    user = User.query.filter_by(email=data['username'], password=data['password']).first()
    if user:
        return jsonify({'message': 'Login successful'}), 200
    else:
        return jsonify({'message': 'Invalid credentials'}), 401
