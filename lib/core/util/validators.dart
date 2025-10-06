

class Validators {
  static String? notEmpty(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Required' : null;

  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'Required';
    final re = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return re.hasMatch(v.trim()) ? null : 'Invalid email';
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'Required';
    if (v.length < 6) return 'Password must be at least 6 characters';
    return null;
  }
}
