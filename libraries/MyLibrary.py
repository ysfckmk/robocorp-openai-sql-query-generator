from robot.api import logger
import sqlite3

# example of accessing a variable from variables.py
from variables import DB_PATH

class MyLibrary:
    """Database Sheme export library"""
    def db_export(self):
        connection = sqlite3.connect(DB_PATH)
        cursor = connection.cursor()

    # Tablo adlarını al
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = cursor.fetchall()

        schema_string = ""

    # Tablo şemalarını çıkar
        for table in tables:
            table_name = table[0]
            cursor.execute(f"PRAGMA table_info({table_name})")
            columns = cursor.fetchall()

            schema_string += f"Table: {table_name}\n"
            for column in columns:
                column_name = column[1]
                data_type = column[2]
                schema_string += f"- {column_name}: {data_type}\n"

            schema_string += "\n"

        connection.close()

        return schema_string
