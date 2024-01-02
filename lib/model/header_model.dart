class WatchListData {
  String? id;
  String? name;
  String? Contacts;
  String? url;
  WatchListData(this.Contacts, this.id, this.name, this.url);
  WatchListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    Contacts = json['Contacts'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'Contacts': Contacts,
      'url': url,
    };
  }
}
