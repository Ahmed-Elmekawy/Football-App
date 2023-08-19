import 'package:flutter/material.dart';
import 'package:football/modules/fixtures_screens/todaymatches_screen.dart';
import 'package:football/modules/fixtures_screens/tomorrowmatches_screen.dart';
import 'package:football/modules/fixtures_screens/yesterdaymatches_screen.dart';

class Fixtures extends StatelessWidget {
  const Fixtures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 15,
                child: Image(image: AssetImage(
                    "images/kora.png"
                )
                ),
              ),
              SizedBox(width: 5,),
              Text(
                "HAT",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Anton",
                ),
              ),
              SizedBox(width: 2,),
              Text("TRICK",
                style:TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Anton"
                ) ,)
            ],
          ),
          bottom:const TabBar(
            labelStyle: TextStyle (
              fontSize: 18,
            ),
            labelColor: Colors.green,
            indicatorColor: Colors.black,
            tabs: [
              Text("Yesterday",maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text("Today",maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text("Tomorrow",maxLines: 1,overflow: TextOverflow.ellipsis,)
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            YesterdayMatches(),
            TodayMatches(),
            TomorrowMatches()
          ],
        )
      ),
    );
  }
}
