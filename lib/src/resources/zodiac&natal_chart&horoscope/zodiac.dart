import 'package:flutter/material.dart';

import 'zodiac_detail.dart';

class ZodiacPage extends StatefulWidget{
  @override
  State<ZodiacPage> createState() => _ZodiacPageState();
}

class _ZodiacPageState extends State<ZodiacPage> {
  List<Zodiac> _list =[
    Zodiac(imageLink: 'assets/zodiac/1.Aries.png', name: 'Aries', startTime: '3/21', endTime:'4/19'),
    Zodiac(imageLink: 'assets/zodiac/2.Taurus.png', name: 'Taurus', startTime: '4/20', endTime:'5/20'),
    Zodiac(imageLink: 'assets/zodiac/3.Gemini.png', name: 'Gemini', startTime: '5/21', endTime:'6/20'),
    Zodiac(imageLink: 'assets/zodiac/4.Cancer.png', name: 'Cancer', startTime: '6/21', endTime:'7/22'),
    Zodiac(imageLink: 'assets/zodiac/5.Leo.png', name: 'Leo', startTime: '7/23', endTime:'8/22'),
    Zodiac(imageLink: 'assets/zodiac/6.Virgo.png', name: 'Virgo', startTime: '8/23', endTime:'9/22'),
    Zodiac(imageLink: 'assets/zodiac/7.Libra.png', name: 'Libra', startTime: '9/23', endTime:'10/22'),
    Zodiac(imageLink: 'assets/zodiac/8.Scorpio.png', name: 'Scorpio', startTime: '10/23', endTime:'11/21'),
    Zodiac(imageLink: 'assets/zodiac/9.Sagittarius.png', name: 'Sagittarius', startTime: '11/22', endTime:'12/21'),
    Zodiac(imageLink: 'assets/zodiac/10.Capricorn.png', name: 'Capricorn', startTime: '12/22', endTime:'1/19'),
    Zodiac(imageLink: 'assets/zodiac/11.Aquarius.png', name: 'Aquarius', startTime: '1/20', endTime:'2/18'),
    Zodiac(imageLink: 'assets/zodiac/12.Pisces.png', name: 'Pisces', startTime: '2/19', endTime:'3/20'),
  ];
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
          'Cung hoàng đạo',
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
              image: AssetImage('assets/background/background1.png'),
              fit: BoxFit.fill,
            )
        ),
        child:  GridView.builder(
          scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // mainAxisSpacing:10.0,
              // crossAxisSpacing:5.0,
              childAspectRatio: 0.9,
            ),
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HoroscopeDetail(item: _list[index],)),);
                },
                  child: ZodiacItem(item:_list[index],)
              );
            }
        ),
      ),
    );
  }
}

class ZodiacItem extends StatelessWidget{
  Zodiac item;
  ZodiacItem({required this.item});



  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;


    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height:size.height * 0.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.imageLink),
              )
            ),
          ),
          Text(
            item.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize:20.0,
            ),
          ),
          Text(
            item.startTime+ ' - '+item.endTime,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

}

class Zodiac{
  String imageLink;
  String name;
  String startTime;
  String endTime;

  Zodiac({required this.imageLink,required this.name,required this.startTime,required this.endTime});

}



