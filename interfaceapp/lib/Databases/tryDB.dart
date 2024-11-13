import 'dart:io';
import 'package:postgres/postgres.dart';

class Database{
  late PostgreSQLConnection connection;

  DataBase() {
    connection = PostgreSQLConnection(
      'localhost',
      5432,
      'Messages',
      username: 'postgres',
      password: 'warge',
    );
  }

  Future<void> openC() async{
    try{
      await connection.open();
      print("Connection to the database is successful");
    }
    catch(e){
      print("Connection to the database is unsuccessful");
    }
  }
}

void main() async{
  Database db=Database();

  await db.openC();

}