import 'package:filderstr/features/product/domain/entity/post_product_entity.dart';

class PostProductModel extends PostProductEntity {
  const PostProductModel({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          image: image,
        );

  factory PostProductModel.fromJson(Map<String, dynamic> json) {
    return PostProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
      if (price != null) "price": price,
      if (description != null) "description": description,
      if (category != null) "category": category,
      if (image != null) "image": image,
    };
  }

  PostProductEntity toEntity() {
    return PostProductEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
    );
  }
}
