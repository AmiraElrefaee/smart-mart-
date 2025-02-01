abstract class RegisterRepo{
  Future <Map<String, dynamic>>register
      (String fname, String lname , String mail, String pass, String copass);
}