import 'package:astrology/src/models/planet_model.dart';
import 'package:astrology/src/repository/planet_.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'planet_detail.dart';

class PlanetPage extends StatefulWidget{

  @override
  State<PlanetPage> createState() => _PlanetPageState();
}

class _PlanetPageState extends State<PlanetPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,size:15.0,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor:Colors.transparent,
        bottomOpacity: 0.0,
        title: Text(
          'Các Hành Tinh',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/background2.png'),
              fit: BoxFit.fill,
            )
        ),
        child: FutureBuilder<List<PlanetModel>>(
          future: fetchGeneralPlanetData(http.Client()),
          builder: (context,snapshot){
            if(snapshot.hasError){
              return Center(child: Text('Something went wrong!!'),);
            }else if (snapshot.hasData){
              return PlanetList(planetModels: snapshot.data!);
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}

class PlanetList extends StatelessWidget{
  const PlanetList({Key? key,required this.planetModels}) : super(key:key);

  final List<PlanetModel> planetModels;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // mainAxisSpacing:10.0,
          // crossAxisSpacing:5.0,
          childAspectRatio: 0.9,
        ),
        itemCount: planetModels.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlanetDetail(id: planetModels[index].id,)),);
              },
              child: PlanetItem(item:planetModels[index],)
          );
        }
    );
  }

}

class PlanetItem extends StatelessWidget{
  PlanetModel item;
  PlanetItem({required this.item});



  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;


    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height:size.height * 0.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.icon),
                )
            ),
          ),
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
              fontSize:20.0,
            ),
          ),

        ],
      ),
    );
  }

}