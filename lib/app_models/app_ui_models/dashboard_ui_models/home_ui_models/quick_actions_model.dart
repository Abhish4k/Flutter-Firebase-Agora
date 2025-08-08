class QuickActionsModel {
  final String quickActionTitle;
  final String quickActionImage;
  final bool isSelected;
  final Function onTap;

  QuickActionsModel({
    required this.quickActionTitle,
    required this.quickActionImage,
    required this.isSelected,
    required this.onTap,
  });
}
