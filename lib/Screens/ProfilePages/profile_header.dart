import 'package:flutter/material.dart';

class Profile_Header extends StatelessWidget {
  const Profile_Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () {
                  //
                },
                icon: Icon(Icons.notifications_none_outlined),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  //
                },
                icon: Icon(Icons.menu),
              ),
            ),
          ],
        ),
        Container(
          width: 100,
          height: 100,
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
          ),
          child: const Padding(
            padding: EdgeInsets.all(3.0),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/boy1.png')),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Text(
            'Satya Don',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Text(
            '@Satya_Don',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Entrepreneur  ',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Container(
                height: 7,
                width: 7,
                decoration:
                    BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              ),
              Text(
                '  244',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey),
              ),
              Text(
                ' connections',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              //
            },
            child: Container(
              height: 32,
              width: 105,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5)
              ]),
              child: Center(
                child: Text(
                  "  Edit Profie  ",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
