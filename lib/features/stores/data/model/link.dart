class Link {
  Link({
    String? first,
    String? last,
    String? prev,
    String? next,}){
    _first = first;
    _last = last;
    _prev = prev;
    _next = next;
  }

  Link.fromJson(dynamic json) {
    _first = json['first'];
    _last = json['last'];
    _prev = json['prev'];
    _next = json['next'];
  }
  String? _first;
  String? _last;
  String? _prev;
  String? _next;
  Link copyWith({  String? first,
    String? last,
    String? prev,
    String? next,
  }) => Link(  first: first ?? _first,
    last: last ?? _last,
    prev: prev ?? _prev,
    next: next ?? _next,
  );
  String? get first => _first;
  String? get last => _last;
  String? get prev => _prev;
  String? get next => _next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = _first;
    map['last'] = _last;
    map['prev'] = _prev;
    map['next'] = _next;
    return map;
  }

}