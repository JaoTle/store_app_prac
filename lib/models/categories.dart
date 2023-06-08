class Category{
  final String icon,label;
  Category({required this.icon,required this.label});
  
}

List<Category> catagories_list = [
  Category(
    icon: "assets/icons/man.png",
    label: "Men's"
  ),
  Category(
    icon: "assets/icons/girl.png",
    label: "Women's"
  ),
  Category(
    icon: "assets/icons/electronics.png",
    label: "Electronics"
  ),
  Category(
    icon: "assets/icons/jewelry.png",
    label: "Jewelry"
  ),
];