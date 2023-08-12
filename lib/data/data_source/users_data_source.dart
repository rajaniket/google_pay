class UserDataSource {
  final jsonData = """
    {
      "firstName": "Aarav",
      "lastName": "Sharma",
      "userId": "user_001",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 9876543210",
      "upi": "aaravsharma@upi",
      "account": "IN12345678901234"
    },
    {
      "firstName": "Neha",
      "lastName": "Verma",
      "userId": "user_002",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 8765432109",
      "upi": "nehaverma@upi",
      "account": "IN23456789012345"
    },
    {
      "firstName": "Rahul",
      "lastName": "Patel",
      "userId": "user_003",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 7654321098",
      "upi": "rahulpatel@upi",
      "account": "IN34567890123456"
    },
    {
      "firstName": "Priya",
      "lastName": "Rao",
      "userId": "user_004",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 6543210987",
      "upi": "priyacao@upi",
      "account": "IN45678901234567"
    },
    {
      "firstName": "Aryan",
      "lastName": "Gupta",
      "userId": "user_005",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 5432109876",
      "upi": "aryangupta@upi",
      "account": "IN56789012345678"
    },
    {
      "firstName": "Anaya",
      "lastName": "Singh",
      "userId": "user_006",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 4321098765",
      "upi": "anayasingh@upi",
      "account": "IN67890123456789"
    },
    {
      "firstName": "Vivaan",
      "lastName": "Mehta",
      "userId": "user_007",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 3210987654",
      "upi": "vivaanmehta@upi",
      "account": "IN78901234567890"
    },
    {
      "firstName": "Aanya",
      "lastName": "Joshi",
      "userId": "user_008",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 2109876543",
      "upi": "aanyajoshi@upi",
      "account": "IN89012345678901"
    },
    {
      "firstName": "Kabir",
      "lastName": "Kumar",
      "userId": "user_009",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 1098765432",
      "upi": "kabirkumar@upi",
      "account": "IN90123456789012"
    },
    {
      "firstName": "Ishika",
      "lastName": "Malhotra",
      "userId": "user_010",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 0987654321",
      "upi": "ishikamalhotra@upi",
      "account": "IN01234567890123"
    },
    {
      "firstName": "Arjun",
      "lastName": "Thakur",
      "userId": "user_011",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 9876543210",
      "upi": "arjunthakur@upi",
      "account": "IN12345678901234"
    },
    {
      "firstName": "Sanya",
      "lastName": "Bhatia",
      "userId": "user_012",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 8765432109",
      "upi": "sanyabhatia@upi",
      "account": "IN23456789012345"
    },
    {
      "firstName": "Rishi",
      "lastName": "Chopra",
      "userId": "user_013",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 7654321098",
      "upi": "rishichopra@upi",
      "account": "IN34567890123456"
    },
    {
      "firstName": "Mira",
      "lastName": "Gandhi",
      "userId": "user_014",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 6543210987",
      "upi": "miragandhi@upi",
      "account": "IN45678901234567"
    },
    {
      "firstName": "Veer",
      "lastName": "Shah",
      "userId": "user_015",
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
      "mobile": "+91 5432109876",
      "upi": "veershah@upi",
      "account": "IN56789012345678"
    }""";

  Future<String> fetchRawUserData() async {
    await Future.delayed(const Duration(seconds: 1));
    return jsonData;
  }
}
