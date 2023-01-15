import 'package:flutter/material.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:24),
          child: Divider(
            color: Colors.brown,
            height: 15,
          ),
        ),
        ListTile(
          leading: SizedBox(
            height: 30,
            width: 30,
            child:Icon(Icons.home,color: Colors.brown,),
          ),
          title: Text("Home",style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.bold),),
          onTap: (){},
        ),
        ListTile(
          leading: SizedBox(
            height: 30,
            width: 30,
            child:Icon(Icons.settings,color: Colors.brown,),
          ),
          title: Text("Setting",style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.bold),),
          onTap: (){},
        ),
        ListTile(
          leading: SizedBox(
            height: 30,
            width: 30,
            child:Icon(Icons.contacts,color: Colors.brown,),
          ),
          title: Text("Contact Us",style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.bold),),
          onTap: (){},
        ),
      ],
    );
  }
}