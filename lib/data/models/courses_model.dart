class CoursesModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? language;
  String? title;
  String? slug;
  String? thumbImage;
  String? coverImage;
  String? excerpt;
  String? description;
  String? promoUrl;
  bool? status;
  String? price;
  int? subcategory;

  CoursesModel(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.language,
        this.title,
        this.slug,
        this.thumbImage,
        this.coverImage,
        this.excerpt,
        this.description,
        this.promoUrl,
        this.status,
        this.price,
        this.subcategory});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'];
    title = json['title'];
    slug = json['slug'];
    thumbImage = json['thumb_image'];
    coverImage = json['cover_image'];
    excerpt = json['excerpt'];
    description = json['description'];
    promoUrl = json['promo_url'];
    status = json['status'];
    price = json['price'];
    subcategory = json['subcategory'];
  }

}