class ProductDocument {
  String url;

  ProductDocument.fromJson(Map<String, dynamic> data) : url = data['url'];
}

class ProductPhoto {
  String url;

  ProductPhoto.fromJson(Map<String, dynamic> data) : url = data['url'];
}

class ProductModel {
  String id;

  String warranty;

  List<ProductDocument> documents;

  String name;

  double length;

  double width;

  double height;

  String grossWeight;

  String netWeight;

  /// <summary>
  /// 每个单位产品的数量，比如说一箱瓷砖有100片
  /// </summary>
  double unitOfSize;

  String productUnitMeasurement;

  double unitPrice;

  String placeOfOrigin;

  String brand;

  String category;

  String categoryLabel;

  String description;

  String type;

  String saleCategory;

  String color;

  String size;

  String thickness;

  String style;

  List<ProductPhoto> photos;

  String ownerName;

  bool isDangerous;

  bool isFragile;

  bool freeShipping;

  bool selfPickup;

  ProductModel.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        warranty = data['warranty'],
        name = data['name'],
        length = data['length'],
        width = data['width'],
        height = data['height'],
        grossWeight = data['grossWeight'],
        netWeight = data['netWeight'],
        unitOfSize = data['unitOfSize'],
        productUnitMeasurement = data['productUnitMeasurement'],
        unitPrice = data['unitPrice'],
        placeOfOrigin = data['placeOfOrigin'],
        brand = data['brand'],
        category = data['category'],
        categoryLabel = data['categoryLabel'],
        description = data['description'],
        type = data['type'],
        saleCategory = data['saleCategory'],
        color = data['color'],
        size = data['size'],
        thickness = data['thickness'],
        style = data['style'],
        ownerName = data['ownerName'],
        isDangerous = data['isDangerous'],
        isFragile = data['isFragile'],
        freeShipping = data['freeShipping'],
        selfPickup = data['selfPickup'],
        documents = data['documents'] == null
            ? []
            : (data['documents'] as List)
                .map((i) => ProductDocument.fromJson(i))
                .toList(),
        photos = (data['photos'] as List)
            .map((i) => ProductPhoto.fromJson(i))
            .toList();
}
