import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controller.dart';
import '../../constants/style.dart';
import '../../helpers/responsiveness.dart';
import 'bagWidget.dart';

class BiteBagPage extends StatelessWidget {
  const BiteBagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 50,
        // ),
        Obx(() => Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 40,
                  ),
                  child: Text(
                    menuController.activeItem.value,
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: active),
                  ),
                ),
              ],
            )),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 30),
        //       child: Container(
        //         height: 50,
        //         width: 250,
        //         decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius:
        //             BorderRadius.circular(20),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: deepOrange.withOpacity(0.2),
        //                 blurRadius: 4,
        //
        //                 offset: Offset(0, 4), // changes position of shadow
        //               ),
        //             ]
        //         ),
        //         child: ListTile(
        //           //SEARCH BAR
        //           trailing: Icon(Icons.search_outlined,
        //             color: active,
        //           ),
        //           title: TextField(
        //             //SEARCH BAR TYPO
        //             textInputAction:
        //             TextInputAction.search,
        //             decoration: InputDecoration(
        //
        //               hintStyle: TextStyle(
        //                 fontFamily:
        //                 "Nunito",
        //                 fontWeight: FontWeight.w200,
        //                 // fontStyle: FontStyle.normal,
        //                 color: deepOrange,
        //                 fontSize: 15,
        //               ),
        //               hintText: "Search",
        //               border: InputBorder.none,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        Expanded(
          child: ListView(
            children: [
              BiteBagTable(),
            ],
          ),
        ),
      ],
    );
  }
}
