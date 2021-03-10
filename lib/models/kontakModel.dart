class Kontak {
  final int id;
  final String nama;
  final String noHp;
  final String email;

  Kontak({this.id, this.nama, this.noHp, this.email});

  factory Kontak.fromJson(Map<String, dynamic> json) {
    return Kontak(
      id: json['id'] as int,
      nama: json['nama'] as String,
      noHp: json['no_hp'] as String,
      email: json['email'] as String,
    );
  }
}

class Notif {
  final int status;
  final String values;

  Notif({this.status, this.values});

  factory Notif.fromJson(Map<String, dynamic> json) {
    return Notif(
      status: json['status'] as int,
      values: json['values'] as String,
    );
  }
}
