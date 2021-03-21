import Foundation


//MARKS:- Flats Array

var flatsArray: [Flats] = []

//MARK:- Static Objects

// Objects
let flatSunset = Flats(location: "Av. Cabo Branco, 4560, João Pessoa, Paraíba - Brasil", amount: 1044.32, isRentable: true, email: "bluesunset@bol.uol.com.br", fone: "+55 83 99912-6158", guest: 2)

let flatGolden = Flats(location: "Av. Cidade Jardim, 411, São Paulo, São Paulo - Brasil", amount: 2190.22, isRentable: false, email: "goldentower@yahoo.com.br", fone: "+55 11 3159-8840", guest: 3)

let flatFac = Flats(location: "Av. Liberdade, 111, Presidente Prudente, São Paulo - Brasil", amount: 550.03, isRentable: true, email: "toledo@yahoo.com.br", fone: "+55 (18) 3408-2171", guest: 5)

//MARK:- Append
flatsArray.append(flatGolden)
flatsArray.append(flatSunset)
flatsArray.append(flatFac)

//MARK:- Menu
let menu = "Menu\n0 - Close \n1 - Search \n2 - Rent \n3 - Perfil \nChoice:"
print("Bem vindo ao Airbnb!")
print(menu)

//MARK:- Search
func Search() {
   
    print("How many people?")
    guard let x = readLine() else { return }
    
    
    var guests = flatsArray.filter({ $0.guest <= Int(x)! })
    
    
    print("Please enter your search")
    guard let request = readLine() else { return }
        
    // Using filter to compare Strings
    let filtered = flatsArray.filter { $0.location.lowercased().unaccent().contains(request) }
        
    for element in filtered {
        
        print("\n",element.printValue)
        
        }
    }

//MARK:- Rent
func Rent() {
    
    // Using filter to compare Strings
    let filtered = flatsArray.filter { $0.isRentable == true }
   
    for (ind, element) in filtered.enumerated() {
        
        print("\n",ind," - ",element.printValue)
        
    }
    
    print("\nPease select your flat using the number keys:")
    guard let selected = Int(readLine()!) else { return }
    
    if selected < filtered.count && selected >= 0 {
        
        let selectedFlat = filtered[selected]
        
        print("\n",selectedFlat.printValue)
        print("\nConfirm? y/n: ")
        
        guard let confirm = readLine() else { return }
        if confirm == "y" {
            selectedFlat.isRentable = false
            print("\nConfirmed reservation. Returning to the menu.")
            print(menu)
        } else {
            print("\nCanceled reservation. Returning to the menu.")
            print(menu)
        }
        
    }else {
        print("Flat not located")
        print(menu)
    }
}

//MARK:- Flats Class
class Flats {
    var location: String
    var amount: Double
    var isRentable: Bool
    var email: String
    var fone: String
    var guest: Int
    // CustomStringConvertible
    var printValue: String {
        
        return "Location: \(location), Amount: \(amount), isRentable: \(isRentable) Email: \(email), Fone: \(fone), Guests: \(guest)"
    }
    
    init(location: String, amount: Double, isRentable: Bool, email: String, fone: String, guest: Int) {
        
        self.location = location
        self.amount = amount
        self.isRentable = isRentable
        self.email = email
        self.fone = fone
        self.guest = guest
    }
   
}

//MARK:- App Menu
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
            Rent()
            
        }else if choice == 3 {
            print("Waiting next updating!")
        }
    } else {
        print("Fail. Try again!")
        print("______________________________________________")
        print("Bem vindo ao Airbnb!")
        print(menu)
    }
}

//MARK:- Extension -> Remove Accentuation
extension String {

     func unaccent() -> String {

         return self.folding(options: .diacriticInsensitive, locale: .current)

     }

}

