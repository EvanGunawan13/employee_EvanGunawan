import 'package:firebase_database/firebase_database.dart';

class EmployeeService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref().child('Employee_List',);
  Stream<Map<String, Map<String, String>>>getEmployeeList(){
    return _database.onValue.map((event){
      final Map<String, Map<String, String>> personel ={};
      DataSnapshot snapshot = event.snapshot;
      
      if(snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key,value){
          personel[key] ={
            'name':value['name'] as String, 'position': value as String
          };
        });
      }
      return personel;

    });
  }

  void addEmployee(String employeeName, String position){
    _database.push().set({'name':employeeName, 'position':position});
  }

  Future<void> removeEmployee(String key) async{
    await _database.child(key).remove();
  }
}