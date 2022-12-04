import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
Map mydata={};

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

     mydata = (mydata?.isEmpty ?? true )?  ModalRoute.of(context)!.settings.arguments as Map : mydata ;
     final  String? bgImage = (mydata ?['isDayTime'] ?? false) ? 'day.png' : 'night.png';
     final Color? bgColor =  (mydata?['isDayTime'] ?? false) ? Colors.blue : Colors.indigo[700];
    print(mydata);
    return Scaffold(
      backgroundColor:bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/$bgImage')
              )
            ),
            child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                   dynamic result= await Navigator.pushNamed(context, '/location');
                 setState(() {
                   mydata={
                     'time':result['time'],
                     'location':result['location'],
                     'isDayTime': result['isDayTime'] ?? false,
                     'flag':result['flag']

                   };
                 });
                  },
                  icon: Icon(
                      Icons.edit_location
                  ,color: Colors.grey[300],
                  ),
                  label: Text('chose location',style: TextStyle(
                    color: Colors.grey[300]
                  ),)),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    mydata!['location'],
                    style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.white,
                        letterSpacing: 2.0),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                mydata!['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.white

                ),
              )
            ],
        ),
      ),
          )),
    );
  }
}
