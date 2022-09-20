// ignore_for_file: prefer_const_constructors

import 'package:admin_bite/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../utils/global.dart';

class ViewReview extends StatefulWidget {
  String docId;
  ViewReview({Key? key, required this.docId}) : super(key: key);

  @override
  State<ViewReview> createState() => _ViewReviewState();
}

class _ViewReviewState extends State<ViewReview> {
  final List<String> _banner = [
    'Customer Name',
    'Average ratting',
    'Reveiw Time ',
    'Food items you collected ?',
    'Customer Service of Bite Hub store? ',
    'Overall experience with Bite Hub?',
    'Review',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        // table header
        Container(
          color: Global.deepOrange,
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  _banner.length,
                  (index) => Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Global.deepOrange),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(Constants.kPadding * 2),
                        child: Text(
                          _banner[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
                //
                ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('restaurants')
              .doc(widget.docId)
              .collection('review_ratting')
              .get(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              var status = <Review>[];
              var data = snapshot.data!.docs;
              for (var element in data) {
                status.add(Review.fromMap(element.data()));
              }
              print('data list ============> $data');

              if (status.isNotEmpty) {
                return Card(
                    color: Colors.white,
                    elevation: 3,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.80,
                        padding: const EdgeInsets.only(left: 20, right: 40),
                        child: ListView.builder(
                            itemCount: status.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(status[index].userName)),
                                    Expanded(
                                        child: Text(status[index]
                                            .avgRatings
                                            .toString())),
                                    Expanded(
                                        child: Text(status[index]
                                            .dateTime
                                            .toString()
                                            .substring(0, 16))),
                                    Expanded(
                                        child: Text(status[index]
                                            .ratingValue1
                                            .toString())),
                                    Expanded(
                                        child: Text(status[index]
                                            .ratingValue2
                                            .toString())),
                                    Expanded(
                                        child: Text(status[index]
                                            .ratingValue3
                                            .toString())),
                                    Expanded(
                                        child: Text(status[index].reviews)),
                                  ],
                                ),
                              );
                            })));
              } else {
                return Center(
                  child: Text(
                    'NO RECORD FOUND',
                    style: TextStyle(fontSize: 24),
                  ),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }
}
