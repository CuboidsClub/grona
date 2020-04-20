class AlertRequest{
  String title;
  String description;
  String buttonTitle;
  AlertRequest({this.title,this.description,this.buttonTitle});
}

class AlertResponse{
  final String fieldOne;
  final String fieldTwo;
  final bool confirmed;
  AlertResponse({this.fieldOne,this.fieldTwo,this.confirmed});
}