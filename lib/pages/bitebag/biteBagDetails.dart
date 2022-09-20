import 'package:admin_bite/constants/controller.dart';
import 'package:admin_bite/constants/style.dart';
import 'package:admin_bite/helpers/responsiveness.dart';
import 'package:admin_bite/models/style.dart';
import 'package:admin_bite/utils/responsive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Status {
  String name;
  String orderid;
  String date;
  String price;
  String customer;
  Color color;
  Status(
      {required this.name,
      required this.color,
      required this.orderid,
      required this.date,
      required this.price,
      required this.customer});
}

class BiteBagDetailsPage extends StatefulWidget {
  const BiteBagDetailsPage({Key? key, this.productModel, this.restModel})
      : super(key: key);

  final DocumentSnapshot? productModel;
  final DocumentSnapshot? restModel;
  @override
  State<BiteBagDetailsPage> createState() => _BiteBagDetailsPageState();
}

class _BiteBagDetailsPageState extends State<BiteBagDetailsPage> {
  final List<Status> _status = [
    Status(
        name: "Pending",
        color: const Color(0xfff8b250),
        orderid: "#5552351",
        date: "26 March 2020, 12:42 AM",
        customer: "James WItcwicky",
        price: "\$164.52"),
    Status(
        name: "Delivered",
        color: const Color(0xff13d38e),
        orderid: "#5552323",
        date: "26 March 2020, 12:42 AM",
        customer: "Veronica",
        price: "\$74.92"),
    Status(
        name: "Cancelled",
        color: Colors.grey,
        orderid: "#5552375",
        date: "26 March 2020, 02:12 AM",
        customer: "Emilia Johanson",
        price: "\$251.16"),
    Status(
        name: "Pending",
        color: const Color(0xfff8b250),
        orderid: "#5552311",
        date: "26 March 2020, 12:42 AM",
        customer: "Olivia Shine",
        price: "\$82.46"),
    Status(
        name: "Delivered",
        color: const Color(0xff13d38e),
        orderid: "#5552388",
        date: "26 March 2020, 12:42 AM",
        customer: "Jessica Wong",
        price: "\$24.17"),
    Status(
        name: "Pending",
        color: const Color(0xfff8b250),
        orderid: "#5552322",
        date: "26 March 2020, 01:42 PM",
        customer: "David Horison",
        price: "\$24.55"),
    Status(
        name: "Cancelled",
        color: Colors.grey,
        orderid: "#5552322",
        date: "26 March 2020, 01:42 PM",
        customer: "Samantha Bake",
        price: "\$22.18"),
    Status(
        name: "Cancelled",
        color: Colors.grey,
        orderid: "#5552397",
        date: "26 March 2020, 01:42 PM",
        customer: "Franky Sihotang",
        price: "\$45.86"),
    Status(
        name: "Delivered",
        color: const Color(0xff13d38e),
        orderid: "#5552349",
        date: "26 March 2020, 01:42 PM",
        customer: "Roberto Carlo",
        price: "\$34.41"),
    Status(
        name: "Delivered",
        color: const Color(0xff13d38e),
        orderid: "#5552356",
        date: "26 March 2020, 01:42 PM",
        customer: "Rendy Greenlee",
        price: "\$44.99"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 40,
                  ),
                  child: Text(
                    menuController.activeItem.value,
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: active),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: customThemeColor),
                      child: const Center(
                        child: Text(
                          'Back',
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: ResponsiveWidget.isSmallScreen(context) ? 56 : 40,
              ),
              child: Text(
                "Bite Bag Details",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: active),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 500,
                        height: 550,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(color: active.withOpacity(.4), width: .5),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 6),
                                color: active.withOpacity(.1),
                                blurRadius: 12)
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Bite Bag',
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: active),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      child: Image.asset(
                                        'assets/bag.png',
                                        height: 250,
                                        width: 250,
                                        // cacheColorFilter: false,
                                        // color: Colors.transparent,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text(
                                    '${widget.productModel!.get('name')}',
                                    style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: active,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                                color: active.withOpacity(0.3))
                                          ]),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '\$${widget.productModel!.get('dis_price')}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: active,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            '0',
                                            style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Category',
                                            style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: List.generate(
                                            widget.productModel!
                                                .get('category')
                                                .length, (i) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              '${widget.productModel!.get('category')[i]}',
                                              style: const TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black38),
                                            ),
                                          );
                                        })),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Chefs Note',
                                            style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.productModel!.get('chef_note')}',
                                          style: const TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black38),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Bag Contains',
                                            style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.circle,
                                              color: deepOrange,
                                              size: 10,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              '${widget.productModel!.get('items')}',
                                              style: const TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black38),
                                            )
                                          ],
                                        )
                                      ]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 500,
                              height: 530,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: active.withOpacity(.4), width: .5),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 6),
                                      color: active.withOpacity(.1),
                                      blurRadius: 12)
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                        'Bite Hub',
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: active),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 150,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Name",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${widget.restModel!.get('name')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Phone No.",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${widget.restModel!.get('phone')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Website",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${widget.restModel!.get('website_address')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Address",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${widget.restModel!.get('address')}",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: active),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )

              // OrderWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
