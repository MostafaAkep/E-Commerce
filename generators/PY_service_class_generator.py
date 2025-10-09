import os
import sys

if len(sys.argv) > 1:
    user_input = sys.argv[1]
else:
    user_input = input("Enter Feature name: ")
BASE_NAME = user_input

BASE_DIR = os.path.join("lib", "features", BASE_NAME, "data", "services")
os.makedirs(BASE_DIR, exist_ok=True)  # ✅ Ensure directory exists

def generate_dart_file(file_path, class_name):
    template = f"""
abstract class {class_name} {{
}}
"""
    with open(file_path, 'w') as file:
        file.write(template)

# Example usage
file_name = BASE_NAME + '_service.dart'
class_name = BASE_NAME.capitalize() + 'Service'
file_path = os.path.join(BASE_DIR, file_name)

generate_dart_file(file_path, class_name)
print(f"✅ Dart file '{file_name}' generated successfully at {BASE_DIR}")


# ---------------------- Impl Class ----------------------

def generate_impl_file(file_path_impl, class_name, class_name_impl):
    template = f"""
import 'package:injectable/injectable.dart';
import '{BASE_NAME}_service.dart';

@Injectable(as: {class_name})
class {class_name_impl} extends {class_name} {{
  // Add implementation here
}}
"""
    with open(file_path_impl, 'w') as file:
        file.write(template)

file_name_impl = BASE_NAME + '_service_impl.dart'
class_name_impl = BASE_NAME.capitalize() + 'ServiceImpl'
file_path_impl = os.path.join(BASE_DIR, file_name_impl)

generate_impl_file(file_path_impl, class_name, class_name_impl)
print(f"✅ Dart file '{file_name_impl}' generated successfully at {BASE_DIR}")
