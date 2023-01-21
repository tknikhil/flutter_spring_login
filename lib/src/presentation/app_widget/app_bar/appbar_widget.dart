import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.cdate,
  }) : super(key: key);

  final String cdate;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xfffd4af37),
      leading: Builder(builder: (context) =>
          IconButton(
              icon: Icon(Icons.menu),
              color: Colors.brown,
              onPressed: () => Scaffold.of(context).openDrawer()
          ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //menu
            Container(
              padding: EdgeInsets.all(12),

            ),
            //Hi Nikhil
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi Nikhil",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    cdate,
                    style: const TextStyle(
                        color: Color(0xffffbf1de),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.yellow,
                    maxRadius: 25.0,
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.brown,
                      size: 50,
                    ),
                  )
                ],
              ),
            ])
          ],
        ),
      ],);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}