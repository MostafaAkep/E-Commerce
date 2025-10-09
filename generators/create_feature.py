import os

def create_feature(feature_name):
    # Define the folder structure
    structure = {
        "data": [
            "data_source",
            "mappers",
            "models",
            "services"
        ],
        "domain": [
            "entities",
            "repositories",
            "use_cases"
        ],
        "presentation": [
            "manager",
            "pages",
            "widgets"
        ]
    }

    # Base path inside lib/features
    base_path = os.path.join(os.getcwd(), "lib", "features", feature_name)
    os.makedirs(base_path, exist_ok=True)

    # Create subfolders
    for main_folder, subfolders in structure.items():
        for sub in subfolders:
            os.makedirs(os.path.join(base_path, main_folder, sub), exist_ok=True)

    print(f"✅ Feature '{feature_name}' created successfully in lib/features/")

if __name__ == "__main__":
    feature_name = input("Enter the feature name: ").strip()
    if feature_name:
        create_feature(feature_name)
    else:
        print("❌ Feature name cannot be empty.")
