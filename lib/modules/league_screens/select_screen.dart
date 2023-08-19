import 'package:flutter/material.dart';
import 'package:football/modules/league_screens/league_screen.dart';
import 'package:football/shared/components.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectLeague extends StatelessWidget {
  const SelectLeague({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          primary: false,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount:2,
          children: [
            leagueButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return League(leagueId: 39,season: 2022,color: HexColor("#570861"),);
              }
              )
              );
              },
                assetName: "assets/images/leauge_logo/PremierLeague.png"),
            leagueButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return League(leagueId: 140,season: 2022,color: Colors.blueAccent,);
              }
              )
              );
            },
                assetName: "assets/images/leauge_logo/LaLiga.png"),
            leagueButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return League(leagueId: 135,season: 2022,color: HexColor("#08457e"),);
              }
              )
              );
            },
                assetName:"assets/images/leauge_logo/SERIE_A.jpg"),
            leagueButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return League(leagueId: 61,season: 2022,color: HexColor("#00008B"),);
              }
              )
              );
            },
                assetName: "assets/images/leauge_logo/Ligue_1.jpg"),
            leagueButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return League(leagueId: 78,season: 2022,color: HexColor("#D30000"),);
              }
              )
              );
            },
                assetName:  "assets/images/leauge_logo/Bundesliga.png"),
            leagueButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return League(leagueId: 94,season: 2022,color: HexColor("#660000"),);
              }
              )
              );
            },
                assetName: "assets/images/leauge_logo/portugal.png"),

          ],
        ),
      ),
    );

  }
}
