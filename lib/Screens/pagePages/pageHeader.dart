import 'package:flutter/material.dart';

class Page_Header extends StatelessWidget {
  final bool isUserProfile; /* shall be removed on addition of sharedPref. */

  const Page_Header({
    Key? key,
    required this.isUserProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          child: Container(
            height: 310,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.2))),
            ),
            child: Column(
              children: [
                Expanded(
                  // flex: 2,
                  child: Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                            onTap: () {
                              print("tapped");
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                        image: AssetImage("assets/back1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 7, bottom: 4.0),
                    child: Text(
                      'Economic Resources',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(11),
                    child: Container(
                      height: 80,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Urna, vitae eu, non volutpat ultrices pretium quam tincidunt dictum. Sed gravida ipsum sapien in risus mattis.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 11, right: 11, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 28,
                          child: Stack(
                            children: const [
                              Positioned(
                                left: 30,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 11,
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 11,
                                    backgroundColor: Colors.blue,
                                  ),
                                ),
                              ),
                              Positioned(
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 11,
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "45K",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            //  edit or follow functions
                          },
                          child: Container(
                            height: 32,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5)
                                ]),
                            child: Center(
                              child: Text(
                                isUserProfile ? "Follow" : "Edit",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.02),
                        SizedBox(width: size.width * 0.02),
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.black.withOpacity(0.6),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
