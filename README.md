# PowerShell CSV Data Processing Suite
This PowerShell suite facilitates the processing of CSV files based on a configurable set of parameters defined in a JSON configuration file. It is designed to be modular, with each script serving a specific purpose in the workflow.
## Configuration (`config.json`)
The configuration file contains essential parameters for the operation of the scripts, such as the name of the CSV file to be processed and the keys used for searching and displaying data.
Example `config.json` content:
```json
{
 "csvName": "data.csv",
 "key": "ColumnName",
 "value": "ColumnValue",
 "searchValue": "SearchTerm"
}
```
## Script Descriptions
### `Main.ps1`
The main script that orchestrates the execution of the other scripts, managing the flow and passing parameters between them.
Key functionalities:
- Loads the configuration from `config.json`.
- Loads CSV data from the specified file.
- Allows setting or selecting key/value variables.
- Updates the configuration file with newly selected values.
- Retrieves and displays the value based on the key and search value.
### `LoadConfig.ps1`
Loads the configuration settings from `config.json`.
### `LoadCsv.ps1`
Loads data from the CSV file specified in the configuration.
### `SetVariable.ps1`
Interactively selects or determines the key/value variables based on user input or predefined logic.
### `UpdateConfig.ps1`
Updates the configuration file with new values as chosen or determined during the execution flow.
### `GetValue.ps1`
Extracts and displays values from the CSV data based on the configuration's key and search value.
## Workflow
1. **Set up your configuration** in `config.json` according to your CSV file and desired search parameters.
2. **Run `Main.ps1`** to execute the suite. This script will sequentially call the other scripts to process the CSV data as configured.
```powershell
# Example command to run Main.ps1
.\Main.ps1
```
3. **Follow any on-screen prompts** (if `SetVariable.ps1` is set to require user interaction) to select keys and values for data processing.
## Notes
- Ensure all scripts are located in the same directory, or adjust the paths in `Main.ps1` accordingly.
- Depending on your requirements for `SetVariable.ps1`, you might need to customize this script to include specific logic for key/value selection.
This suite assumes simplified user interaction and clear responsibilities assigned to each script for a streamlined experience in processing CSV data based on dynamic configuration.