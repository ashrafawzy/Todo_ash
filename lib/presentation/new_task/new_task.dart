import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/todo_bloc.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../database/db_helper.dart';

import '../list_mode/alltaskspage.dart';
import '../shared/bloc/cubit.dart';
import '../shared/bloc/states.dart';



class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
  final dbHelper = DBHelper();
}

class _NewTaskPageState extends State<NewTaskPage> {
  String? _selectedDate;
  String? _selectedTime;
  String? _selectedImage;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late GlobalKey<FormState> _formKey;

  var _nameController = TextEditingController();
  var _descController = TextEditingController();


  List<String> _images = [
    ImageConstant.shoping,
    ImageConstant.basket,
    ImageConstant.parking,
    ImageConstant.berthday,
    ImageConstant.gym,
    ImageConstant.dote,
  ];

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _selectedDate = 'Today';
    _selectedTime = '9:00 AM';
  }
  void add() {
    // TODO: implement initState
    super.initState();
    TodoBloc.get(context).add(AddDataEvent(name: '', desc: '', date: '', time: '', imagePath: ''));
  }
  @override
  Widget build(BuildContext context) {

        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              'New Task',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: Text('Icons'),
                  ),

                  SizedBox(
                    height: 70.0,
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 8.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedImage = _images[index];
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 5),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 55.0,
                                  child: Image(image: AssetImage(_images[index])),
                                ),
                                if (_selectedImage == _images[index])
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Icon(Icons.add_circle, color: Colors.black, size: 16.0),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 10),
                    child: Text('Name'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 0),
                    child: TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16, bottom: 8),
                    child: Text('Description'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      16.0,
                    ),
                    child: TextFormField(
                      maxLines: 4,
                      controller: _descController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Date'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: DropdownButtonFormField<String>(
                      value: _selectedDate,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a date';
                        }
                        return null;
                      },
                      decoration: InputDecoration(),
                      items: <String>['Today', 'Tomorrow', 'Next week']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedDate = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Time'),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 5, bottom: 10, left: 16, right: 16),
                    child: DropdownButtonFormField<String>(
                      value: _selectedTime,
                      validator: (value) {
                    if (value == null || value.isEmpty) {
                    return 'Please select a time';
                    }
                    return null;
                    },
                      decoration: InputDecoration(),
                      items: <String>[
                        '9:00 AM',
                        '10:00 AM',
                        '11:00 AM',
                        '12:00 PM',
                        '1:00 PM',
                        '2:00 PM',
                        '3:00 PM',
                        '4:00 PM'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedTime = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      height: 60,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: ColorConstant.gradient,
                      ),

                      child: ElevatedButton(
                        onPressed: () {
    context.read<TodoBloc>().add(
    AddDataEvent(

    name: _nameController.text,
                           desc: _descController.text, date:_selectedTime='', time: _selectedTime='', imagePath:_selectedImage= '' ,

    )
                            // await DBHelper.insert('todo', data);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     content: Text('New task added successfully'),
                            //   ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => AllTasksPage()),
                            );
                          },

                        child: Text('Add', style: TextStyle(fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

  }
}