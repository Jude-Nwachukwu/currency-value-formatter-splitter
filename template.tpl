___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Currency Value Formatter/Splitter",
  "description": "Formats currency values by removing currency symbols to return the actual value.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "currencyVariable",
    "displayName": "Currency Value Variable",
    "simpleValueType": true,
    "help": "Specify the variable that contains the currency value."
  },
  {
    "type": "TEXT",
    "name": "customCurrencySymbols",
    "simpleValueType": true,
    "displayName": "Custom Currency Codes or Symbols",
    "help": "Enter custom currency codes or symbols, separated by commas, if applicable.",
    "valueHint": "$,USD,€,EUR (Comma separated)"
  },
  {
    "type": "RADIO",
    "name": "currencyCodeSymbolPosition",
    "displayName": "Currency Code or Symbol Position",
    "radioItems": [
      {
        "value": "Before",
        "displayValue": "Before"
      },
      {
        "value": "After",
        "displayValue": "After"
      }
    ],
    "simpleValueType": true,
    "help": "Select the where the currency symbol or code is positioned in the supply variable."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeString = require('makeString');
const makeNumber = require('makeNumber');

function formatCurrency() {
  // Retrieve user inputs
  const currencyVariable = makeString(data.currencyVariable || '').trim();
  const customCurrencySymbols = makeString(data.customCurrencySymbols || '')
    .split(',')
    .map(function (symbol) { return symbol.trim(); });
  const position = data.currencyCodeSymbolPosition || 'Before';

  // Return 0 for empty input, undefined for missing or invalid input
  if (currencyVariable === '') {
    return 0;
  }
  if (!currencyVariable) {
    return undefined;
  }

  // Check if any custom symbol or code is present in the currencyVariable
  var containsSymbol = customCurrencySymbols.some(function (symbol) {
    if (position === 'Before') {
      return currencyVariable.indexOf(symbol) === 0;
    } else if (position === 'After') {
      return currencyVariable.lastIndexOf(symbol) === currencyVariable.length - symbol.length;
    }
    return false;
  });

  if (!containsSymbol) {
    return undefined;
  }

  // Remove currency symbols or codes based on position
  var cleanedValue = currencyVariable;

  if (position === 'Before') {
    customCurrencySymbols.forEach(function (symbol) {
      if (cleanedValue.indexOf(symbol) === 0) {
        cleanedValue = cleanedValue.substring(symbol.length).trim();
      }
    });
  } else if (position === 'After') {
    customCurrencySymbols.forEach(function (symbol) {
      if (cleanedValue.lastIndexOf(symbol) === cleanedValue.length - symbol.length) {
        cleanedValue = cleanedValue.substring(0, cleanedValue.length - symbol.length).trim();
      }
    });
  }

  // Remove delimiters like commas
  cleanedValue = cleanedValue.split(',').join('');

  // Validate that the result is a number
  const finalNumber = makeNumber(cleanedValue);
  return finalNumber === null ? undefined : finalNumber;
}

// Execute the function
return formatCurrency();


___TESTS___

scenarios:
- name: Quick Test
  code: runCode();
setup: ''


___NOTES___

Created on 5/27/2026, 3:47:56 PM


