class ConsultantItem {
  final String companyName;
  final String textMessage;
  final String updateDate;

  ConsultantItem({
    required this.companyName,
    required this.textMessage,
    required this.updateDate,
  });

  factory ConsultantItem.fromJson(Map<String, dynamic> json) {
    return ConsultantItem(
        companyName: json['companyName'],
        textMessage: json['textMessage'],
        updateDate: json['updateDate']);
  }
}
