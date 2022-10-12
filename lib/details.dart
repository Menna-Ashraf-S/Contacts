import 'package:flutter/material.dart';
import 'package:flutter_pro/contact.dart';
import 'package:flutter_pro/dbHelper.dart';

class Details  extends StatefulWidget {
  Contact contact ;
  Details(this.contact);
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Details > {

  late DbHelper helper ;
  TextEditingController teName = TextEditingController();
  TextEditingController teNumber = TextEditingController();
  TextEditingController teURL = TextEditingController();

  

  @override
  void initState() {
    super.initState();
    helper = DbHelper();

    teName.text = widget.contact.name ;
    teNumber.text = widget.contact.number ;
    teURL.text = widget.contact.url ;
  }   



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25 , right: 15 , left: 15),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Contact Details',
                style: TextStyle(
                  color: Colors.blue , fontSize: 30 , fontWeight: FontWeight.bold ,
                ),
                ),
      
                SizedBox(height: 20,),
      
                 Container(
                                      width: 200,
                                      height: 200 ,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey ,width: 1 ,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(100),
                                          ),
                                          ),
                                    
                                      child:
                                      ClipRRect( borderRadius: BorderRadius.circular (100),
                                      child: Image.network('${teURL.text}' ,
                                      fit: BoxFit.cover, width: 120,height: 130 ,),
                                    )
                                       ),
      
                SizedBox(height: 15,) , 
      
                TextField(controller: teName, 
                style: TextStyle(
                  fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.grey[700],
                ),
                ),
      
                SizedBox(height: 5,),
      
                TextField(controller: teNumber,
                style: TextStyle(
                  fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.grey[700],
                ),
                ),
      
                SizedBox(height: 5,),
      
                TextField(controller: teURL,
                style: TextStyle(
                  fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.grey[700],
                ),
                ),
      
                SizedBox(height: 15,),
      
                Padding(
                                   padding: const EdgeInsets.all(20.0),
                                   child: Container(
                                        width: double.infinity,
                                        height: 45,
                                 
                                        child: 
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            )
                                          ),
                                          child: Text('SAVE' ,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold ,color: Colors.white, fontSize: 25 ,
                                          ),
                                          )
                                           ,
                                 
                                          onPressed: (){
                                            showDialog(
                            context: context, 
                            builder: (BuildContext context){
                              return AlertDialog(
                                title:
                                 Text ('Save Contact',style: TextStyle(fontSize: 25)),
                                content:
                                 Text('Are you sure you want to save this contact ?',
                                 style: TextStyle(
                                  fontSize: 20,color: Colors.grey[700],
                                  ),
                                  ),
                                actions: 
                                <Widget>[
                                  TextButton( 
                                    child: 
                                    Text('Cancel',
                                    style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold , color: Colors.grey, 
                                      ),
                                      ), 
                          
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                          
                                  ),
                          
                                  TextButton( 
                                    child: 
                                    Text('Yes',
                                    style: TextStyle(
                                      color: Colors.blue,fontSize: 20, fontWeight: FontWeight.bold ,
                                      ),
                                      ),
                                  onPressed: (){
                                    var updateContact = Contact({
                                      'id' : widget.contact.id ,
                                      'name' : teName.text ,
                                      'number': teNumber.text ,
                                      'url' : teURL.text
                                    },);
                                    helper.update(updateContact);
                                    Navigator.pop(context);
                                    
                                  },
                                  ),
                                ],
                              );
                            }
                            );
                                          },
      
                                           ),
                                       ),
                                 ),
      
                TextButton(
                  child: 
                  Text('DELETE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold ,color: Colors.blue, fontSize: 25 ,
                  ),
                  ),
      
                  onPressed: (){
                     showDialog(
                            context: context, 
                            builder: (BuildContext context){
                              return AlertDialog(
                                title:
                                 Text ('Delete Book',style: TextStyle(fontSize: 25)),
                                content:
                                 Text('Are you sure you want to delete this contact ?',
                                 style: TextStyle(
                                  fontSize: 20,color: Colors.grey[700],
                                  ),
                                  ),
                                actions: 
                                <Widget>[
                                  TextButton( 
                                    child: 
                                    Text('Cancel',
                                    style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold , color: Colors.grey,
                                      ),
                                      ), 
                          
                                  onPressed: (){
                                    Navigator.pop(context);
      
                                  },
                          
                                  ),
                          
                                  TextButton( 
                                    child: 
                                    Text('Yes',
                                    style: TextStyle(
                                      color: Colors.red,fontSize: 20, fontWeight: FontWeight.bold ,
                                      ),
                                      ),
                                  onPressed: (){
                                     if (widget.contact.id !=null){
                                    helper.delete(widget.contact.id??-1);
                                  }
                                  },
                                  ),
                                ],
                              );
                            }
                            );
                  }, ),
      
              ],
              ),
          ),
        ),
      ),

    );
  }
}