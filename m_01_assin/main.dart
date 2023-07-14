var phoneNumber = [ "+88", 01768131685, 01768171985, 01768111286, 01768131685];

var list_lenth=phoneNumber.length;

void main(){

  for (int i=1; i<list_lenth;i++){

    if(phoneNumber!="+88"){
      print("${phoneNumber[0]} ${phoneNumber[i]}");
    }
    
  }
}