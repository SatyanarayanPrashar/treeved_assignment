import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 275,
            floating: false,
            pinned: true,
            title: const Text('Profile'),
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/boy2.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 190,
                      child: Container(
                        width: 80.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          height: 125,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Color.fromARGB(255, 8, 8, 8),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: DecoratedBox(
                                    decoration: ShapeDecoration(
                                      shape: CircleBorder(),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/boy1.png')),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Satya Don',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            '@Satya_Don',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                centerTitle: true),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage('assets/boy1.png'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: const [
                                      Text(
                                        "names[index]",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "usernames[index]",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
                                child: Text(
                                  "tweets[index]",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset("assets/back1.jpg")),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                          width: 18.0,
                                          child: IconButton(
                                            padding: const EdgeInsets.all(0.0),
                                            icon: const Icon(
                                              Icons.chat_bubble_outline,
                                              size: 18.0,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        const SizedBox(
                                            height: 10.0,
                                            width: 18.0,
                                            child: Text(
                                              "replies[index]",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                          width: 18.0,
                                          child: IconButton(
                                            padding: const EdgeInsets.all(0.0),
                                            icon: const Icon(
                                              Icons.replay,
                                              size: 18.0,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        SizedBox(
                                            height: 10.0,
                                            width: 18.0,
                                            child: Text(
                                              "retweets[index]",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                          width: 18.0,
                                          child: IconButton(
                                            padding: EdgeInsets.all(0.0),
                                            icon: Icon(
                                              Icons.favorite_border,
                                              size: 18.0,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        SizedBox(
                                            height: 13.0,
                                            width: 22.0,
                                            child: Text(
                                              "23",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                      width: 10.0,
                                      child: IconButton(
                                        padding: new EdgeInsets.all(0.0),
                                        icon: Icon(
                                          Icons.share,
                                          size: 18.0,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey,
                      height: 0.5,
                    ),
                  )
                ],
              ),
              childCount: 4,
            ),
          )
        ],
      ),
    ));
  }
}
