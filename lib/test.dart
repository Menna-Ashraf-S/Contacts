import 'package:flutter/material.dart';

class Test  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Test > {

  

  @override
  void initState() {
    super.initState();
    
  }   



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
                                width: 120,
                                height: 130 ,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey ,width: 1 ,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(75),
                                    ),
                                    ),
        
                                child: Icon(Icons.account_circle , 
                                color: Colors.blue ,size: 120,),
                                ),
      )
                             

    );
  }
}