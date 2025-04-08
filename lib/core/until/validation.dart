class Validation {
  static String? titleValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Title cannot be empty";
    } else {
      return null;
    }
  }

  static String? descriptionValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Description cannot be empty";
    } else {
      return null;
    }
  }


   static String? dateValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Due date cannot be empty";
    } else {
      return null;
    }
  }
}