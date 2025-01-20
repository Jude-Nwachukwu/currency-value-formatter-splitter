# Currency Value Formatter/Splitter

This Google Tag Manager (GTM) custom variable template helps format and clean currency values. It removes specified currency symbols and codes, with support for custom symbols and delimiters. It also handles different positions of currency codes or symbols (before or after the value) and returns the currency as a numeric value.

---

## Features:
- **Removes currency codes/symbols**: Remove currency symbols or codes from a given value (e.g., `$55.20` → `55.20`).
- **Customizable**: Add your own currency symbols/codes.
- **Flexible positioning**: Choose whether the currency code/symbol appears before or after the value.
- **Supports Delimiters**: Handles delimiters like commas or dashes in currency values (e.g., `€2,29` → `2.29`).
- **Returns Numeric Value**: Outputs the value as a float or integer after removing the currency code/symbol.

---

## How to Add the Template to Google Tag Manager:

### 1. Find the Template in the GTM Variable Template Gallery:
- Open Google Tag Manager (GTM) and navigate to **Variables**.
- Click **New** to create a new variable.
- In the variable configuration, click **Variable Configuration** and search for the template **Currency Value Formatter/Splitter**.
- Select it and proceed with the configuration steps.

### 2. Configure the Variable:
- **Currency Value Variable**: Add the variable that contains the currency value (e.g., `{{Transaction Value}}` or `{{Click Text}}`).
- **Currency Codes or Symbols**: Enter the currency symbols or codes you want to remove, separated by commas (e.g., `$ ,USD,€,EUR`).
- **Currency Code/Symbol Position**: Choose whether the currency symbol or code is positioned before or after the numeric value. Options:
  - `Before`: For symbols like `$55.20` (currency before value).
  - `After`: For codes like `55 USD` (currency after value).

### 3. Save and Use:
- Save the configuration and use the variable in your tags, triggers, or other variables as needed.

---

## Example Outputs

| Input (`currencyVariable`) | `customCurrencySymbols` | `currencyCodeSymbolPosition` | Output      |
|----------------------------|--------------------------|------------------------------|-------------|
| `$55.20`                   | `"$,USD"`               | `Before`                     | `55.2`      |
| `55 USD`                   | `"$,USD"`               | `After`                      | `55`        |
| `€2,29`                    | `"$,USD,€"`             | `Before`                     | `2.29`      |
| `JPY 6.72`                 | `"$,USD,JPY"`           | `Before`                     | `6.72`      |
| `12,345.67`                | `"$,USD,€"`             | `Before`                     | `undefined` |
| `TextOnly`                 | `"$,USD"`               | `Before`                     | `undefined` |
| ` `                        | `"$,USD"`               | `Before`                     | `0`         |

---

## Return Values:
- **0**: If the `currencyVariable` is empty or invalid.
- **Undefined**: If no valid currency symbols or codes are found in the `currencyVariable`.
- **Numeric Value**: If the symbol/code is successfully removed and the value is a valid number.

---

## Useful Information:
- **Delimiters**: The template automatically handles commas and spaces within the value. For example, it will strip out commas from `€2,29` or `$5,004.56` before returning the value.
- **Currency Symbol Before or After**: The position of the currency code or symbol is respected. If it’s before the value (e.g., `$55.20`), it will be removed accordingly. If it’s after the value (e.g., `55 USD`), it will also be removed correctly.
- **Handling Undefined Values**: If the `currencyVariable` is undefined or contains non-numeric values, the template returns `undefined`.

---

## License:
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

