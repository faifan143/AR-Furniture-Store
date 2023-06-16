class ObjectModel {
  String? _objectId;
  String? _objectImage;
  String? _objectTitle;
  String? _objectSubtitle;
  String? _objectPrice;
  String? _objectDescription;
  String? _objectStoreName;
  String? _objectArModel;
  String? _objectClass;
  String? _objectStoreLat;
  String? _objectStoreLng;

  ObjectModel(
      {String? objectId,
      String? objectImage,
      String? objectTitle,
      String? objectSubtitle,
      String? objectPrice,
      String? objectDescription,
      String? objectStoreName,
      String? objectArModel,
      String? objectClass,
      String? objectStoreLat,
      String? objectStoreLng}) {
    if (objectId != null) {
      this._objectId = objectId;
    }
    if (objectImage != null) {
      this._objectImage = objectImage;
    }
    if (objectTitle != null) {
      this._objectTitle = objectTitle;
    }
    if (objectSubtitle != null) {
      this._objectSubtitle = objectSubtitle;
    }
    if (objectPrice != null) {
      this._objectPrice = objectPrice;
    }
    if (objectDescription != null) {
      this._objectDescription = objectDescription;
    }
    if (objectStoreName != null) {
      this._objectStoreName = objectStoreName;
    }
    if (objectArModel != null) {
      this._objectArModel = objectArModel;
    }
    if (objectClass != null) {
      this._objectClass = objectClass;
    }
    if (objectStoreLat != null) {
      this._objectStoreLat = objectStoreLat;
    }
    if (objectStoreLng != null) {
      this._objectStoreLng = objectStoreLng;
    }
  }

  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId;
  String? get objectImage => _objectImage;
  set objectImage(String? objectImage) => _objectImage = objectImage;
  String? get objectTitle => _objectTitle;
  set objectTitle(String? objectTitle) => _objectTitle = objectTitle;
  String? get objectSubtitle => _objectSubtitle;
  set objectSubtitle(String? objectSubtitle) =>
      _objectSubtitle = objectSubtitle;
  String? get objectPrice => _objectPrice;
  set objectPrice(String? objectPrice) => _objectPrice = objectPrice;
  String? get objectDescription => _objectDescription;
  set objectDescription(String? objectDescription) =>
      _objectDescription = objectDescription;
  String? get objectStoreName => _objectStoreName;
  set objectStoreName(String? objectStoreName) =>
      _objectStoreName = objectStoreName;
  String? get objectArModel => _objectArModel;
  set objectArModel(String? objectArModel) => _objectArModel = objectArModel;
  String? get objectClass => _objectClass;
  set objectClass(String? objectClass) => _objectClass = objectClass;
  String? get objectStoreLat => _objectStoreLat;
  set objectStoreLat(String? objectStoreLat) =>
      _objectStoreLat = objectStoreLat;
  String? get objectStoreLng => _objectStoreLng;
  set objectStoreLng(String? objectStoreLng) =>
      _objectStoreLng = objectStoreLng;

  ObjectModel.fromJson(Map<String, dynamic> json) {
    _objectId = json['object_id'];
    _objectImage = json['object_image'];
    _objectTitle = json['object_title'];
    _objectSubtitle = json['object_subtitle'];
    _objectPrice = json['object_price'];
    _objectDescription = json['object_description'];
    _objectStoreName = json['object_store_name'];
    _objectArModel = json['object_ar_model'];
    _objectClass = json['object_class'];
    _objectStoreLat = json['object_store_lat'];
    _objectStoreLng = json['object_store_lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['object_id'] = this._objectId;
    data['object_image'] = this._objectImage;
    data['object_title'] = this._objectTitle;
    data['object_subtitle'] = this._objectSubtitle;
    data['object_price'] = this._objectPrice;
    data['object_description'] = this._objectDescription;
    data['object_store_name'] = this._objectStoreName;
    data['object_ar_model'] = this._objectArModel;
    data['object_class'] = this._objectClass;
    data['object_store_lat'] = this._objectStoreLat;
    data['object_store_lng'] = this._objectStoreLng;
    return data;
  }
}
