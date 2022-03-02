import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: const UserLeading(),
        actions: const [
          UserAction(),
        ],
      ),
      body: Column(
        children: [
          ProfilePic(),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xfff4f8fb),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.person),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          "My Account",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xfff4f8fb),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.notifications),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          "Notification",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xfff4f8fb),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          "Settings",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xfff4f8fb),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.help_outline),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          "Help Center",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xfff4f8fb),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          "Log Out",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/user.png"),
          ),
          Positioned(
            right: -14,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white)),
                color: Colors.grey[400],
                onPressed: () {},
                child: Icon(
                  Icons.photo_camera,
                  size: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserAction extends StatelessWidget {
  const UserAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class UserLeading extends StatelessWidget {
  const UserLeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
          child: BackButton(color: Colors.black)),
    );
  }
}
