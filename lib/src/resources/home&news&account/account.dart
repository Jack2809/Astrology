import 'package:flutter/material.dart';
import 'package:astrology/src/resources/edit_account/edit_account.dart';


class AccountPage extends StatefulWidget{

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _imageLink = 'https://scontent.fsgn2-4.fna.fbcdn.net/v/t31.18172-8/16423117_671178093084590_8683797133784660545_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=_oOW4y6GZ0sAX8pL2BX&tn=8dDZ6yBmARp1i9Mt&_nc_ht=scontent.fsgn2-4.fna&oh=00_AT_HiU2oIuAwvz28e-oZiTwWp3I_VP-g32NHc9R8yrYY3Q&oe=622799C2';
  String _name ='Hiếu Nguyễn';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0,20.0,15.0,20.0),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/background2.png'),
              fit: BoxFit.fill,
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Container(
                child:Row(
                  children: <Widget>[
                    Text(
                      'Hồ sơ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(backgroundColor: Colors.white,radius: 15,),
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(0,20.0,0,20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: size.height * 0.16,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(_imageLink),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom:0,
                          right: 0,
                          child: CircleAvatar(
                            child: Icon(Icons.male),
                            radius: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),



                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Hiếu Nguyễn',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccountPage()),);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            margin:EdgeInsets.all(10.0),
                            height: size.height * 0.06,
                            width: size.width * 0.35,
                            decoration:BoxDecoration(
                             borderRadius:BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.white70),
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.edit,color: Colors.white,size:15,),
                                SizedBox(width: 5.0,),
                                Text(
                                  'Chỉnh sửa hồ sơ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height:size.height * 0.12,
              padding: EdgeInsets.fromLTRB(15.0,0, 15.0,0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color.fromRGBO(129, 102, 134, 1.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: size.height * 0.06,
                    width: size.width * 0.1,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage('assets/account/purse.png'),
                        fit: BoxFit.fill,
                      )
                    ),
                  ),
                  Text(
                    'Lịch sử thanh toán',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,color: Colors.white70,size: 15.0,),

                ],
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(0.0,20.0,0,10.0),
              child: Text(
                'Người đang theo dõi',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Follower(imageLink: _imageLink, name: _name),
            Follower(imageLink: _imageLink, name: _name),
            Follower(imageLink: _imageLink, name: _name),
            Follower(imageLink: _imageLink, name: _name),

          ],
        ),
      ),
    );

  }
}

class Follower extends StatelessWidget{
  String imageLink ;
  String name ;

  Follower({required this.imageLink,required this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      margin: EdgeInsets.fromLTRB(0,5,0,5),
      padding: EdgeInsets.fromLTRB(15.0,0,15.0,0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(70, 31,72, 1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(imageLink),
            radius: 20.0,
          ),
          SizedBox(width:20.0,),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Container(
            height:size.height * 0.05,

            decoration: BoxDecoration(
              color: Color.fromRGBO(255,74,183,1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: OutlinedButton(
              onPressed: (){},
              child: Text(
                'following',
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}