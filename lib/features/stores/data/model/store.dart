class Store {
  Store({
    int? id,
    String? name,
    String? address,}){
    _id = id;
    _name = name;
    _address = address;
  }

  Store.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
  }
  int? _id;
  String? _name;
  String? _address;
  Store copyWith({  int? id,
    String? name,
    String? address,
  }) => Store(  id: id ?? _id,
    name: name ?? _name,
    address: address ?? _address,
  );
  int? get id => _id;
  String? get name => _name;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    return map;
  }

}