// import 'package:chatUI/widgets/catergory_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// import '../widgets/favorite_contacts.dart';
import '../widgets/recent_chats.dart';
import 'package:chatUI/screens/Contact_Screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  var chatIconColor ;
  var groupIconColor ;
  var profileIconCOlor ;




  final List<Widget> screens =
  [
    RecentChats(),
    Contact(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(); // default
    switch (_currentIndex) {
      case 0:
        var chatIconColor = Colors.blue;
        var groupIconColor = Colors.grey.shade600;
        var profileIconCOlor = Colors.grey.shade600;
        widget=screens[0];
        break;
     case 1:

       widget= AlertDialog(
         title: const Text('Coming Soon'),
         content: SingleChildScrollView(
             child: ListBody(
               children: const <Widget>[
                 Text('Group section will be available soon'),
               ],
             ),
           ),
         actions: <Widget>[
           TextButton(
             child: const Text('OK'),
             onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => HomeScreen()),
               );
             },
           ),
         ],
       );
       var chatIconColor = Colors.grey.shade600;
       var groupIconColor = Colors.blue;
       var profileIconCOlor = Colors.grey.shade600;

       break;

       case 2:
         var chatIconColor = Colors.grey.shade600;
         var groupIconColor = Colors.grey.shade600;
         var profileIconCOlor = Colors.blue;
         break;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
          onPressed: () {},
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding:
                    EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue[50],
                    ),
                    child: SizedBox(
                        width: 100,
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child:FloatingActionButton.extended(
                            backgroundColor: Colors.blue[50],
                            icon: Icon(Icons.add,color: Colors.black,),
                            label: Text("add new",style: TextStyle(color: Colors.black),),
                            onPressed: ()
                            {
                              //Move to Contact Widget
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Contact()),
                              );
                            },
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 15),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade600,
                size: 20,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.shade100)),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            child: Column(
              children: <Widget>[
               widget,
              ],
            ),
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) => setState(() => _currentIndex = index),
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message,color:chatIconColor ,),
            title: Text("Chats",style: TextStyle(color: chatIconColor),),




          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work,color: groupIconColor,),
            title: Text("Groups",style: TextStyle(color: groupIconColor),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,color: profileIconCOlor,),
            title: Text("Profile",style: TextStyle(color: profileIconCOlor),),
          ),
        ],
      ),
    );
  }
}
