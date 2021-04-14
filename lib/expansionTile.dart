import 'package:flutter/material.dart';
class Expansiontile extends StatefulWidget {



  @override
  State<StatefulWidget> createState() => _ExapansionTileState();

}
class _ExapansionTileState extends State<Expansiontile> {

  DateTime selectedDate = DateTime.now();

  String _chosenValue;



  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1935),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'My Profile'
        ),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.save), onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child:
            Column(
              children:<Widget>[

            SizedBox(height: 20.0),
            ExpansionTile(
              title: Text(
                "Personal Details",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.phone),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Phone",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.email),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.home),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Address",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.cake),
                  title: new TextField(
                    decoration: new InputDecoration(
                        hintText: "Birthday",
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),

                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ExpansionTile(
              title: Text(
                "Additional Details",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person),
                  title: new DropdownButton<String>(
                    focusColor:Colors.white,
                    value: _chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor:Colors.black,
                    items: <String>[
                      'Mr',
                      'Ms',
                      'Miss',
                      'Mrs',
                      'Dr'

                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style:TextStyle(color:Colors.black),),
                      );
                    }).toList(),
                    hint:Text(
                      "Title",

                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.phone),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Secondary Phone",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.email),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Secondary Email",
                    ),
                  ),
                ),

              ],
            ),
                SizedBox(height: 20.0),
                ExpansionTile(
                  title: Text(
                    "Other Details",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  children: <Widget>[
                    new ListTile(
                      leading: const Icon(Icons.attach_money),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Salary",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.group),
                      title: new DropdownButton<String>(
                        focusColor:Colors.white,
                        value: _chosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor:Colors.black,
                        items: <String>[
                          'Single',
                          'Married',
                          'Parents',
                          'Grand Parents',
                          'Adult',

                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style:TextStyle(color:Colors.black),),
                          );
                        }).toList(),
                        hint:Text(
                          "Family Type",

                        ),
                        onChanged: (String value) {
                          setState(() {
                            _chosenValue = value;
                          });
                        },
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.email),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Secondary Email",
                        ),
                      ),
                    ),

                  ],
                ),



          ],
            )
        ),
      ),
    );
  }
}