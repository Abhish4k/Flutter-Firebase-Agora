class QuickActionsModel {
  final String quickActionTitle;
  final String quickActionEmoji;
  final bool isSelected;
  final Function onTap;

  QuickActionsModel({
    required this.quickActionTitle,
    required this.quickActionEmoji,
    required this.isSelected,
    required this.onTap,
  });
}
