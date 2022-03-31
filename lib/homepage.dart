import 'package:application1/services/api_manager.dart';
import 'package:application1/userpage.dart';
import 'package:flutter/material.dart';

import 'detailscreen.dart';
import 'models/shoesinfo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drower(),
      appBar: AppBar(
        leading: Container(
          height: 25,
          decoration: BoxDecoration(
              color: const Color(0xfff4f8fb),
              borderRadius: BorderRadius.circular(20)),
          child: Builder(
            builder: (context) => IconButton(
              icon: Container(
                child: const Icon(
                  Icons.menu_rounded,
                  color: Colors.black,
                ),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
          Search(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TopText(),
            BelowText(),
            Discount(),
            TopCategories(),
            BottomGrid(),
          ],
        ),
      ),
      bottomNavigationBar: const NavBarBottom(),
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
      items: [
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home'),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border_rounded,
            color: Colors.black,
          ),
          label: 'Favourite',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag,
            color: Colors.black,
          ),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserPage()),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.black,
            ),
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

class BottomGrid extends StatefulWidget {
  const BottomGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomGrid> createState() => _BottomGridState();
}

class _BottomGridState extends State<BottomGrid> {
  late Future<List<Shoes>> _shoeModel;

  @override
  void initState() {
    super.initState();
    _shoeModel = API_MANAGER().getShoes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Shoes>>(
      future: _shoeModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              childAspectRatio: .7,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(shoeData: snapshot.data![index]))),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xfff4f8fb),
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
                                padding: const EdgeInsets.all(2),
                                child: const Center(
                                  child: Text(
                                    "30% OFF",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
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
                          margin: const EdgeInsets.only(left: 2, right: 2),
                          height: 135,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data![index].imageUrl),
                                fit: BoxFit.contain),
                          ),
                        ),
                        Text(
                          ('${snapshot.data![index].productname}'),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Text(
                                "\$ ${snapshot.data![index].price} ",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "\$160.00",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
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
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 80,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      width: 75,
                      margin: const EdgeInsets.only(
                          left: 1, right: 1, top: 6, bottom: 6),
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
            ),
          ),
        ],
      ),
    );
  }
}

class Discount extends StatefulWidget {
  const Discount({
    Key? key,
  }) : super(key: key);

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  late Future<List<Shoes>> _shoesModel;

  @override
  void initState() {
    super.initState();
    _shoesModel = API_MANAGER().getShoes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 200,
      color: Colors.white,
      child: Stack(
        children: [
          FutureBuilder<List<Shoes>>(
              future: _shoesModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      // var shoes = snapshot.data?.id[index];
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            snapshot.data![index].imageUrl),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
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
      height: 25,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xfff4f8fb)),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(
          Icons.search,
          color: Colors.black,
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


// List<int> function (){}