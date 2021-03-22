import Foundation


// Array of flats
var flatsArray: [Flats] = []

// Objects
let flatSunset = Flats(location: "Av. Cabo Branco, 4560, João Pessoa, Paraíba - Brasil", amount: "R$ 1044.32", occupiedPeriod: [], email: "bluesunset@bol.uol.com.br", fone: "+55 83 99912-6158", guest: 2, code: 1)

let flatGolden = Flats(location: "Av. Cidade Jardim, 411, São Paulo, São Paulo - Brasil", amount: "R$ 2190.22", occupiedPeriod: [], email: "goldentower@yahoo.com.br", fone: "+55 11 3159-8840", guest: 3, code: 2)

let flatFac = Flats(location: "Av. Liberdade, 111, Presidente Prudente, São Paulo - Brasil", amount: "R$ 550.03", occupiedPeriod: [], email: "toledo@yahoo.com.br", fone: "+55 (18) 3408-2171", guest: 5, code: 3)

let flatGordon = Flats(location: "Rua Doutor Rubens Maciel, 1005, Aberta dos Morros, Porto Alegre - Brasil", amount: "R$ 370.99", occupiedPeriod: [], email: "Gordons@gmail.com.br", fone: "+55 (51) 3455-3382", guest: 3, code: 4)

let flatIbis = Flats(location: "Avenida Frei Henrique de Coimbra, 503, Vila Ipiranga, Porto Alegre - Brasil", amount: "R$ 610.30", occupiedPeriod: [], email: "Ibishotel@gmail.com.br", fone: "+55 (51) 3473-6244", guest: 4, code: 5)

let flatMaori = Flats(location: "Travessa Henrique Hubert, 701, Recanto Verde do Sol, São Paulo - Brasil", amount: "R$ 315.00", occupiedPeriod: [], email: "residenciamaori@gmail.com.br", fone: "+55 (11) 3472-3349", guest: 1, code: 6)


// Append objects to the array
flatsArray.append(flatGolden)
flatsArray.append(flatSunset)
flatsArray.append(flatFac)
flatsArray.append(flatGordon)
flatsArray.append(flatIbis)
flatsArray.append(flatMaori)

// Menu App
let menu = "Menu\n0 - Close \n1 - Search \n2 - Rent \n3 - Profile \nChoice:"
print("Bem vindo ao Airbnb!")
print(menu)

// Search funcion
func Search(){
   
    
    //Getting how many people
    print("How many people?")
    guard let x = Int(readLine()!) else { return }
    
    
    //Getting the adress
    print("Please enter your search")
    guard let request = readLine() else { return }
    
    
    // Using filter to compare Strings
    let filtered = flatsArray.filter { $0.location.lowercased().unaccent().contains(request) &&  $0.guest <= (x)}
    
    if filtered.isEmpty {
        print("There are no apartments available with this configuration")
    }
    else {
        for element in filtered {
            print(element.printValue)
        }
    }
}
// Rent function
func Rent() {
    
    print("Please, enter the apartment Code: ")
    guard let code = Int(readLine()!) else { return }
    
    //Getting the check-in date
    print("Check-in(dd/mm/aaaa): ")
    guard let checkin = readLine() else { return }
    
    //Getting the checkout date
    print("Checkout(dd/mm/aaaa): ")
    guard let checkout = readLine() else { return }
    
    //Formating the Date
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    let checkinDate = formatter.date(from: checkin)
    let checkoutDate = formatter.date(from: checkout)
    
    let days = flatsArray.first { $0.code == code }
    var xxx: Date? = checkinDate
    var result: Bool = false
    
    //Add Date to an array
    while xxx! <= checkoutDate! {
        
        if days!.occupiedPeriod.contains(xxx!) {
            result = true
        }
        days?.occupiedPeriod.append(xxx!)
        xxx = Calendar.current.date(byAdding: .day, value: 1, to: xxx!)
        
    }
    //Print if the apartment is available in that period of time
    if result == true {
        print("\nThe apartment is unavailable on the selected days")
    } else {
        print("\nApartment booked successfully\nCheck-in: \(checkinDate!)\nCheckout: \(checkoutDate!)")
    }
    
}
// Flats struct
class Flats {
    let location: String
    let amount: String
    var occupiedPeriod: [Date]
    let email: String
    let fone: String
    let guest: Int
    let code: Int
    // CustomStringConvertible
    var printValue: String {
        
        return "Location: \(location), Amount: \(amount), Email: \(email), Fone: \(fone), Guests: \(guest), Code: --(\(code))--"
    }
    
    init(location: String, amount: String, occupiedPeriod: [Date], email: String, fone: String, guest: Int, code: Int) {
        
        self.location = location
        self.amount = amount
        self.occupiedPeriod = occupiedPeriod
        self.email = email
        self.fone = fone
        self.guest = guest
        self.code = code
    
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
            Rent()
            
        }else if choice == 3 {
            print("Waiting next updating!")
        }
    } else {
        print("fail")
    }
}

// Remove Accentuation
extension String {
    
    func unaccent() -> String {
        return self.folding(options: .diacriticInsensitive, locale: .current)
    }
    
}

