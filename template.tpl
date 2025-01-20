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
  "displayName": "Currency Value Formatter",
  "description": "Formats currency values by removing currency symbols to return the actual value in your preferred data type..",
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
  },
  {
    "type": "SELECT",
    "name": "formattingMode",
    "displayName": "Currency Formatting Mode",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "Automatic Formatting for All Supported Currencies",
        "displayValue": "Automatic Formatting (All Currencies)"
      },
      {
        "value": "Custom Formatting for Selected Currencies",
        "displayValue": "Custom Formatting (Selected Currencies)"
      }
    ],
    "simpleValueType": true,
    "help": "Choose a formatting mode. \u0027Automatic Formatting\u0027 is recommended for most use cases."
  },
  {
    "type": "TEXT",
    "name": "customCurrencySymbols",
    "simpleValueType": true,
    "displayName": "Custom Currency Codes or Symbols",
    "help": "Enter custom currency codes or symbols, separated by commas, if applicable.",
    "enablingConditions": [
      {
        "paramName": "formattingMode",
        "paramValue": "Custom Formatting for Selected Currencies",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "outputDataType",
    "displayName": "Output Data Type",
    "radioItems": [
      {
        "value": "String",
        "displayValue": "String"
      },
      {
        "value": "Float",
        "displayValue": "Float"
      },
      {
        "value": "Integer",
        "displayValue": "Integer"
      }
    ],
    "simpleValueType": true,
    "help": "Select the desired data type for the final output."
  },
  {
    "type": "CHECKBOX",
    "name": "includeTextAfterValue",
    "checkboxText": "Enable this option if the currency variable includes text after the currency value.",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const log = require('logToConsole');

log('data =', data);

// Variables must return a value.
return false;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Quick Test
  code: runCode();
setup: ''


___NOTES___

Created on 1/20/2025, 11:50:40 AM


