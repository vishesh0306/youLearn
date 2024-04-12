import 'package:bandhu/widgets/particularJournal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyJournal extends StatefulWidget {
  MyJournal({Key? key}) : super(key: key);


  @override
  State<MyJournal> createState() => _MyJournalState();
}

class _MyJournalState extends State<MyJournal> {
  int select = 0;


    @override
    Widget build(BuildContext context) {
      return Scaffold(

        body: MediaQuery(
          data: MediaQueryData().copyWith(textScaler: TextScaler.linear(1)),

          child: Padding(
            padding: EdgeInsets.all(5.0),

            child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/trophy.svg',  // Path to your SVG file
                            width: 200,  // Adjust width as needed
                            height: 100, // Adjust height as needed
                          ),

                          Text("Journal"),
                        ],
                      )),
                      Container(child: Text("Completions")),
                    ],
                  ),

                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      var _overlaycontroller = OverlayPortalController();
                      return GestureDetector(
                        onTap: () {
                          _overlaycontroller.toggle();
                          print("lol");
                        },
                        child: OverlayPortal(
                          controller: _overlaycontroller,
                          overlayChildBuilder: (BuildContext context) {
                            return Stack(
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      _overlaycontroller.toggle();
                                    },
                                    child: AnimatedNotice(),
                                  ),
                                ),
                              ],
                            );
                          },
                          child: buildJournal(),
                        ),
                      );
                    },
                  ),
                ]
            ),
          ),
        ),
      );
    }
  }


class AnimatedNotice extends StatefulWidget {
  @override
  _AnimatedNoticeState createState() => _AnimatedNoticeState();
}

class _AnimatedNoticeState extends State<AnimatedNotice>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100), // Set your desired duration
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(_controller);

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: Transform.translate(
        offset: Offset(0, 25),
        child: Container(
          height: 625.h,
          width: 368.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFDFAF0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 20, 14, 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 173.h,
                        width: 340.w,
                        decoration: BoxDecoration(
                            color: Color(0xffABABAB),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ),
                    SizedBox(
                        width: 316.w,
                        child: Text(
                          'School Is Going For Vacation In Next Month',
                          textScaler: TextScaler.linear(1),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 25.sp),
                        ))
                  ],
                ),
                Text('22 March 2020',style: TextStyle(color: Colors.black.withOpacity(0.2)),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


