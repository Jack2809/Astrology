import 'package:flutter/material.dart';

class NatalChartPage extends StatelessWidget{

  String _imageLink = 'https://scontent.fsgn2-4.fna.fbcdn.net/v/t31.18172-8/16423117_671178093084590_8683797133784660545_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=_oOW4y6GZ0sAX8pL2BX&tn=8dDZ6yBmARp1i9Mt&_nc_ht=scontent.fsgn2-4.fna&oh=00_AT_HiU2oIuAwvz28e-oZiTwWp3I_VP-g32NHc9R8yrYY3Q&oe=622799C2';
  List<Information> _list = [
    Information(icon: Icons.cake, title:'Ngày Sinh', content:'2000-09-28'),
    Information(icon: Icons.watch_later, title:'Giờ Sinh ', content:'12:52:52'),
    Information(icon: Icons.circle, title:'Vĩ Độ', content:'66°33\' 39'),
    Information(icon: Icons.radar, title:'Kinh Độ', content:'23°26\' 21'),
  ];

  List<ZodiacInformation> _list1 = [
    ZodiacInformation(name: 'CUNG MỌC', image:'assets/home/Libra.png', zodiac:'Thiên Bình'),
    ZodiacInformation(name: 'CUNG MẶT TRỜI', image:'assets/home/Libra.png', zodiac:'Thiên Bình'),
    ZodiacInformation(name: 'CUNG MẶT TRĂNG', image:'assets/home/Libra.png', zodiac:'Thiên Bình'),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,size:15.0,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor:Colors.transparent,
        bottomOpacity: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/background1.png'),
              fit: BoxFit.fill,
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SafeArea(
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(116,55,245,1)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: size.height * 0.13,
                          width: size.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            image:DecorationImage(
                              image: NetworkImage(_imageLink),
                            )
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          child: Icon(Icons.male),
                          radius: size.height * 0.015,
                          backgroundColor: Color.fromRGBO(25,88,255,0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:size.height * 0.02),
              Text(
                'Hiếu Nguyễn',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height:size.height * 0.02),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InformationColumn(item: _list[0]),
                    InformationColumn(item: _list[1]),
                    InformationColumn(item: _list[2]),
                    InformationColumn(item: _list[3]),
                  ],
                ),
              ),
              SizedBox(height:size.height * 0.02),
              // Text(
              //   'Bản đồ sao',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 25.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(height:size.height * 0.01),
              Container(
                width: double.infinity,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/home/natal_chart1.png'),
                    fit: BoxFit.fitWidth
                  )
                ),
              ),

             Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   ZodiacColumn(item: _list1[0]),
                   ZodiacColumn(item: _list1[1]),
                   ZodiacColumn(item: _list1[2]),
                 ],
               ),
             ),
              SizedBox(height: size.height*0.03),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Ngôi sao',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Nhà',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Cung',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Góc',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Divider(
                color: Colors.white70,
              ),

              Star(),



            ],
          ),
        ),
      ),

    );
  }

}

class ZodiacInformation {
  String name;
  String image;
  String zodiac;

  ZodiacInformation({required this.name,required this.image,required this.zodiac});

}

class ZodiacColumn extends StatelessWidget{
  ZodiacInformation item;
  ZodiacColumn({required this.item});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10.0),
      height: size.height * 0.15,
      width: size.width * 0.3,
      decoration: BoxDecoration(
        color: Color.fromRGBO(69,46,93,1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          Text(
            item.name,
            style: TextStyle(
              color: Colors.white70,
              // fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          RotationTransition(
            turns: AlwaysStoppedAnimation(60/360),
            child: ImageIcon(
              AssetImage('assets/home/Libra.png'),
              color: Colors.white,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            item.zodiac,
            style: TextStyle(
              color: Colors.white70,
              // fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

}

class Information {
  IconData icon;
  String title;
  String content;

  Information({required this.icon,required this.title,required this.content});

}

class InformationColumn extends StatefulWidget{
  Information item;

  InformationColumn({required this.item});

  @override
  State<InformationColumn> createState() => _InformationColumnState();
}

class _InformationColumnState extends State<InformationColumn> {
  
  LinearGradient getColor(){
    LinearGradient _color;
    if(widget.item.title.toLowerCase()=='ngày sinh'){
      _color = LinearGradient(
        colors: [
          Colors.white70,
          Color.fromRGBO(85,43,242,1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.0,
          0.9
        ]
      );
    }else if(widget.item.title.toLowerCase()=='giờ sinh'){
      _color = LinearGradient(
          colors: [
            Colors.white70,
            Color.fromRGBO(172,29,255,1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.0,
            0.9
          ]
      );
    }else if(widget.item.title.toLowerCase()=='vĩ độ'){
      _color = LinearGradient(
          colors: [
            Colors.white70,
            Color.fromRGBO(18,79,255,1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.0,
            0.9
          ]
      );
    }else{
      _color = LinearGradient(
          colors: [
            Colors.white70,
            Color.fromRGBO(221,47,188,1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.0,
            0.9
          ]
      );
    }
    return _color;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.05,
          width: size.width * 0.1,
          decoration: BoxDecoration(
            gradient: getColor(),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Icon(
            widget.item.icon,
             color: Colors.white,
          ),
        ),
        SizedBox(height:size.height * 0.01),
        Text(
          widget.item.title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 15.0,
          ),
        ),
        SizedBox(height:size.height * 0.01),
        Text(
          widget.item.content,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),

      ],
    );
  }
}

class Star extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
          child: Column(
          children: <Widget>[
            Icon(
              Icons.star,
              color: Color.fromRGBO(183,88,167,1),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              'Mặt trời',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 25.0,
              ),
            ),
        ],
      ),
      ),
            Container(
              height: size.height * 0.05,
              width: size.width * 0.1,
              decoration: BoxDecoration(
                color: Color.fromRGBO(69,47,94,1),
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.white70),
              ),
              child: Center(
                child: Text(
                  'I',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),

            Container(
              child: Column(
                children: <Widget>[
                  ImageIcon(
                    AssetImage('assets/home/Libra.png'),
                    color: Color.fromRGBO(183,88,167,1),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    'Thiên Bình',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Text(
                '66°33\'39\"',
                style: TextStyle(
                  color: Colors.white,
                  fontSize:25.0,
                ),
              ),
            ),
        ],
      ),
      ),

          Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              color: Color.fromRGBO(46,36,76,1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Text(
                'Đây là phần content của cái này =))',
            style: TextStyle(
              color: Colors.white,
            )),
          ),

        ],
      ),
    );
  }

}