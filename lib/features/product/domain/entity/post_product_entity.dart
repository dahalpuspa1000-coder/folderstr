import 'package:equatable/equatable.dart';

class PostProductEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;

  const PostProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (image != null) 'image': image,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
      ];
}

