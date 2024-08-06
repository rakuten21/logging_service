from database import create_connection, close_connection

def create_log_table():
    query = """
    CREATE TABLE IF NOT EXISTS log_entries (
        id INT AUTO_INCREMENT PRIMARY KEY,
        log_level VARCHAR(50),
        system_name VARCHAR(100),
        action_type VARCHAR(100),
        entity_affected VARCHAR(100),
        user_id INT,
        username VARCHAR(100),
        role VARCHAR(50),
        ip_address VARCHAR(45),
        message TEXT,
        details TEXT,
        previous_state TEXT,
        new_state TEXT,
        transaction_id VARCHAR(100),
        amount DECIMAL(10, 2),
        transaction_type VARCHAR(50),
        inventory_id INT,
        quantity INT,
        date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );
    """
    connection = create_connection()
    cursor = connection.cursor()
    cursor.execute(query)
    connection.commit()
    close_connection(connection)

# Call the function to create the table
create_log_table()
