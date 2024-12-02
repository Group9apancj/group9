import 'package:postgres/postgres.dart';
import 'dart:math';

class Database {
  late PostgreSQLConnection connection;

  Database() {
    connection = PostgreSQLConnection(
      'localhost',
      5432,
      'login_db',
      username: 'postgres',
      password: 'AaliyahMbowani1202',
    );
  }

  Future<void> openC() async {
    try {
      await connection.open();
      print("Connection to database is successful");
    } catch (e) {
      print("Connection to database is unsuccessful: $e");
    }
  }

  Future<void> createUser(
      String ID, String username, String email, String password, String gender, String DOB) async {
    try {
      await connection.query(''' 
        CREATE TABLE IF NOT EXISTS users (
          ID VARCHAR(10) PRIMARY KEY,
          username VARCHAR(50),
          email VARCHAR(100),
          password VARCHAR(200),
          gender VARCHAR(20),
          DOB VARCHAR(20)
        );
      ''');

      await connection.query(
          '''INSERT INTO users (ID, username, email, password, gender, DOB) 
             VALUES (@ID, @username, @email, @password, @gender, @DOB)''',
          substitutionValues: {
            'ID': ID,
            'username': username,
            'email': email,
            'password': password,
            'gender' : gender,
            'DOB' : DOB,
          });
      print("User created successfully");
    } catch (e) {
      print("Error creating user: $e");
    }
  }
}

void main() async {
  Database db = Database();
  await db.openC();

  Random rand = Random();
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  String clientID = List.generate(10, (index) => characters[rand.nextInt(characters.length)]).join();

  if (db.connection.isClosed) {
    print("Failed to open connection.");
  } else {
    await db.createUser(clientID, 'Warge', 'warge@gmail.com', '0998', 'male', '2000-1-01');
  }
}
