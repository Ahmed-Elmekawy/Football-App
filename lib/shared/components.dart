import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget leagueButton({
  required void Function()? onPressed,
  required String assetName
}
    ){
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
    ),
    child: MaterialButton(
      onPressed:onPressed,
      child: Image(image: AssetImage(assetName)
      ),
    ),
  );
}

fixtures(context,{
  required List fixtures,
}){
  if(fixtures==[]){
    return null;
    }
  else{
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder:(context, index){
          return Stack(
            alignment: Alignment .topLeft,
            children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  child: Column(
                    children: [
                      Text(fixtures[index]["league"]["round"],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      status(fixtures[index]["fixture"]["status"]["long"]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Image(
                                image: NetworkImage(
                                    fixtures[index]["teams"]["home"]["logo"])),
                          ),
                          const SizedBox(width: 10,),
                          Text(fixtures[index]["teams"]["home"]["name"],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(fixtures[index]["teams"]["away"]["name"],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                          const SizedBox(width: 10,),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Image(
                                image: NetworkImage(
                                    fixtures[index]["teams"]["away"]["logo"])),
                          ),
                        ],
                      ),
                      result(fixtures[index]["goals"]["home"],
                          fixtures[index]["goals"]["away"]),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${fixtures[index]["fixture"]["date"]}".replaceRange(0, 11, "").replaceRange(5, 14, ""),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor:Colors.grey.withOpacity(0.2),
              child: Image(image:
              NetworkImage(fixtures[index]["league"]["logo"])
              ),
            ),
          ],

          );
      },
      itemCount: fixtures.length,
    );
  }
}

Widget rankingItem(
    txt2,txt3,txt4,txt5,txt6,txt7,txt8,txt9,
    {txt1,teamName,int? rank,teamImage}
    ){
  if(rank!=null && teamName!=null&&teamImage!=null){
    return Row(
      children: [
          Text("$rank",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400
            ),
        ),
        spaceItem(rank),
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Image(
            image: NetworkImage(
              teamImage
            ),
          ),
        ),
        const SizedBox(width: 15,),
        Text(teamName),
        const Expanded(child: SizedBox()),
        Row(
          children: [
            Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Text("$txt2")
            ),
            Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Text("$txt3")
            ),
            Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Text("$txt4")
            ),
            Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Text("$txt5")
            ),
            Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Text("$txt6")
            ),
            Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Text("$txt7")
            ),
            Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Text("$txt8")
            ),
            Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Text("$txt9")
            ),
          ],
        ),
      ],
    );}
  else {
    return Row(
      children: [
        Text(txt1,
          style: const TextStyle(
          fontSize: 18
        ),
        ),
        const Expanded(child: SizedBox()),
        Row(
            children:[
              Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(txt2)
              ),
              Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(txt3)
              ),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Text(txt4),
              ),
              Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(txt5)
              ),
              Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(txt6)
              ),
              Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(txt7)
              ),
              Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(txt8)),
              Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(txt9)),
            ]
        ),
      ],
    );
  }
}

Widget topScorer(String name, {
  required List<dynamic>list,
  required String type1,
  required String type2,
    }
    ){
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Text("Player",
              style: TextStyle(
                fontSize: 18,
              ),),
              const Expanded(child: SizedBox()),
              Text(name,
              style: const TextStyle(
                fontSize: 18,
              ),),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 10,left: 10),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text("${index + 1}.",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                          )),
                      SizedBox(width: 16,),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Image(image: NetworkImage(
                            list[index]["player"]["photo"]
                        ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(list[index]["player"]["name"],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                              ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 10,),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: Image(
                                    image: NetworkImage(
                                        list[index]["statistics"][0]["team"]["logo"]
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  list[index]["statistics"][0]["team"]["name"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey
                                  ),),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Expanded(child: SizedBox(width: 150,)),
                      Text("${list[index]["statistics"][0][type1][type2]}",
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600
                        ),)
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: Divider(),
            ),
            itemCount: list.length
        )
      ],
    ),
  );
}

Widget match({
  required String state,
  required String homeLogo,
  required String awayLogo,
  required homeGoal,
  required awayGoal,
  required String roundName,
  required String date
}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
    child: Column(
      children: [
        round(roundName),
        const SizedBox(height: 10,),
        status(state),
        const SizedBox(height: 10,),
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Image(
                  image: NetworkImage(homeLogo)
              ),
            ),
            const Expanded(child: SizedBox()),
            result(homeGoal, awayGoal),
            const Expanded(child: SizedBox()),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Image(
                  image: NetworkImage(awayLogo)
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Text(date.replaceRange(16, 25, "").replaceRange(10, 11, " "),
          style: const TextStyle(
              color: Colors.grey
          ),
        ),
      ],
    ),
  );
}

Widget status(String state){
  if (state=="Match Finished"){
    return Container(
      width: 100,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      child: const Text("Ended",
        style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
      ),
    );
  }
  else if (state=="Not Started"){
    return Container(
      width: 100,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      child: const Text("Not started",
        style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.blue,
        ),
      ),
    );
  }
  else{
    return Container(
      width: 100,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      child: const Text("In Play",
        style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.red,
        ),
      ),
    );
  }
}

Widget result(homeGoal,awayGoal){
  if(homeGoal==null&&awayGoal==null) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("-",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
        ),
        SizedBox(width: 35,),
        Text("_",
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey
            )
        ),
        SizedBox(width: 35,),
        Text("-",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
        ),
      ],
    );
  }
    else{
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$homeGoal",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            )
        ),
        const SizedBox(width: 35,),
        const Text("_",
            style:TextStyle(
                fontSize: 18,
                color: Colors.grey
            )
        ),
        const SizedBox(width:35,),
        Text("$awayGoal",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            )
        ),
      ],
    );
  }
 }

 round(String roundName){
  int num;
  for(num=1;num<=40;num++){
    if(roundName=="Regular Season - $num"){
      return Text("Round $num",
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.grey
        ),
      );
    }
  }
}
Widget spaceItem(int rank){
  if(rank>9){
    return const SizedBox(width: 8,);
  }
  else{
    return const SizedBox(width: 15,);
  }
}

