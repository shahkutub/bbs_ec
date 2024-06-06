/*
	 * Created by Aqib
	 * Created on Tue Oct 10 2023
	 *
	 * Updated by 
	 * Updated on 
	 *
	 * Reviewed by 
	 * Updated on 
	 *
	 * Screen Name: response_model.dart
	 * Description: 
	 *
	 * Copyright (c) 2023 a2i
 */

class ResponseModel {
  final bool _isSuccess;
  final String _message;
  ResponseModel(this._isSuccess, this._message);

  String get message => _message;
  bool get isSuccess => _isSuccess;
}
