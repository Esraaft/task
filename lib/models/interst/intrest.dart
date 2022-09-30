class Intrest {
  var id, intrestText;

  Intrest({
    this.id,
    this.intrestText,
  });
  Intrest.empty() {}

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();
    if (id != null) {
      data['id'] = id;
    }
    data['intrestText'] = intrestText;

    return data;
  }

  @override
  toString() {
    return {
      'id': id,
      'intrestText': intrestText,
    }.toString();
  }
}
