// Love Calculator
func love_calculator(name1: String, name2: String) -> Int {
    let combined_names = (name1+name2).lowercased()

    var true_score = 0
    for car in "true" {
      true_score += combined_names.filter { $0 == car }.count
    }
	
    var love_score = 0
    for car in "love" {
      love_score += combined_names.filter { $0 == car }.count
    }
	
    let love_percentage = Int("\(true_score)\(love_score)") ?? 0
    return love_percentage
}

// Example usage
let name1 = "Lucas"
let name2 = "Karol"

let love_percentage = love_calculator(name1: name1, name2: name2)

print("\nLove Score for \(name1) and \(name2): \(love_percentage)%\n")

switch love_percentage {
  case 80...:
    print("You two are on fire!")
  case 40..<80:
    print("There's potential here!")
  default:
    print("You might just be friends...")
}