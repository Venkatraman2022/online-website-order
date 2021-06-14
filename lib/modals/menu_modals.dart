class CategoriesModal {
  static const CATEGORY = 'category';

  String category;
  CategoriesModal({
    this.category,
});
  CategoriesModal.fromMap(Map<String, dynamic> data,){
    category = data[CATEGORY];
  }
}