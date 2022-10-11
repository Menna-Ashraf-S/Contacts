import 'package:flutter_pro/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
static final DbHelper _instance = DbHelper.internal();
  factory DbHelper () => _instance ;
  DbHelper.internal();
  static  Database ? _db ;

  Future createDatabase () async {
    if(_db != null ){
      return _db ;
    }
    String path = join (await getDatabasesPath() , 'Contacts.db') ;
     _db = await openDatabase( path , version: 1 , onCreate: (Database db,  int version)async {

      await db.execute('''create table contacts (
        id integer primary key autoincrement,
        name text not null,
        number text not null ,
        url text not null
  )
      ''');
    },
    
     );
     return _db ;
     }
    Future <int> createBook (Contact contact) async{
      Database db = await createDatabase() ;
      return db.insert('contacts', contact.toMap() );
     }

     Future <List> allTasks ()async{
      Database db = await createDatabase() ;
      return await db.query('contacts');
     }

     Future <int> delete (int id) async{
      Database db = await createDatabase() ;
      return db.delete('contacts' , where: 'id = ?', whereArgs: [id]);
     }
}