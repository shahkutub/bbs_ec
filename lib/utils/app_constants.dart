// ignore_for_file: constant_identifier_names

/* created by - Aqib
created at -26/09/23

This file has been created to manage all the constant variables of the application. 
Constants can be used to maintain consistent values across the application, such as error messages, API endpoints, or URLs.
This consistency ensures that the application behaves predictably and adheres to design guidelines
 */

class AppConstants {
  AppConstants._();

  // urls
  // test server
  static const String BASE_URL = 'https://api.project-ca.com';
  static const String BASE_URL_POST = 'https://master.project-ca.com';
  // training server

  // Shared Key
  static const String TOKEN = 'amar_school_token';
  static const String REFRESH_TOKEN = 'refresh_token';

  //text
  static const String NO_DATA = 'তথ্য পাওয়া যায়নি';
  static const String DATA_PENDING =
      'সার্ভার থেকে তথ্য আপডেট এর কাজ চলছে। অনুগ্রহ করে অপেক্ষা করুন।';
  static const String DATA_UPDATED =
      'সকল তথ্য আপডেট সম্পন্ন হয়েছে। অনুগ্রহপূর্বক সকল তথ্য ঠিক আছে কি না দেখে নিন। কোনো বিষয়ের পরিবর্তন হলে অনুগ্রহ করে পুনরায় সিঙ্ক বাটন চাপুন। ধন্যবাদ।';
}
