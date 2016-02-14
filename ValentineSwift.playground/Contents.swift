//: Playground - noun: a place where people can play

import Foundation

protocol Person {
    func makeSweet(name: String, ingredients: [Ingredient]) -> Sweet
    
    func eat(sweet: Sweet)
    func present(sweet: Sweet, to: Person?) throws
}

extension Person {
    func eat(sweet: Sweet) {
        print("om nom nom..., This \(sweet) is yummy.")
    }
}

enum Failure: ErrorType {
    case NotExists
}

struct Ingredient {
    enum IngredientUnit {
        case Gram
        case Number
    }
    
    var name: String
    var quantity: Float
    var unit: IngredientUnit
    
    init(name: String, quantity: Float, unit: IngredientUnit) {
        self.name = name
        self.quantity = quantity
        self.unit = unit
    }
}

struct Sweet {
    var name: String = ""
    
    init(name: String, ingredients: [Ingredient]) {
        self.name = name
        
        var ingredientNames: [String] = []
        
        for ingredient in ingredients {
            if ingredient.name == "Butter"
                || ingredient.name == "Sugar"
                || ingredient.name == "Egg"
                || ingredient.name == "Weak Flour"
                || ingredient.name == "Baking Powder"
                || ingredient.name == "Nut"
                || ingredient.name == "Chocolate"
            {
                ingredientNames.append(ingredient.name)
            }
        }
        
        if ingredientNames.contains("Butter")
            && ingredientNames.contains("Sugar")
            && ingredientNames.contains("Egg")
            && ingredientNames.contains("Weak Flour")
            && ingredientNames.contains("Baking Powder")
            && ingredientNames.contains("Nut")
            && ingredientNames.contains("Chocolate")
        {
            self.name = "Pound Cake"
        }
    }
}

struct KTanaka: Person {
    
    var name: String = "ktanaka"
    
    func makeSweet(name: String, ingredients: [Ingredient]) -> Sweet {
        return Sweet(name: "Pound Cake", ingredients: ingredients)
    }
    
    func present(sweet: Sweet, to: Person?) throws {
        if to == nil {
            eat(sweet)
            print("\(self.dynamicType): \"I'm sad.\"")
            throw Failure.NotExists
        }
        
        print("\(self.dynamicType): \"YEAAAAAAAAAAAAAA!!!\"")
    }
}



/*
    Ingredients
*/
let butter = Ingredient(name: "Butter", quantity: 150.0, unit: .Gram)
let sugar = Ingredient(name: "Sugar", quantity: 90.0, unit: .Gram)
let egg = Ingredient(name: "Egg", quantity: 3.0, unit: .Number)
let weakFlour = Ingredient(name: "Weak Flour", quantity: 150.0, unit: .Gram)
let bakingPowder = Ingredient(name: "Baking Powder", quantity: 2.5, unit: .Gram)
let nut = Ingredient(name: "Nut", quantity: 20.0, unit: .Gram)
let chocolate = Ingredient(name: "Chocolate", quantity: 20.0, unit: .Gram)

let ingredients = [butter, sugar, egg, weakFlour, bakingPowder, nut, chocolate]



/* 
    My Valentine this year
*/
let ktanaka = KTanaka()
let poundCake = ktanaka.makeSweet("Pound Cake", ingredients: ingredients)

do {
    try ktanaka.present(poundCake, to: nil)
} catch Failure.NotExists {
    print("Sadness Valentine")
}
