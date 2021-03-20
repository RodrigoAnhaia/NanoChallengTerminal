import Foundation


// Array of flats
var flatsArray: [Flats] = []


// Objects
let flatSunset = Flats(location: "Av. Cabo Branco, 4560, João Pessoa, Paraíba - Brasil", amount: 1044.32, isRentable: true, email: "bluesunset@bol.uol.com.br", fone: "+55 83 99912-6158", guest: 2)

let flatGolden = Flats(location: "Av. Cidade Jardim, 411, São Paulo, São Paulo - Brasil", amount: 2190.22, isRentable: false, email: "goldentower@yahoo.com.br", fone: "+55 11 3159-8840", guest: 3)

let flatFac = Flats(location: "Av. Liberdade, 111, Presidente Prudente, São Paulo - Brasil", amount: 550.03, isRentable: true, email: "toledo@yahoo.com.br", fone: "+55 (18) 3408-2171", guest: 5)

// Append objects to the array
flatsArray.append(flatGolden)
flatsArray.append(flatSunset)
flatsArray.append(flatFac)

// Menu App
let menu = "Menu\n0 - Close \n1 - Search \n2 - Rent \n3 - Perfil \nChoice:"
print("Bem vindo ao Airbnb!")
print(menu)

// Search
func Search(){
   
    print("How many people?")
    guard let x = readLine() else { return }
    
    
    var guests = flatsArray.filter({ $0.guest <= Int(x)! })
    
    
    print("Please enter your search")
    guard let request = readLine() else { return }
    
    
    
    // Using filter to compare Strings
    let filtered = flatsArray.filter { $0.location.contains(request) }
    
    for clean in filtered {
        
        print(clean.printValue)
        
    }
    
}

// Flats struct
struct Flats {
    let location: String
    let amount: Double
    let isRentable: Bool
    let email: String
    let fone: String
    let guest: Int
    
    // CustomStringConvertible
    var printValue: String {
        
        return "Location: \(location), Amount: \(amount), Email: \(email), Fone: \(fone)"
    }
}

// App core
while true {
    
    // readLine() = input
    let typed = readLine()

    // Convert readLine () to Int. If it is not possible to convert it becomes optional
    if let typed = Int(typed ?? "0") {
        
    let choice: Int = typed
        
        if choice == 0{
            exit(0)
        }else if choice == 1{
            Search()
        }else if choice == 2{
            print("Waiting next updating!")
            
        }else if choice == 3 {
            print("Waiting next updating!")
        }
    } else {
        print("fail")
    }
}
