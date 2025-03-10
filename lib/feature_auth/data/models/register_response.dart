
import 'data_model.dart';

class RegisterResponse {
	final String message;
	final DataModel data;

	const RegisterResponse({required this.message, required this.data});

	factory RegisterResponse.fromJson(Map<String, dynamic> json) {
		return RegisterResponse(
			message: json['message'] ,
			data:  DataModel.fromJson(json['data'] as Map<String, dynamic>),
		);
	}




}
