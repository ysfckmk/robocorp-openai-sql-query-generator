import sqlite3


def Run_Sqlite_Query(dbName,query):
          # Connect to the SQLite database
          connection = sqlite3.connect(dbName)

          # Create a cursor object to execute SQL queries
          cursor = connection.cursor()

          # Execute the query
          query = query
          cursor.execute(query)

          # Fetch the query result
          result = cursor.fetchall()

          # Process and display the result
          if result:
           return result
           print(result)
          else:
           print("No matching record found.")

          # Close the cursor and the database connection
          cursor.close()
          connection.close()