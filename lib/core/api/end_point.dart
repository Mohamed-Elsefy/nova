abstract class EndPoint {
  static const String baseUrl = 'https://api.escuelajs.co/api/v1',
      getProducts = '/products';
}

abstract class ApiKey {
  static final String id = 'id',
      title = 'title',
      name = 'name',
      price = 'price',
      description = 'description',
      categoryId = 'categoryId',
      category = 'category',
      images = 'images',
      image = 'image',
      slug = 'slug',
      creationAt = 'creationAt',
      updatedAt = 'updatedAt';
}
