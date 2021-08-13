import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:pakt/ui/sellerui/profilelevel3.dart';
import 'package:pakt/utils/time_picker.dart';

class ProfileLevel2 extends StatefulWidget {
  const ProfileLevel2({Key? key}) : super(key: key);

  @override
  _ProfileLevel2State createState() => _ProfileLevel2State();
}

class _ProfileLevel2State extends State<ProfileLevel2> {
  String? category;
  var _categorylist = ["Food"];

  List? _myActivities;
   String? _myActivitiesResult;
  TimeOfDay _sundayopentime = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay _mondayopentime = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay _tuesdayopentime = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay _wednesdayopentime = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay _thursdayopentime = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay _fridayopentime = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay _saturdayopentime = TimeOfDay(hour: 9, minute: 00);

  TimeOfDay _sundayclosetime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _mondayclosetime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _tuesdayclosetime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _wednesdayclosetime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _thursdayclosetime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _fridayclosetime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _saturdayclosetime = TimeOfDay(hour: 00, minute: 00);
  final formKey = new GlobalKey<FormState>();
  bool? isFullTime=false;


  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  _saveForm() {
    var form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Complete Your Profile',
          style: TextStyle(fontSize: 16, fontFamily: 'RobotoM'),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Account Information Progress",
            style: TextStyle(
                color: Colors.black, fontFamily: 'RobotoB', fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: MyCustomContainer(
              progress: 0.50,
              size: MediaQuery.of(context).size.width - 30,
              backgroundColor: Colors.grey,
              progressColor: Color(0xffFFCC00),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("2/4 Steps"),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),


              child: FormField<String>(

                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(

                        errorStyle: TextStyle(
                            color: Colors.redAccent, fontSize: 16.0),
                        labelText: 'Category',
                        ),
                    isEmpty: category == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: category,
                        isDense: true,
                        onChanged: (String? val) {
                          setState(() {
                            category = "Food";
                          });
                          
                        },
                        items: _categorylist.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              )


          ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: MultiSelectFormField(

          autovalidate: false,
          chipBackGroundColor: Color(0xff090909),
          chipLabelStyle:  (GoogleFonts.poppins(
            textStyle: TextStyle( color: Colors.white,fontSize: 10))),
          dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
          checkBoxActiveColor: Color(0xffFFCC00),
          checkBoxCheckColor: Colors.white,
          dialogShapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: Text(
            " What are you Selling?",

            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Color(0xffAFAFAF), letterSpacing: .5),
            ),
          ),

          validator: (value) {
            if (value == null || value.length == 0) {
              return Text('Select (Multiple Selection Available)', style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Color(0xffAFAFAF), letterSpacing: .5,fontSize: 10),
              ),).toString();
            }
            return null;
          },
          dataSource: [
            {
              "display": "Indian",
              "value": "Indian",
            },
            {
              "display": "Chinese",
              "value": "Chinese",
            },
            {
              "display": "Arabic",
              "value": "Arabic",
            },
            {
              "display": "Swimming",
              "value": "Swimming",
            },
            {
              "display": "Italian",
              "value": "Italian",
            },
            {
              "display": "Punjabi",
              "value": "Punjabi",
            },
            {
              "display": "Hyderbadi",
              "value": "Hyderbadi",
            },
          ],
          textField: 'display',
          valueField: 'value',
          okButtonLabel: 'OK',

          cancelButtonLabel: 'CANCEL',
          hintWidget: Text('Select (Multiple Selection Available)', style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Color(0xffAFAFAF), letterSpacing: .5,fontSize: 16),
          ),),
          initialValue: _myActivities,
          onSaved: (value) {
            if (value == null) return;
            setState(() {
              _myActivities = value;
            });
          },
        ),
      ),
          SwitchListTile.adaptive(
            title: Text('Store is 24 X 7', textAlign: TextAlign.left,style: TextStyle(fontSize: 18,fontFamily: 'RobotoB',),),
            onChanged: (bool value) {
                setState(() => isFullTime! ?isFullTime=false:isFullTime=true);
                print(isFullTime);},
            value: isFullTime!,
          ),
          SizedBox(height: 20,),
          isFullTime! ?SizedBox():

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Store Working Hour",style: TextStyle(fontFamily: 'RobotoM',fontSize: 17,color: Colors.black),),

                      Text("SUNDAY",style: TextStyle(fontFamily: 'RobotoM',fontSize: 17,color: Colors.black),),
                      Text("MONDAY",style: TextStyle(fontFamily: 'RobotoM',fontSize: 17,color: Colors.black),),
                      Text("TUESDAY",style: TextStyle(fontFamily: 'RobotoM',fontSize: 17,color: Colors.black),),
                      Text("WEDNESDAY",style: TextStyle(fontFamily: 'RobotoM',fontSize: 17,color: Colors.black),),
                      Text("THURSDAY",style: TextStyle(fontFamily: 'RobotoM',fontSize: 17,color: Colors.black),),
                      Text("FRIDAY",style: TextStyle(fontFamily: 'RobotoM',fontSize: 17,color: Colors.black),),
                      Text("SATURDAY",style: TextStyle(fontFamily: 'RobotoM',fontSize: 17,color: Colors.black),),
                    ],
                  ),
                ),
              ),
              Container(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Opening Time",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),)),

                      InkWell(child: Text("${_sundayopentime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _sundayopentime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _sundayopentime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_mondayopentime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _mondayopentime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _mondayopentime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_tuesdayopentime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _tuesdayopentime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _tuesdayopentime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_wednesdayopentime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _wednesdayopentime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _wednesdayclosetime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_thursdayopentime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _thursdayopentime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _thursdayopentime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_fridayopentime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _fridayopentime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _fridayopentime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_saturdayopentime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _saturdayopentime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _saturdayopentime = newTime;
                          });
                        }
                      },),


                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Closing Time",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),)),

                      InkWell(child: Text("${_sundayclosetime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _sundayclosetime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _sundayclosetime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_mondayclosetime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _mondayclosetime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _mondayclosetime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_tuesdayclosetime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _tuesdayclosetime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _tuesdayclosetime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_wednesdayclosetime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _wednesdayclosetime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _wednesdayclosetime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_thursdayclosetime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _thursdayclosetime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _thursdayclosetime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_fridayclosetime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _fridayclosetime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _fridayclosetime = newTime;
                          });
                        }
                      },),
                      InkWell(child: Text("${_saturdayclosetime.format(context)}",style: GoogleFonts.poppins(textStyle:TextStyle(fontSize:15,color:Color(0xff5F5F5F) ),),textAlign: TextAlign.center,),onTap: () async {

                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: _saturdayclosetime,
                        );
                        if (newTime != null) {
                          setState(() {
                            _saturdayclosetime = newTime;
                          });
                        }
                      },),


                    ],
                  ),
                ),
              ),
            ],
          ),




          SizedBox(height: 20,),
          MaterialButton(
              color: Color(0xffFFCC00),
              height: 45,
              minWidth: MediaQuery.of(context).size.width - 30,
              child: Text("Next",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoM',
                      fontSize: 15)),
              onPressed: () {})

        ],
      ),
    );
  }
}
