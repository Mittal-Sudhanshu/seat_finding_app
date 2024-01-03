import 'package:curv/models/seatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//To create seats for the cabin widget
class SeatWidget extends StatefulWidget {
  SeatWidget({
    Key? key,
    required this.seatIndex,
    required this.seatType,
    this.searchBarText,
  }) : super(key: ValueKey(seatIndex));

  final int seatIndex;
  final String seatType;

  final String? searchBarText;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget>
    with AutomaticKeepAliveClientMixin<SeatWidget> {
  @override
  bool get wantKeepAlive => true;
  Seat seat = Seat();

  @override
  void initState() {
    super.initState();
    seat = Seat(seatIndex: widget.seatIndex, seatType: widget.seatType);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // Color color = Colors.blue.shade200;
    bool isSelect = false;
    if (widget.searchBarText == (widget.seatIndex).toString()) {
      setState(() {
        isSelect = !isSelect;
      });
    }
    return Container(
      height: 60.h,
      width: seat.seatType == "Side Upper" || seat.seatType == "Side Lower"
          ? 90.w
          : 60.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: (widget.searchBarText == widget.seatIndex.toString())
                  ? Colors.blue.withOpacity(0.5)
                  : Colors.transparent,
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          border: Border.all(
            color: const Color(0xff126DCA),
            width: 2,
          ),
          // ignore: dead_code
          color: isSelect ? Colors.blue : Colors.blue.shade200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          seat.seatType == "Side Upper" ||
                  seat.seatIndex! % 8 == 4 ||
                  seat.seatIndex! % 8 == 5 ||
                  seat.seatIndex! % 8 == 6 ||
                  seat.seatIndex! % 8 == 0
              ? _buildSeatTypeText(context, seat)
              : _buildSeatIndexText(context, seat),
          const SizedBox(height: 4),
          seat.seatType == "Side Upper" ||
                  seat.seatIndex! % 8 == 4 ||
                  seat.seatIndex! % 8 == 5 ||
                  seat.seatIndex! % 8 == 6 ||
                  seat.seatIndex! % 8 == 0
              ? _buildSeatIndexText(context, seat)
              : _buildSeatTypeText(context, seat),
        ],
      ),
    );
  }
}

Widget _buildSeatIndexText(BuildContext context, Seat seat) {
  return Text(
    seat.seatIndex.toString(),
    style: TextStyle(
      fontSize: 16.sp,
      overflow: TextOverflow.ellipsis,
      color: Colors.black54,
      fontWeight: FontWeight.bold,
    ),
  );
}

//Returns the text widget to display seat number
Widget _buildSeatTypeText(BuildContext context, Seat seat) {
  return Text(
    seat.seatType.toString(),
    style: TextStyle(
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      letterSpacing: 1,
      color: Colors.black54,
      fontWeight: FontWeight.bold,
    ),
  );
}
