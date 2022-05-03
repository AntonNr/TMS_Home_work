//
//  ViewController.swift
//  HomeWork3
//
//  Created by Антон Нарижный on 13.04.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //обычный способ
        var array: [(Int, String)] = []
        array.append(contentsOf: [(2, "авб"), (7, "ввш"), (16, "яаа"), (11, "гкб")])
        let arrayWithDegree: [(Int, String)] = array.map{element in
            return (element.0 * element.0, element.1)      }
        print(arrayWithDegree)
        
        let filtredArray = array.filter {element in
            return element.0 % 2 == 0
        }
        print(filtredArray)
        
        let sortedArray = array.sorted {element1, element2 in
            return element1.1 < element2.1
        }
        print(sortedArray)
        
        //короткая запись
        print("Короткая запись: ")
        var firstArray: [(Int, String)] = [(2, "авб"), (7, "ввш"), (16, "яаа"), (11, "гкб")]
        
        var lastArray: [(Int, String)] = firstArray.map(){($0.0 * $0.0, $0.1)}.filter(){$0.0 % 2 == 0}.sorted(){$0.1 < $1.1}
        print(lastArray)
    }
   
}

