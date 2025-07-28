class BottomNavigationModel {
  String selectedImage, unselectedImage;
  bool isSvg;
  String title;
  Function() onTab;
  BottomNavigationModel({
    required this.selectedImage,
    required this.unselectedImage,
    required this.onTab,
    required this.isSvg,
    required this.title,
  });
}
