from flask import Flask, request, jsonify
from database import create_connection, close_connection

app = Flask(__name__)

@app.route('/logs', methods=['POST'])
def create_log():
    data = request.json
    connection = create_connection()
    cursor = connection.cursor()

    query = """
    INSERT INTO log_entries (log_level, system_name, action_type, entity_affected, user_id, username, role, ip_address, message, details, previous_state, new_state, transaction_id, amount, transaction_type, inventory_id, quantity)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """

    cursor.execute(query, (
        data.get('log_level'), data.get('system_name'), data.get('action_type'), data.get('entity_affected'),
        data.get('user_id'), data.get('username'), data.get('role'), data.get('ip_address'), data.get('message'),
        data.get('details'), data.get('previous_state'), data.get('new_state'), data.get('transaction_id'),
        data.get('amount'), data.get('transaction_type'), data.get('inventory_id'), data.get('quantity')
    ))

    connection.commit()
    close_connection(connection)
    return jsonify({"message": "Log created successfully"}), 201

@app.route('/logs', methods=['GET'])
def get_logs():
    connection = create_connection()
    cursor = connection.cursor(dictionary=True)

    log_level = request.args.get('log_level')
    system_name = request.args.get('system_name')
    query = "SELECT * FROM log_entries WHERE 1=1"
    params = []

    if log_level:
        query += " AND log_level = %s"
        params.append(log_level)
    if system_name:
        query += " AND system_name = %s"
        params.append(system_name)

    cursor.execute(query, params)
    logs = cursor.fetchall()
    close_connection(connection)
    return jsonify(logs), 200

@app.route('/logs/<int:log_id>', methods=['GET'])
def get_log(log_id):
    connection = create_connection()
    cursor = connection.cursor(dictionary=True)

    query = "SELECT * FROM log_entries WHERE id = %s"
    cursor.execute(query, (log_id,))
    log = cursor.fetchone()
    close_connection(connection)

    if log:
        return jsonify(log), 200
    return jsonify({"message": "Log not found"}), 404