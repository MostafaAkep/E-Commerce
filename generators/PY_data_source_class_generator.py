# folder_structure_generator.py
# Generate DataSource and DataSourceImpl classes
import os
import sys

# Get feature name from args or input
if len(sys.argv) > 1:
    user_input = sys.argv[1]
else:
    user_input = input("Enter Feature name: ")

BASE_NAME = user_input

BASE_DIR = os.path.join("lib", "features", BASE_NAME)
directory = os.path.join(BASE_DIR, "data", "data_source")

# Create the directories if they don't exist
os.makedirs(directory, exist_ok=True)


# -------------------------
# Generate abstract data source
# -------------------------
def generate_data_source(file_name, class_name):
    template = f"""
abstract class {class_name} {{
}}
"""
    with open(os.path.join(directory, file_name), "w") as file:
        file.write(template)


# -------------------------
# Generate data source implementation
# -------------------------
def generate_data_source_impl(file_name_impl, class_name_impl, attributes):
    attributes_str = "".join(
        [f"  final {attribute['type']} {attribute['name']};\n" for attribute in attributes]
    )
    constructor_params = ", ".join([f"this.{attribute['name']}" for attribute in attributes])

    template = f"""
import 'package:injectable/injectable.dart';
import '../services/{BASE_NAME}_service.dart';
import '{BASE_NAME}_data_source.dart';

@Injectable(as: {class_name})
class {class_name_impl} extends {class_name} {{
{attributes_str}
  {class_name_impl}({constructor_params});
}}
"""
    with open(os.path.join(directory, file_name_impl), "w") as file:
        file.write(template)


# -------------------------
# Example usage
# -------------------------
file_name = BASE_NAME + "_data_source.dart"
class_name = BASE_NAME.capitalize() + "DataSource"

generate_data_source(file_name, class_name)
print(f"Dart file '{file_name}' generated successfully.")

file_name_impl = BASE_NAME + "_data_source_impl.dart"
class_name_impl = BASE_NAME.capitalize() + "DataSourceImpl"
attributes = [
    {"type": BASE_NAME.capitalize() + "Service", "name": "_service"},
]

generate_data_source_impl(file_name_impl, class_name_impl, attributes)
print(f"Dart file '{file_name_impl}' generated successfully.")
