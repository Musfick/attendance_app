import 'package:attendance_app/features/stores/data/model/link.dart';
import 'package:attendance_app/features/stores/data/model/meta.dart';
import 'package:attendance_app/features/stores/data/model/store.dart';

class PaginateStoresResponse {
  PaginateStoresResponse({
      List<Store>? data,
      Link? links,
      Meta? meta,}){
    _data = data;
    _links = links;
    _meta = meta;
}

  PaginateStoresResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Store.fromJson(v));
      });
    }
    _links = json['links'] != null ? Link.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<Store>? _data;
  Link? _links;
  Meta? _meta;
PaginateStoresResponse copyWith({  List<Store>? data,
  Link? links,
  Meta? meta,
}) => PaginateStoresResponse(  data: data ?? _data,
  links: links ?? _links,
  meta: meta ?? _meta,
);
  List<Store>? get data => _data;
  Link? get links => _links;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}