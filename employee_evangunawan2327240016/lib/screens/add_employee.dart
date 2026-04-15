import 'package:employee_evangunawan2327240016/services/employee_service.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget{
  const AddEmployee({super.key});

  @override

  State<AddEmployee>createState()=>_AddEmployeeState();

  }

  class _AddEmployeeState extends State<AddEmployee>{

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _positionController = TextEditingController();

    final EmployeeService _service = EmployeeService();

    void _saveEmployee(){
      final name = _nameController.text.trim();

      final position = _positionController.text.trim();

      if(name.isEmpty || position.isEmpty){
        ScaffoldMessenger.of(context,).showSnackBar(content: Text('Harus diisi'));
        return;
      }

      _service.addEmployee(name, position);

      Navigator.pop(context);
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: const Text('Tambah Pegawai')),
        body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController, decoration: const InputDecoration(
                labelText: 'Nama Pegawai',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller:  _positionController,
              decoration: const InputDecoration(
                labelText: 'Jabatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _saveEmployee, child: const Text('Save'))
          ],
        )
        )
      );
    }
  }