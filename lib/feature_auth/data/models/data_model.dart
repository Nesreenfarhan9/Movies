
class DataModel {
	final String email;
	final String password;
	final String name;
	final String phone;
	final int avaterId;
	final String id;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final int? v;

	const DataModel({
		required this.email,
		required this.password,
		required this.name,
		required this.phone,
		required this.avaterId,
		required this.id,
		this.createdAt, 
		this.updatedAt, 
		this.v, 
	});

	factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
				email: json['email'] as String,
				password: json['password'] as String,
				name: json['name'] as String,
				phone: json['phone'] as String,
				avaterId: json['avaterId'] as int,
				id: json['_id'] as String,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				v: json['__v'] as int?,
			);


}
