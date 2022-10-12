import 'package:flutter/material.dart';
import 'package:flutter_pro/contact.dart';
import 'package:flutter_pro/dbHelper.dart';
import 'package:flutter_pro/details.dart';






void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      
      home: Home(),
        
    );
  }
}

class Home  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Home > {

  late DbHelper helper  ;
  String ? name ;
  String ? number ;
  String ? url ;

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }   



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        floatingActionButton: FloatingActionButton(
          child:
           Icon(Icons.add , size: 30, color: Colors.white,),

          onPressed: (){
           showModalBottomSheet(

            shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),

              isScrollControlled: true,
                      
            context: context, 
            builder: (BuildContext bc) {
                      return 
                      Padding(
                         padding: MediaQuery.of(context).viewInsets ,
                         child:
                          Wrap(
                          children:
                           <Widget>[
                            Column(
                              children:
                               <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10 , right: 20 , left: 20),

                                  child:
                                   TextFormField(
                                    
                                    decoration: InputDecoration(
                                          hintText: 'Contact Name' ,
                                          hintStyle: TextStyle(fontWeight: FontWeight.bold ,fontSize: 25 ,color: Colors.grey),
                                      ),

                                      onChanged: (value){
                                        name = value ;
                                      },
                                  )
                                   ),

                                   SizedBox(height: 5,),

                                   Padding(
                                  padding: const EdgeInsets.only( right: 20 , left: 20),

                                  child:
                                   TextFormField(
                                    
                                    decoration: InputDecoration(
                                          hintText: 'Contact Number' ,
                                          hintStyle: TextStyle(fontWeight: FontWeight.bold ,fontSize: 25 ,color: Colors.grey),
                                      ),

                                      onChanged: (value){
                                        number = value ;
                                      },
                                  )
                                   ),

                                   SizedBox(height: 5,),

                                   Padding(
                                  padding: const EdgeInsets.only( right: 20 , left: 20),

                                  child:
                                   TextFormField(
                                    
                                    decoration: InputDecoration(
                                          hintText: 'Contact Image URL' ,
                                          hintStyle: TextStyle(fontWeight: FontWeight.bold ,fontSize: 25 ,color: Colors.grey),
                                      ),

                                      onChanged: (value){
                                        url = value ;
                                      },
                                  )
                                   ),

                                   SizedBox(height: 20,),

                                  


                              ],
                              ),
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
                                        child: Text('ADD' ,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold ,color: Colors.white, fontSize: 25 ,
                                        ),
                                        )
                                         ,
                               
                                        onPressed: ()async{
                                          Contact contact = Contact({'name': name , 'number' : number , 'url' : url });
                                              int id = await helper.createBook(contact);
                                              Navigator.of(context).pop() ;
                                        },

                                         ),
                                     ),
                               ),
                          ],
                          ), 
                         );
                      
                      }
          );
          }
          ),
       body:  
          Column(
                            children: <Widget>[

                              SizedBox(height: 25,) ,
                              Text('My Contacts',
                              style: TextStyle(
                                color: Colors.blue , fontSize: 30 , fontWeight: FontWeight.bold ,
                              ) ,
                              ),

                              SizedBox(height: 10,),
       
       
                              FutureBuilder(
                   future: helper.allTasks(),
                  builder: ((context,
                  AsyncSnapshot snapshot) {
                    if(snapshot.hasError)
                      return Center(child: Text(snapshot.error.toString()),);
                    if (! snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    else {
                          return Expanded(
                            child: GridView.count(
                              crossAxisCount: 2 ,
                              childAspectRatio: (1 / 2),
                              scrollDirection: Axis.vertical, 
                              crossAxisSpacing: 15, 
                              mainAxisSpacing: 15, 
                              children: List.generate(snapshot.data.length, (index) {
                                Contact contact =  Contact.fromMap(snapshot.data[index]);
                                return
                                Center(
                                  child: 
                                  Column(
                                    children:<Widget> [
                                                   
                                      Container(
                                      width: 120,
                                      height: 120 ,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey ,width: 1 ,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(75),
                                          ),
                                          ),
                                    
                                      child:
                                      ClipRRect( borderRadius: BorderRadius.circular (75),
                                      child: Image.network('${contact.url}' ,
                                      fit: BoxFit.cover, width: 120,height: 130 ,),
                                    )
                                       ),
                                                            
                                      TextButton(child: Text('${contact.name}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold , fontSize: 20 , color: Color.fromARGB(255, 70, 70, 70),
                                      ),
                                      textAlign: TextAlign.center,
                                      ),
                                      onPressed: ()async {
                                        await Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Details(contact),
                                            ),
                                            );
                                            setState(() {
                                              
                                            });
                                      },
                                      ),
                                      
                                      Text('${contact.number}',
                                      style: TextStyle(
                                        fontSize: 18 ,color: Colors.grey[700],
                                      ),
                                      ),
                                                            
                                    ],
                                    ),
                                  
                                  
                                ); 
                                }

                              ), 
                          ), 
                          ) ;
                    }
                  }
                  ),
                  ),
       
                            ],
                            ),
       
       
       
    );

  }
  
  }
  

  
	