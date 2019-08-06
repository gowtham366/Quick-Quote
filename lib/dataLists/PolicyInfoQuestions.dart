class PolicyInfoQuestions {
  static final policyInfoQuestionsList = [
    {
      'LOB': 'Pet',
      'sectionTitle': [
        'Pet Basic Information',
        'Additional Details',
        'Pet Rate Modifiers'
      ],
      'BasicInformation': [
        {
          'id': 'petName',
          'question': 'Pet Name',
          'type': 'text',
          'isRequired': true
        },
        {
          'id': 'petType',
          'question': 'Pet Type',
          'type': 'switch',
          'availableOptions': ['Dog', 'Cat'],
          'isRequired': true
        },
        {
          'id': 'petSex',
          'question': 'Sex of Pet',
          'type': 'switch',
          'availableOptions': ['Male', 'Female'],
          'isRequired': true
        },
        {
          'id': 'petAge',
          'question': 'Pet Age',
          'type': 'dropdown',
          'hasMultipleOptions': false,
          'availableOptions': [
            '6 months',
            '1 year',
            '2 years',
            '3 years',
            '4 years',
            '5 years',
            '6 years'
          ],
          'isRequired': true
        },
        {
          'id': 'pureBreedStatus',
          'question': 'Pure Breed Status',
          'type': 'switch',
          'availableOptions': ['Yes', 'No'],
          'isRequired': true
        },
        // {
        //   'id': 'petBreed',
        //   'question': 'Breed of Pet',
        //   'type': 'dropdown',
        //   'hasMultipleOptions': true,
        //   'availableOptions': {
        //     'Dog': ['Boxer', 'Mastiff'],
        //     'Cat': ['Angora', 'cat2']
        //   },
        //   'isRequired': true
        // },
        {
          'id': 'pedigreeCertNo',
          'question': 'Pedigree Certificate No.',
          'type': 'text',
          'isRequired': false
        },
        {
          'id': 'petPurchasePrice',
          'question': 'Purchase Price of Pet',
          'type': 'number',
          'isRequired': false
        },
        {
          'id': 'dateOfPurchase',
          'question': 'Date of Purchase',
          'type': 'date',
          'isRequired': false
        }
      ],
      'AdditionalDetails': [
        {
          'id': 'petWeight',
          'question': 'Weight of the Pet',
          'type': 'number',
          'isRequired': false
        },
        {
          'id': 'deClawedStatus',
          'question': 'Declawed Status',
          'type': 'switch',
          'availableOptions': ['Yes', 'No'],
          'isRequired': false
        },
        {
          'id': 'outdoor',
          'question': 'Outdoor',
          'type': 'switch',
          'availableOptions': ['Yes', 'No'],
          'isRequired': false
        }
      ],
      'RateModifiers': [
        {
          'id': 'neuteredOrSpayed',
          'question': 'Neutered or spayed?',
          'type': 'switch',
          'availableOptions': ['Yes', 'No'],
          'isRequired': false
        },
        {
          'id': 'microchipped',
          'question': 'Microchipped?',
          'type': 'switch',
          'availableOptions': ['Yes', 'No'],
          'isRequired': false
        },
        {
          'id': 'microchipNumber',
          'question': 'Microchip Number',
          'type': 'text',
          'isRequired': false,
          'requiredFactor': {'Microchipped?': 'Yes'}
        },
        {
          'id': 'weightContronMgmt',
          'question': 'Weight Control Management ',
          'type': 'switch',
          'availableOptions': ['Yes', 'No'],
          'isRequired': false
        }
      ]
    }
  ];
}
