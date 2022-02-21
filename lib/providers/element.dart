class Tile{
  bool hidden;
  String imageSrc = "";
  String value;
  late int index;
  Map<String,int> typePairsNum = {};              //number of pairs for each tile type

  Tile({required this.value, required this.hidden});

  String getCategoryImageSrc(){
    if(value == "lemon"){
      imageSrc = 'images/lemon.png';
    }if(value == "leaf"){
      imageSrc = 'images/leaf.png';
    }if(value == "seven"){
      imageSrc = 'images/seven.png';
    }if(value == "star_type"){
      imageSrc = 'images/star_type.png';
    }if(value == 'melon'){
      imageSrc = 'images/melon.png';
    }if(value == 'grapes'){
      imageSrc = 'images/grapes.png';
    }if(value == 'apple'){
      imageSrc = 'images/apple.png';
    }if(value == 'orange'){
      imageSrc = 'images/orange.png';
    }
    return imageSrc;
  }
}