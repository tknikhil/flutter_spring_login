import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({
    Key? key,required this.name,required this.profession
  }) : super(key: key);

  final String name,profession;

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white70,
        child: Icon(CupertinoIcons.person,color: Colors.brown,),
      ),
      title: Text(widget.name,style: const TextStyle(color: Colors.brown,fontSize: 20,fontWeight:FontWeight.bold),),
      subtitle: Text(widget.profession,style: const TextStyle(color: Colors.brown,fontSize: 15),),
    );
  }
}