import 'package:astrology/src/repository/current_user_shared_preferences.dart';
import 'package:astrology/src/resources/edit_account/profile_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:astrology/src/resources/edit_account/edit_account.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../repository/google_sign_in.dart';


class AccountPage extends StatefulWidget{

  List<Profile> profileList;
  AccountPage({required this.profileList});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _imageLink = CurrentUser.getAvatarLink() ?? '';
  String _name = CurrentUser.getCurrentUserName() ?? '';
  bool gender = CurrentUser.getGender() ?? true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: size.height,
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
                    GestureDetector(onTap: (){
                        final provider = Provider.of<GoogleSignInProvider>(
                        context, listen: false);
                        provider.logout();
                    },
                        child: CircleAvatar(backgroundColor: Colors.white,radius: 15,)),
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
                            child: Icon(!gender?Icons.male:Icons.female),
                            backgroundColor: !gender?Color.fromRGBO(25,88,255,0.8):Color.fromRGBO(255,74,183,0.8),
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
                          _name,
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

    ListView.separated(
      shrinkWrap: true,
    padding: const EdgeInsets.all(8),
    itemCount: widget.profileList.length,
    itemBuilder: (BuildContext context, int index) {
    if(index != 0){
      return Follower(imageLink: widget.profileList[index].profilePhoto, name:widget.profileList[index].name,item:widget.profileList[index],);
    }else{
      return SizedBox();
    }
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    ),


          ],
        ),
      ),
    );

  }
}

class Follower extends StatelessWidget{
  String imageLink ;
  String name ;
  Profile item;

  Follower({required this.imageLink,required this.name,required this.item});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector (
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(item:item)),);
      },
      child: Container(
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
            )
          ],
        ),
      ),
    );
  }

}