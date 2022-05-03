//
//  ViewController.swift
//  AntonHomeWork2
//
//  Created by Антон Нарижный on 9.04.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Задание 1:")
        print(additionNumbers(num1: 6, num2: 12, num3: 0))
        print(subtractionNumbers(num1: 89, num2: 22, num3: 90))
        print(multiplyNumbers(num1: 41.1, num2: 22.5, num3: 1))
        print(divideNumbers(num1: 12, num2: 6, num3: 1))
        print("Задание 2: ")
        print(summOfFourNumbers(number: 4263))
        print("Задание 3:")
        print(compareStrings(string1: "авб", string2: "ввш"))
        print(compareStrings(string1: "шаа", string2: "ааа"))
        print(compareStrings(string1: "124", string2: "124"))
        print("Задания 4:")
        //print(cycle())
        print("Задание 5:")
        print(pow(number: 6))
        print("Задание 6:")
        print(fact(number: 4))
    }
    //Задание 1
    func additionNumbers(num1: Int, num2: Int, num3: Int) -> Int{
        return num1 + num2
    }
    
    func additionNumbers(num1: Double, num2: Double, num3: Double) -> Double{
        return num1 + num2
    }
    
    func subtractionNumbers(num1: Int, num2: Int, num3: Int) -> Int{
        return num1 - num2
    }
    
    func subtractionNumbers(num1: Double, num2: Double, num3: Double) -> Double{
        return num1 - num2
    }
    
    func multiplyNumbers(num1: Int, num2: Int, num3: Int) -> Int{
        return num1 * num2
    }
    
    func multiplyNumbers(num1: Double, num2: Double, num3: Double) -> Double{
        return num1 * num2
    }
    
    func divideNumbers(num1: Int, num2: Int, num3: Int) -> Int{
        return num1 / num2
    }
    
    func divideNumbers(num1: Double, num2: Double, num3: Double) -> Double{
        return num1 / num2
    }
    
    //Задание 2
    func summOfFourNumbers(number: Int) -> Int{
        var result: Int = 0
        var funcNumber = number
        while funcNumber > 0{
         result += funcNumber % 10
         funcNumber /= 10
        }
        return result
    }
    
    //Задание 3
    func compareStrings(string1: String, string2: String){
        if string1 > string2{
            print("Первая строка больше второй.")
        }else if string1 < string2{
            print("Вторая строка больше первой.")
        }else{
            print("Строки равны.")
        }
    }
    //Задание 4
//    func cycle(){
//        cycle()
//    }
    
    //Задание 5
    func pow(number: Int, degree: Int = 5){
        var i = 1
        var result = number
        while i < degree{
            result *= number
            i += 1
        }
        print(result)
    }
    //Задание 6
    func fact(number: Int){
        var result = number
        var temp = number
        while temp > 1{
            temp -= 1
            result *= temp
        }
        print(result)
    }
}

