import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../models/style.dart';

/// Example without datasource
class PaymentTable extends StatefulWidget {
  const PaymentTable({Key? key}) : super(key: key);

  @override
  State<PaymentTable> createState() => _PaymentTableState();
}

class _PaymentTableState extends State<PaymentTable>
    with SingleTickerProviderStateMixin {
  String dropdownvalue = 'Flat Discount';

  late String valueChoose;
  var items = ['Flat Discount', 'Percentage Discount'];

  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 600,
              // width: 550,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'User Payment Method',
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black45),
                      ),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Container(
                                        width: 500,
                                        // height: 400,

                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                Row(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 40),
                                                      child: Text(
                                                        'Amount',
                                                        style: TextStyle(
                                                          fontFamily: "Nunito",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          // fontStyle: FontStyle.normal,
                                                          color: deepOrange,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  // height: 45,
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: deepOrange
                                                              .withOpacity(0.3),
                                                          blurRadius: 8,

                                                          offset: const Offset(
                                                              0,
                                                              4), // changes position of shadow
                                                        ),
                                                      ]),
                                                  child: const ListTile(
                                                    //SEARCH BAR
                                                    title: TextField(
                                                      //SEARCH BAR TYPO

                                                      textInputAction:
                                                          TextInputAction
                                                              .search,
                                                      decoration:
                                                          InputDecoration(
                                                        hintStyle: TextStyle(
                                                          fontFamily: "Nunito",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          // fontStyle: FontStyle.normal,
                                                          color: deepOrange,
                                                          fontSize: 15,
                                                        ),
                                                        hintText: "Amount",
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                    //FILTER ICON

                                                    // Padding(
                                                    //   padding: EdgeInsets.only(
                                                    //       left: 30, top: 5, bottom: 5),
                                                    //   child: IconButton(
                                                    //     icon: Icon(
                                                    //       MyIcons.filter_icon,
                                                    //       color: deepOrange,
                                                    //     ),
                                                    //     iconSize: 15,
                                                    //     onPressed: () {
                                                    //       showDialog(
                                                    //           context: context,
                                                    //           builder: (context) =>
                                                    //               AlertDialog(
                                                    //                 shape: RoundedRectangleBorder(
                                                    //                     borderRadius:
                                                    //                     BorderRadius
                                                    //                         .circular(
                                                    //                         30)),
                                                    //                 title: Center(
                                                    //                   child: Text(
                                                    //                     'Select Your Type',
                                                    //                     style: TextStyle(
                                                    //                         fontFamily:
                                                    //                         "Nunito",
                                                    //                         fontSize: 14,
                                                    //                         color: Colors
                                                    //                             .black54,
                                                    //                         fontWeight:
                                                    //                         FontWeight
                                                    //                             .w900),
                                                    //                   ),
                                                    //                 ),
                                                    //                 content: Filter(),
                                                    //               ));
                                                    //     },
                                                    //   ),
                                                    // ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 40),
                                                      child: Text(
                                                        'Payment Method',
                                                        style: TextStyle(
                                                          fontFamily: "Nunito",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          // fontStyle: FontStyle.normal,
                                                          color: deepOrange,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  // height: 45,
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: deepOrange
                                                              .withOpacity(0.3),
                                                          blurRadius: 8,

                                                          offset: const Offset(
                                                              0,
                                                              4), // changes position of shadow
                                                        ),
                                                      ]),
                                                  child: const ListTile(
                                                    //SEARCH BAR
                                                    title: TextField(
                                                      //SEARCH BAR TYPO

                                                      textInputAction:
                                                          TextInputAction
                                                              .search,
                                                      decoration:
                                                          InputDecoration(
                                                        hintStyle: TextStyle(
                                                          fontFamily: "Nunito",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          // fontStyle: FontStyle.normal,
                                                          color: deepOrange,
                                                          fontSize: 15,
                                                        ),
                                                        hintText: "Cash",
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                    //FILTER ICON

                                                    // Padding(
                                                    //   padding: EdgeInsets.only(
                                                    //       left: 30, top: 5, bottom: 5),
                                                    //   child: IconButton(
                                                    //     icon: Icon(
                                                    //       MyIcons.filter_icon,
                                                    //       color: deepOrange,
                                                    //     ),
                                                    //     iconSize: 15,
                                                    //     onPressed: () {
                                                    //       showDialog(
                                                    //           context: context,
                                                    //           builder: (context) =>
                                                    //               AlertDialog(
                                                    //                 shape: RoundedRectangleBorder(
                                                    //                     borderRadius:
                                                    //                     BorderRadius
                                                    //                         .circular(
                                                    //                         30)),
                                                    //                 title: Center(
                                                    //                   child: Text(
                                                    //                     'Select Your Type',
                                                    //                     style: TextStyle(
                                                    //                         fontFamily:
                                                    //                         "Nunito",
                                                    //                         fontSize: 14,
                                                    //                         color: Colors
                                                    //                             .black54,
                                                    //                         fontWeight:
                                                    //                         FontWeight
                                                    //                             .w900),
                                                    //                   ),
                                                    //                 ),
                                                    //                 content: Filter(),
                                                    //               ));
                                                    //     },
                                                    //   ),
                                                    // ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 40),
                                                      child: Text(
                                                        'Date',
                                                        style: TextStyle(
                                                          fontFamily: "Nunito",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          // fontStyle: FontStyle.normal,
                                                          color: deepOrange,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  // height: 45,
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: deepOrange
                                                              .withOpacity(0.3),
                                                          blurRadius: 8,

                                                          offset: const Offset(
                                                              0,
                                                              4), // changes position of shadow
                                                        ),
                                                      ]),
                                                  child: const ListTile(
                                                    //SEARCH BAR
                                                    title: TextField(
                                                      //SEARCH BAR TYPO
                                                      textInputAction:
                                                          TextInputAction
                                                              .search,
                                                      decoration:
                                                          InputDecoration(
                                                        hintStyle: TextStyle(
                                                          fontFamily: "Nunito",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          // fontStyle: FontStyle.normal,
                                                          color: deepOrange,
                                                          fontSize: 15,
                                                        ),
                                                        hintText: "dd-mm-yy",
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                    //FILTER ICON

                                                    // Padding(
                                                    //   padding: EdgeInsets.only(
                                                    //       left: 30, top: 5, bottom: 5),
                                                    //   child: IconButton(
                                                    //     icon: Icon(
                                                    //       MyIcons.filter_icon,
                                                    //       color: deepOrange,
                                                    //     ),
                                                    //     iconSize: 15,
                                                    //     onPressed: () {
                                                    //       showDialog(
                                                    //           context: context,
                                                    //           builder: (context) =>
                                                    //               AlertDialog(
                                                    //                 shape: RoundedRectangleBorder(
                                                    //                     borderRadius:
                                                    //                     BorderRadius
                                                    //                         .circular(
                                                    //                         30)),
                                                    //                 title: Center(
                                                    //                   child: Text(
                                                    //                     'Select Your Type',
                                                    //                     style: TextStyle(
                                                    //                         fontFamily:
                                                    //                         "Nunito",
                                                    //                         fontSize: 14,
                                                    //                         color: Colors
                                                    //                             .black54,
                                                    //                         fontWeight:
                                                    //                         FontWeight
                                                    //                             .w900),
                                                    //                   ),
                                                    //                 ),
                                                    //                 content: Filter(),
                                                    //               ));
                                                    //     },
                                                    //   ),
                                                    // ),
                                                  ),
                                                ),

                                                // Row(
                                                //   mainAxisAlignment: MainAxisAlignment.center,
                                                //   children: [
                                                //     Container(
                                                //       height: 60,
                                                //       width: 230,
                                                //       decoration: BoxDecoration(
                                                //           color: Colors.white,
                                                //           boxShadow: [
                                                //             BoxShadow(color: active.withOpacity(0.2))
                                                //           ],
                                                //           borderRadius: BorderRadius.circular(20),
                                                //           border: Border.all(color: active)
                                                //       ),
                                                //       child: Padding(
                                                //         padding: const EdgeInsets.all(8.0),
                                                //         child: DropdownButton(
                                                //           underline:Container(
                                                //             color: Colors.transparent,
                                                //           ),
                                                //           borderRadius: BorderRadius.circular(20),
                                                //           elevation: 0,
                                                //           dropdownColor: active,
                                                //
                                                //           value: dropdownvalue,
                                                //           icon: const Icon(
                                                //             Icons.arrow_drop_down_circle_outlined,
                                                //             color: Colors.black45,
                                                //           ),
                                                //           onChanged: (String? newValue){
                                                //             setState(() {
                                                //               dropdownvalue = newValue!;
                                                //             }
                                                //             );
                                                //           },
                                                //           items: items.map((String items) {
                                                //             return DropdownMenuItem(
                                                //               onTap: (){
                                                //                 items;
                                                //               },
                                                //               alignment: Alignment.center,
                                                //               value: items,
                                                //               child: Text(items,
                                                //                 style: TextStyle(
                                                //                     color: active
                                                //                 ),
                                                //               ),
                                                //             );
                                                //           }).toList(),
                                                //         ),
                                                //       ),
                                                //     )
                                                //   ],
                                                // ),

                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 50,
                                                        width: 150,
                                                        child: ElevatedButton(
                                                            onPressed: () {},
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        active,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                    )),
                                                            child: const Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                'SAVE',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: active,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Add Payment Method',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Divider(
                    color: deepOrange.withOpacity(0.9),
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
