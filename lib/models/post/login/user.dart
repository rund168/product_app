class User {
  String? firstName;
  String? lastName;
  String? username;
  String? phoneNumber;
  String? email;
  String? profile;  // Renamed to 'profile' as per your API response
  List<Role>? roles; // Assuming the roles are a list of Role objects

  User({
    this.firstName,
    this.lastName,
    this.username,
    this.phoneNumber,
    this.email,
    this.profile,
    this.roles,
  });

  // Factory constructor to parse the JSON response
  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    profile = json['profile'];  // profile is used instead of profileImage
    if (json['roles'] != null) {
      roles = (json['roles'] as List).map((role) => Role.fromJson(role)).toList(); // Handling roles as a list
    }
  }

  // Convert the User object to JSON for sending to the server
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'profile': profile, // Include profile in the output JSON
      'roles': roles?.map((role) => role.toJson()).toList(), // Convert roles list to JSON
    };
  }
}

class Role {
  int? id;
  String? name;

  Role({this.id, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
