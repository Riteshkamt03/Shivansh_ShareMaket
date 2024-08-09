from flask import Blueprint, request, jsonify
from models import db, User

user_blueprint = Blueprint('user', __name__)

@user_blueprint.route('/update_account', methods=['PUT'])
def update_account():
    data = request.get_json()
    user = User.query.filter_by(email=data['email']).first()
    if user:
        user.name = data['name']
        user.phone = data['phone']
        db.session.commit()
        return jsonify({'message': 'Account updated successfully'}), 200
    else:
        return jsonify({'message': 'User not found'}), 404
