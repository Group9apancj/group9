import 'dart:math';
import 'package:postgres/postgres.dart';

class Database {
  late PostgreSQLConnection connection;

  Database() {
    connection = PostgreSQLConnection(
      '192.168.1.125',
      5432,
      'Patients',
      username: 'postgres',
      password: 'warge',
    );
    openC();
  }

  Future<void> openC() async {
    try {
      await connection.open();
      print("Connection to the database is successful");
    } catch (e) {
      print("Connection to the database is unsuccessful $e");
    }
  }

  Future<dynamic> insertPatient(
      String name, String age, String email, String password) async {
    Random rand = Random();
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String ID = List.generate(
        10, (index) => characters[rand.nextInt(characters.length)]).join();

    try {
      await connection.query(''' CREATE TABLE IF NOT EXISTS patient (
          patient_ID VARCHAR(10) PRIMARY KEY,
          patient_name VARCHAR(50),
          age VARCHAR(255),
    patient_email VARCHAR(100),
    password VARCHAR(255)
    );''');

      await connection.query('''
    INSERT INTO patient(patient_ID,patient_name,age,patient_email,password)
    VALUES(@ID,@name,@age,@email,@password)''', substitutionValues: {
        "ID": ID,
        "name": name,
        "age": age,
        "email": email,
        "password": password,
      });
      return "Register successful, return to login page";
    } catch (e) {
      return "Register unsuccessful $e";
    }
  }

  Future<dynamic> login(String name, String pass) async {
    try {
      var data=await connection.query('''
          SELECT patient_name, password
          FROM patient
          WHERE patient_name = @name
          ''', substitutionValues: {
        'name': name
      });
      print(data.toString());
      if(data[0][1]==pass){
        return true;
      }
      else{
        return false;
      }
    } catch (e) {
      return "";
    }
  }
}

void main() async {
  Database db = Database();
  await db.openC();

  final result =
      await db.insertPatient("warge", "100", "warge@gmail.com", "12345");
  print(result);
}
