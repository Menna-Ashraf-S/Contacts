class Contact {

  int ? id ;
  String ? name ;
  String ? number ;
  String ? url ;

  Contact (dynamic obj){
     if (obj['id']!= null) {
      id = obj['id'];
     }
  name = obj['name'];
  number = obj['number'];
  url = obj['url'];
  }

  Contact.fromMap (Map <String , dynamic> data ){
  if (data['id']!= null){
    id = data['id'];
  }
  name = data['name'];
  number = data['number'];
  url = data['url'];
 }

  Map <String , dynamic> toMap () {
 Map <String , dynamic> Data = { 
  'name' : name  ,
   'number': number ,
    'url': url ,
    };
 if (id != null){
  Data ['id'] = id ;
 }
 return Data ; 
 } 

}