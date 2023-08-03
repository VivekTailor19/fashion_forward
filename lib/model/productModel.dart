class ProductModel
{
  String? uId,name,desc,category,img;
  int? price,qty;
  bool? fav;

  ProductModel(
      {this.uId, this.name, this.desc, this.category, this.img , this.price,this.qty, this.fav});
}