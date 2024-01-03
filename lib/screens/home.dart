import 'package:curv/widgets/cabinWidget.dart';
import 'package:curv/widgets/searchWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  int prevRow = 0;
  void scrollToSeat(int seatNumber) {
    // Calculate the row and index of the seat
    int row = (seatNumber - 1) ~/ 4;
    print(row);
    int index = (seatNumber - 1) % 4;

    // Scroll to the position
    if (row > 7) {
      prevRow = 7;
      _scrollController.animateTo(
        row * MediaQuery.of(context).size.height,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    } else if (prevRow > row) {
      _scrollController.animateTo(
        0,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Seat Finder'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Material(
                // height: 50.h,
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.r),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7.w,
                      child: SearchWidget(
                          controller: searchController,
                          onPressed: searchController.text.isEmpty
                              ? () {}
                              : () {
                                  scrollToSeat(
                                      int.parse(searchController.text));
                                }),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        onPressed: searchController.text.isEmpty
                            ? () {}
                            : () {
                                scrollToSeat(int.parse(searchController.text));
                              },
                        child: Text('Search')),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return Builder(
                      builder: (context) => CabinWidget(
                        index: index,
                        searchBarText: searchController.text,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
