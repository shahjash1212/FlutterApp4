import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  TotalCart createState() => TotalCart();
}

class TotalCart extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: const LeadingText(),
        actions: const [
          ActionTag(),
        ],
      ),
      body: Column(
        children: [
          OrdersWidget(),
        ],
      ),
    );
  }
}

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({
    Key? key,
  }) : super(key: key);

  @override
  CounterScreen createState() => CounterScreen();
}

class CounterScreen extends State<OrdersWidget> {
  int _subtotal = 0;
  int _shipping = 0;
  int _bagtotal = 0;

  void hello() {
    print("hello");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              "Orders",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.red,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Item();
                },
              ),
            ),
          ),
          Container(
            //   // color: Colors.yellow,
            padding: EdgeInsets.only(top: 20),
            // color: Colors.red,
            child: Container(
              width: 340,
              margin: EdgeInsets.only(left: 25),
              // color: Colors.pink,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Subtotal",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$${_subtotal}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Shipping",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      FlatButton(
                          onPressed: () {
                            hello();
                          },
                          child: Icon(Icons.radio_button_on)),
                      Text(
                        "\$${_shipping}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Bag Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$${_bagtotal}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: 300,
            margin: EdgeInsets.only(left: 45, top: 8, bottom: 8),
            child: const Center(
              child: Text(
                "CHECKOUT",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class Item extends StatefulWidget {
  Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int _counter = 0;

  int _subtotal = 0;
  int _shipping = 0;
  int _bagtotal = 0;

  void _shippingRemove() {
    setState(() {
      _shipping = 15;
    });
    if (_counter > 1 && _counter != 0) {
      _shipping = 0;
    }
  }

  void _subTotalCountAdd() {
    setState(() {
      _subtotal += 130;
    });
  }

  void _subTotalCountRemove() {
    if (_subtotal < 1) {
      return;
    }
    setState(() {
      _subtotal -= 130;
    });
  }

  void _bagTotalCountAdd() {
    setState(() {
      _bagtotal = _shipping + _subtotal;
    });
  }

  void _bagTotalCountRemove() {
    if (_subtotal < 1) {
      _bagtotal = 0;
    }
    if (_bagtotal < 1) {
      return;
    }

    setState(() {
      _bagtotal = _bagtotal - 130;
    });
  }

  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCount() {
    if (_counter < 1) {
      return;
    }
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // color: Colors.red,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 10),
            child: Container(
              height: 115,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                image: const DecorationImage(
                    image: ExactAssetImage("assets/11.png"),
                    fit: BoxFit.contain),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-2, 5),
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
                // color: Colors.yellow,
              ),
            ),
          ),
          Container(
            height: 115,
            width: 230,
            // color: Colors.pink,
            padding: EdgeInsets.only(top: 0, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Jordan Sports",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Size:40",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$130.00",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
                    ),
                    Container(
                      height: 25,
                      margin: EdgeInsets.only(right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _decrementCount();
                              _subTotalCountRemove();
                              _bagTotalCountRemove();
                            },
                            child: const Icon(
                              Icons.indeterminate_check_box,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${_counter}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {
                              _incrementCount();
                              _subTotalCountAdd();
                              _bagTotalCountAdd();
                              _shippingRemove();
                            },
                            child: const Icon(
                              Icons.add_box,
                              color: Colors.blue,
                              size: 25,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ActionTag extends StatelessWidget {
  const ActionTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0xfff4f8fb)),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.shopping_bag,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class LeadingText extends StatelessWidget {
  const LeadingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xfff4f8fb)),
          child: BackButton(color: Colors.black)),
    );
  }
}
