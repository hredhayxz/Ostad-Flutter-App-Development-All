class Product {
  final String id,
      productName,
      productCode,
      img,
      unitPrice,
      qty,
      totalPrice,
      createdDate;

  Product(this.id, this.productName, this.productCode, this.img, this.unitPrice,
      this.qty, this.totalPrice, this.createdDate);
  factory Product.toJson(Map<String,dynamic> it)
  {
    return Product(
        it['_id'],
        it['ProductName'],
        it['ProductCode'],
        it['Img'],
        it['UnitPrice'],
        it['Qty'],
        it['TotalPrice'],
        it['CreatedDate']);
  }
}
