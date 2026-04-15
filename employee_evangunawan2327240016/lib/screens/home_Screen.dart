import 'package:employee_evangunawan2327240016/services/employee_service.dart';
import 'package:employee_evangunawan2327240016/screens/add_employee.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  final EmployeeService _service = EmployeeService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Karyawan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (_) const AddEmployee()),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed (){
        Navigator.push(context, MaterialPageRoute(builder: (_) const AddEmployee()),
        );
      }
      child: const Icon(Icons.add),
      ),

      body: StreamBuilder<Map<String, Map<String, String>>>(stream: _service.getEmployeeList(), builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }

        if(snapshot.hasError){
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        
        if(!snapshot.hasData || snapshot.data!.isEmpty){
          return const Center(child: Text('belum ada data pegawai'));
        }

        final data = snapshot.data!;
        final keys = data.keys.toList();

        return ListView.builder(itemCount: keys.length,itemBuilder: (context, index){
          final key = keys[index];
          final employee = data[key]!;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(employee['name']??""),
              subtitle: Text(employee['position']??""),
              trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.red,),
              onPressed: (){
                _service.removeEmployee(key);
              }
              )
            ),
          );
          }

        });
      }),
    );
  }
}