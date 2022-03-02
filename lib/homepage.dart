import 'package:flutter/material.dart';

import 'detailscreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drower(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        actions: const [
          Search(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TopText(),
          BelowText(),
          Discount(),
          TopCategories(),
          BottomGrid(),
        ],
      ),
      bottomNavigationBar: NavBarBottom(),
    );
  }
}

class NavBarBottom extends StatelessWidget {
  const NavBarBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border_rounded,
            color: Colors.black,
          ),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag,
            color: Colors.black,
          ),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          label: 'User',
        ),
      ],
    );
  }
}

class Drower extends StatelessWidget {
  const Drower({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text("Jash"),
            accountEmail: Text("shahjash1212@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("assets/image.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Friends"),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}

class BottomGrid extends StatelessWidget {
  const BottomGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      color: Colors.white,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          childAspectRatio: .7,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailScreen())),
              child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.lightBlue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 20,
                              padding: EdgeInsets.all(2),
                              child: const Center(
                                child: Text(
                                  "30% OFF",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blue),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 135,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ExactAssetImage("assets/1.png"),
                                fit: BoxFit.fitWidth)),
                      ),
                      const Text(
                        "  Nike Shoes",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              "\$120 ",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "\$160",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}

class TopCategories extends StatelessWidget {
  const TopCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Top Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 85,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: ExactAssetImage("assets/3.png"),
                          fit: BoxFit.fitWidth),
                      color: Colors.grey[200],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Discount extends StatelessWidget {
  const Discount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 200,
      color: Colors.white,
      child: Stack(
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    height: 20,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "50% OFF DURING \nCOVID 19",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                child: const Center(
                                  child: Text(
                                    "Get Now",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  image: ExactAssetImage("assets/2.png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BelowText extends StatelessWidget {
  const BelowText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: const Text(
        "buy shoes from here",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
      ),
    );
  }
}

class TopText extends StatelessWidget {
  const TopText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: const Text(
        "Hello Mukter ",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      ),
    );
  }
}