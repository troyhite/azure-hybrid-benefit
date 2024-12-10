# Azure Hybrid Benefit Checker

This PowerShell script checks the Azure Hybrid Benefit status of all virtual machines in a specified Azure subscription.

## Prerequisites

- [Azure PowerShell Module](https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az?view=azps-7.0.0)
- Azure account with appropriate permissions to list virtual machines

## Usage

1. Open PowerShell.
2. Authenticate to Azure with the user with the required permissions using `Connect-AzAccount`.
3. Navigate to the directory containing the `azure-hybrid-benefit.ps1` script.
4. Run the script:

    ```powershell
    .\azure-hybrid-benefit.ps1
    ```

5. View the outputted CSV files with the details you need.

## Script Details

The script performs the following steps:

1. Gathers all the subscriptions the authenticated user has access to.
2. Sets the context to the provided subscriptions.
3. Retrieves all virtual machines in the subscription.
4. Checks the Azure Hybrid Benefit status of each virtual machine.
5. Outputs the details of each virtual machine, including:
    - VM Name
    - Region
    - OS Type
    - Resource Group Name
    - License Type

## Example Output
