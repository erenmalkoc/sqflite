class Note {
  final int? id;
  final String note;

  Note({this.id, required this.note});

  factory Note.fromMap(Map<String, dynamic> json) => new Note(
    id: json['id'],
    note: json['note'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'note': note,
    };
  }
}