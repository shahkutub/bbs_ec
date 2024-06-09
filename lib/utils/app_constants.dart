// ignore_for_file: constant_identifier_names

class AppConstants {
  AppConstants._();

  // urls
  // test server
  static const String BASE_URL =
      'https://bbs-ec.codespecies.com/api'; //bbs-ec.nanoit.biz/api';

  static const String LOGIN_URI = '/auth/login';
  static const String STORE_URI = '/economic-cencus/store';
  static const String UPDATE_URI = '/economic-cencus/update/';
  // training server

  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'bbs_ec_token';
  static const String USER = 'bbs_ec_user';
  static const String REMEMBER_ME = 'remember_me';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_ID = 'user_id';

  static const String ARRAY_DATA = 'array_store_data';

  //text
  static const String NO_DATA = 'তথ্য পাওয়া যায়নি';
  static const String DATA_PENDING =
      'সার্ভার থেকে তথ্য আপডেট এর কাজ চলছে। অনুগ্রহ করে অপেক্ষা করুন।';
  static const String DATA_UPDATED =
      'সকল তথ্য আপডেট সম্পন্ন হয়েছে। অনুগ্রহপূর্বক সকল তথ্য ঠিক আছে কি না দেখে নিন। কোনো বিষয়ের পরিবর্তন হলে অনুগ্রহ করে পুনরায় সিঙ্ক বাটন চাপুন। ধন্যবাদ।';
}
