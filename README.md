# Fylorg - Smart File Organizer

Fylorg can help sort & organize files in directories based on custom rules.

### Installation

```bash
$ gem install fylorg
```

### Usage

```bash
  fylorg --types=pdf --out=organized-files --dictionary=./dictionary.json
```

### Dictionary

The dictionary is a json configuration file used to categorize files based on keywords.
You can specify the organization algorithm using this json format

```json
  { "file_category_name": ["matching", "keywords", "list"] } 
```

```json
  {
    "accounts": [ "accounts", "finance", "money", "credit", "debit" ],
    "hiring":   [ "candidates", "interviews", "hiring" ]
  }
  ```
