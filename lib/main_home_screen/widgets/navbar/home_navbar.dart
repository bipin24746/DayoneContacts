import 'package:flutter/material.dart';

class CommonHomeNavBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonHomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(top: 18.0,bottom: 10),
      child: AppBar(
        backgroundColor: Colors.white,
        title: Container(

        child: Row(
          children: [
            Icon(
              Icons.home,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Column(
                children: [
                  Text(
                    "Cityplex Colony",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Block A, Flat 101",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Icon(Icons.arrow_downward),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_none_outlined),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/Photu.jpg'),
                    fit: BoxFit.fill),
              ),
            )
          ],
        ),
                )


      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
