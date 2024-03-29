class Hour {
  String id;
  String date;
  int minutes;
  String? description;

  Hour({required this.id, required this.date, required this.minutes, this.description});

  Hour.fromMap(Map<String, dynamic> map) :
    id = map['id'],
    date = map['date'],
    minutes = map['minutes'],
    description = map['description'];

  Map<String, dynamic> toMap() => {
    'id': id,
    'date': date,
    'minutes': minutes,
    'description': description,
  };
}