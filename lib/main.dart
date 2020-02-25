import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}

class _MyAppState extends State<MyApp> {
  TextEditingController _acontroller = TextEditingController();
  TextEditingController _bcontroller = TextEditingController();
  TextEditingController _ccontroller = TextEditingController();
  TextEditingController _dcontroller = TextEditingController();
  int a, b, c, d,e,f,g=0,h=0;
  
  Item selectedUser;
  List<Item> users = <Item>[
    const Item('Addition',Icon(Icons.add),),
    const Item('Subtraction',Icon(Icons.remove)),
    const Item('Multiplication',Icon(Icons.clear)),
    const Item('Division',Icon(Icons.games)),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fraction Calculator',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Container(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, 80, 0, 40),
                child:Image.asset(
                  "assets/logo3.png",
                  scale: 3,
                ),
              ),
              

              Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                child:
                  Text("Please Select Calculation after Insert Fraction :D",
                        style: TextStyle(fontSize:17),
                  ),
              ),
              
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                  children: <Widget>[
                    
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(5),
                            child: TextField(
                            controller: _acontroller,
                            style: TextStyle(fontSize:20),
                            decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.lightGreen[200],
                            ),
                            keyboardType: TextInputType.numberWithOptions(),
                            ),
                          ),
                          
                          Divider(
                            indent: 5.0,
                            endIndent: 5.0,
                            color: Colors.black,
                          ),

                          Padding(padding: EdgeInsets.all(5),
                            child: TextField(
                              controller: _bcontroller,
                              style: TextStyle(fontSize:20),
                              decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.lightGreen[200],
                              ),
                              keyboardType: TextInputType.numberWithOptions(),
                            ),
                          ),
                            
                        ],
                      ),
                    ),
                    
                    Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        DropdownButton<Item>(
                          hint: Text("Calculation",
                          style: TextStyle(fontSize:18),
                          
                        ),
                        value: selectedUser,
                        onChanged: (Item value) {
                        setState(() {
                        selectedUser = value;
                        a = int.parse(_acontroller.text);
                        b = int.parse(_bcontroller.text);
                        c = int.parse(_ccontroller.text);
                        d = int.parse(_dcontroller.text);
                        
                        if(value.name == 'Addition'){
                          e = (a*d)+(b*c);
                          f = b*d; 
                        }
                  
                        if(value.name == 'Subtraction'){
                          e = (a*d)-(b*c);
                          f = b*d;
                        }

                        if(value.name == 'Multiplication'){
                          e = a*c;
                          f = b*d;
                        }

                        if(value.name == 'Division'){
                          e = a*d;
                          f = b*c;
                        }

                        else{
                             if(value.name == 'Addition'){
                                g = (a*d)+(b*c);
                                h = b*d; 
                            }
                            if(value.name == 'Subtraction'){
                                g = (a*d)-(b*c);
                                h = b*d;
                            }
                            if(value.name == 'Multiplication'){
                                g = a*c;
                                h = b*d;
                            }
                            if(value.name == 'Division'){
                                g = a*d;
                                h = b*c;
                            }
                          }
                          
                        for(int i=2;i<=10000;i++){
                          if(e%i==0 && f%i==0){
                            g = (e/i).round();
                            h = (f/i).round();
                          }
                          
                        }
                      }
                    );
                  },

                  items: users.map((Item user) {
                    return  DropdownMenuItem<Item>(
                      value: user,
                      child: Row(
                        children: <Widget>[
                          user.icon,
                          SizedBox(width:2,),
                          Text(
                          user.name,
                          style:  TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  ),
                      ],
                    ),
                    ),

                  Flexible(
                    flex: 3,
                    child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(5),
                        child:TextField(
                        controller: _ccontroller,
                        style: TextStyle(fontSize:20),
                        decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.lightBlue[200],
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                        ), 
                      ),
                      
                      Divider(
                        indent: 5.0,
                        endIndent: 5.0,
                        color: Colors.black,
                      ),

                      Padding(padding: EdgeInsets.all(5),
                        child:TextField(
                          controller: _dcontroller,
                          style: TextStyle(fontSize:20),
                          decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.lightBlue[200],
                          ),
                          keyboardType: TextInputType.numberWithOptions(),
                        ), 
                      ),
                    ],
                  ),
                  ),

                  ],
                ),
              ),
              
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                  Flexible(child: Column(
                    
                    children: <Widget>[
                      
                        Padding(padding: EdgeInsets.fromLTRB(160, 0, 150, 0),
                          child: Text("$g",
                            style: TextStyle(fontSize:30),
                          ),
                        ),
                        
                        Text("= ────",
                          style: TextStyle(fontSize:25),
                        ),

                        Padding(padding: EdgeInsets.fromLTRB(160, 0, 150, 0),
                          child: Text("$h",
                            style: TextStyle(fontSize:30),
                          ),
                        ),

                      RaisedButton(
                        color: Colors.yellow[200],
                        onPressed: _clear,
                      child:Text("Clear",
                        style: TextStyle(fontSize:20),
                        ),
                      ),

                    ],
                  ),
                ),
                ],
                ),
              ),


            ],
          ),
            ),
        )
      ),
    );
  }
                
  void _clear() {
    setState(() {
      _acontroller.text = "";
      _bcontroller.text = "";
      _ccontroller.text = "";
      _dcontroller.text = "";
      e=0;
      f=0;
      g=0;
      h=0;
    });
  }
}