class ApiURLs {
  static const String userLoginApiUrl =
      "http://retail.aadharindustries.in/person/authenticate";

  /*
  params
  -mobile_no
  -password

  */
  static const String forgotPassApiUrl =
      "http://retail.aadharindustries.in/person/reset_password";

  /*
  params
  -mobile_no

  */
  static const String changePassApiUrl =
      "http://retail.aadharindustries.in/person/change_password";
  /*
  params
  -mobile_no
  -existing_password
  -password

  */
  static const String personAccTransApiUrl =
      "http://retail.aadharindustries.in/person/person_account_trans";

  /*
  params
  -factory_id
  -person_id
  -qr_text
  -point-added
  -points_redeemed

  */
  static const String personPointReportApiUrl =
      "http://retail.aadharindustries.in/person/person_points_report";

/*
  params
  -factory_id
  -person_id

  */
  static const String personPointDetailApiUrl =
      "http://retail.aadharindustries.in/person/person_points_details";

  /*
  params
  -person_id
  
  */
  static const String personRegisterApiurl =
      "http://retail.aadharindustries.in/person/register";
  /*
      params
      person_name
      address
      city
      contact_no
      mobile_no
      email
      Password
      aadhar
      pan_no
      bank_name
      bank_branch
      bank_ac_no
      ifsc
      */
  static const String userProfileApiurl =
      "http://retail.aadharindustries.in/person/profile";
  /*
      params
      person_id
      */
  static const String userProfileupdateApiurl =
      "http://retail.aadharindustries.in/person/update";
  /*
      person_id
      person_name
      address
      city
      contact_no
      mobile_no
      email
      aadhar
      pan_no
      bank_name
      bank_branch
      bank_ac_no
      ifsc
      */
}
