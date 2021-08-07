

import 'package:elha2ny/Model/UserModel.dart';
import 'package:elha2ny/Screens/ChatScreen/ChatScreen.dart';
import 'package:elha2ny/Screens/GoogleMap/google.dart';
import 'package:elha2ny/Screens/rating/User/Urating.dart';
import 'package:elha2ny/components/WholeAppCubit/AppCubit.dart';
import 'package:elha2ny/components/WholeAppCubit/AppStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ChatDetailes.dart';


class CommunicationScreen extends StatelessWidget
{

  final UserModel reciver ;

  const CommunicationScreen(this.reciver) ;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ElhaanyCubit,ELhaanyStates>
      (listener:(context,state){},
       builder: (context,state){
        //var reciever = ElhaanyCubit.get(context).receiver ;
        int flag = 0 ;
        return Scaffold(
          backgroundColor: Colors.white,
         appBar:AppBar(
           title:Text('Communication',style: TextStyle(color: Colors.black,fontSize: 22),),
           leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.pink,),
             onPressed: () {   Navigator.pop(context) ; },),

         ) ,





          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary:Colors.pink,
                    padding: EdgeInsets.fromLTRB(85, 15, 85, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                  ),

                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatsScreen(reciver)));


                  },





                  child: Text("Chat Customer"),
                ) ,

                SizedBox(
                  height: 40.0,
                ),

                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary:Colors.pink,
                    padding: EdgeInsets.fromLTRB(85, 15, 85, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                  ),

                  onPressed: () {

                    //.push(context, MaterialPageRoute(builder: (context) =>  ChatsScreen() ));
                    Clipboard.setData(ClipboardData(text: reciver.phone)) ;

                  },

                  child: Text(" Call Customer"),
                ) ,

                SizedBox(
                  height: 40.0,
                ),

                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary:Colors.pink,
                    padding: EdgeInsets.fromLTRB(85, 15, 85, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                  ),

                  onPressed: () async{

                    await  MapUtils.openMap(reciver.latitude, reciver.longitude) ;

                  },

                  child: Text("Get location"),
                ) ,

                SizedBox(
                  height: 40.0,
                ),

                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary:Colors.pink,
                    padding: EdgeInsets.fromLTRB(85, 15, 85, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                  ),

                  onPressed: () async{

                   Navigator.push(context, MaterialPageRoute(builder: (context)=> UserRating(reciver)));

                  },

                  child: Text("Rate Customer"),
                ) ,







              ],



            ),
          ),




        );
       },







    );

  }






}