// ignore_for_file: constant_identifier_names

const String col_uid = 'uid';
const String col_ename = 'ename';
const String col_name = 'name';
const String col_address = 'address';
const String col_gstin = 'gstin';
const String col_city = 'city';
const String col_hasgst = 'hasgst';
const String col_pincode = 'pincode';
const String col_state = 'state';
const String col_country = 'country';
const String col_mobileno = 'mobileno';
const String col_logins = 'login_ats';
const String col_crtm = 'created_at';
const String col_email = 'email';
const String col_url = 'photo_url';

class Users {
  String uid,
      ename,
      crtime,
      email,
      url,
      name,
      address,
      gstin,
      city,
      pincode,
      state,
      mobileno;
  bool hasgst;
  List<String> logins;

  Users({
    required this.uid,
    required this.name,
    required this.ename,
    required this.crtime,
    required this.logins,
    required this.email,
    required this.url,
    required this.address,
    required this.gstin,
    required this.city,
    required this.pincode,
    required this.state,
    required this.hasgst,
    required this.mobileno,
  });

  factory Users.fromMap(Map<String, dynamic>? map) => Users(
        uid: map![col_uid] ?? '',
        logins: List.castFrom(map[col_logins] ?? []),
        crtime: map[col_crtm],
        email: map[col_email] ?? '',
        url: map[col_url] ?? '',
        ename: map[col_ename] ?? '',
        name: map[col_name] ?? '',
        address: map[col_address] ?? '',
        gstin: map[col_gstin] ?? '',
        city: map[col_city] ?? '',
        pincode: map[col_pincode] ?? '',
        state: map[col_state] ?? '',
        hasgst: map[col_hasgst] ?? false,
        mobileno: map[col_mobileno] ?? '',
      );

  Map<String, dynamic> toMap() {
    return {
      col_uid: uid,
      col_ename: ename,
      col_crtm: crtime,
      col_email: email,
      col_url: url,
      col_name: name,
      col_address: address,
      col_gstin: gstin,
      col_city: city,
      col_pincode: pincode,
      col_state: state,
      col_hasgst: hasgst,
      col_mobileno: mobileno,
    };
  }
}
