import Cocoa

let jsonString = """
{
  "id": "0001",
  "type": "donut",
  "name": "Cake",
  "ppu": 0.55,
  "batters": {
    "batter": [
      {
        "id": "1001",
        "type": "Regular"
      },
      {
        "id": "1002",
        "type": "Chocolate"
      },
      {
        "id": "1003",
        "type": "Blueberry"
      },
      {
        "id": "1004",
        "type": "Devil's Food"
      }
    ]
  },
  "topping": [
    {
      "id": "5001",
      "type": "None"
    },
    {
      "id": "5002",
      "type": "Glazed"
    },
    {
      "id": "5005",
      "type": "Sugar"
    },
    {
      "id": "5007",
      "type": "Powdered Sugar"
    },
    {
      "id": "5006",
      "type": "Chocolate with Sprinkles"
    },
    {
      "id": "5003",
      "type": "Chocolate"
    },
    {
      "id": "5004",
      "type": "Maple"
    }
  ]
}
"""

struct Batter: Codable {
    let id: String?
    let type: String?
}

struct Batters: Codable {
    let batter: [Batter?]
}

struct Food: Codable {
    let batters: Batters?
}

if let jsonData = jsonString.data(using: .utf8),
   let donut = try? JSONDecoder().decode(Food.self, from: jsonData),
   let batter = donut.batters?.batter {
    
    batter.filter { $0?.type == "Chocolate" || $0?.type == "Blueberry" }
    .compactMap { print("ID: \($0?.id ?? "N/A")\tType: \($0?.type ?? "N/A")") }

} else {
    print("Failed to decode data")
}
