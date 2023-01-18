
class OrderDetail{
  late int? id;
  late String? email;
  late String? firstName;
  late String? lastName;
  late String? avatar;

  OrderDetail(
      this.id, this.email, this.firstName, this.lastName, this.avatar);

  OrderDetail.fromJson(Map<String, dynamic>json):id=json['id'],email=json['email'],firstName=json['first_name'],lastName=json['last_name'],avatar=json['avatar'];

  @override
  String toString() {
    return 'OrderDetail{id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar}';
  }
}