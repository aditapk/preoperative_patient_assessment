// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PhysicianInformation {
  String? name;
  String? department;
  String? phoneNumber;
  PhysicianInformation({
    this.name,
    this.department,
    this.phoneNumber,
  });
  

  PhysicianInformation copyWith({
    String? name,
    String? department,
    String? phoneNumber,
  }) {
    return PhysicianInformation(
      name: name ?? this.name,
      department: department ?? this.department,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'department': department,
      'phoneNumber': phoneNumber,
    };
  }

  factory PhysicianInformation.fromMap(Map<String, dynamic> map) {
    return PhysicianInformation(
      name: map['name'] != null ? map['name'] as String : null,
      department: map['department'] != null ? map['department'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhysicianInformation.fromJson(String source) => PhysicianInformation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PhysicianInformation(name: $name, department: $department, phoneNumber: $phoneNumber)';

  @override
  bool operator ==(covariant PhysicianInformation other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.department == department &&
      other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode => name.hashCode ^ department.hashCode ^ phoneNumber.hashCode;
}


class Physician {
  String name;
  String department;
  String phoneNumber;
  Physician({
    required this.name,
    required this.department,
    required this.phoneNumber,
  });
  

  Physician copyWith({
    String? name,
    String? department,
    String? phoneNumber,
  }) {
    return Physician(
      name: name ?? this.name,
      department: department ?? this.department,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'department': department,
      'phoneNumber': phoneNumber,
    };
  }

  factory Physician.fromMap(Map<String, dynamic> map) {
    return Physician(
      name: map['name'] as String,
      department: map['department'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Physician.fromJson(String source) => Physician.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Physician(name: $name, department: $department, phoneNumber: $phoneNumber)';

  @override
  bool operator ==(covariant Physician other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.department == department &&
      other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode => name.hashCode ^ department.hashCode ^ phoneNumber.hashCode;
}
