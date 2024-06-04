//
//  ViewController.swift
//  OptionalsClosuresProtocols
//
//  Created by Shivam Shishangia on 22/05/24.
//

import UIKit

// MARK: Struct and mutating functions
// Define a struct called "Student" with properties like name, age, grade, and an array of subjects.
// Create a mutating function within the struct that allows you to add or remove subjects from the array.
struct Student {
    var name: String
    var age: Int
    var grade: String
    var subjects: [String]

    mutating func addSubject(_ subject: String) {
        self.subjects.append(subject)
        print(self.subjects)
    }

    mutating func removeSubject(_ subject: String) {
        if let index = self.subjects.firstIndex(of: subject) {
            self.subjects.remove(at: index)
            print(self.subjects)
        } else {
            print("Cannot find subject")
        }
    }
}

// Implement a struct called "Rectangle" with properties for width and height. Create a mutating function that calculates and updates the area of the rectangle based on the current width and height values.
struct Rectangle {
    var width: Double
    var height: Double
    var area: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
        self.area = 0
    }

    mutating func updateArea() {
        self.area = self.width * self.height
        print(self.area)
    }
}

// MARK: Class, Weak vs Strong, and Protocol
// Define a class called "Vehicle" with properties like make, model, and year. Create a subclass called "Car" that inherits from "Vehicle" and adds additional properties like numberOfDoors and fuelType.
class Vehicle {
    var make: String
    var model: String
    var year: Int
    
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
}

class Car: Vehicle {
    var numberOfDoors: Int
    var fuelType: String

    init(make: String, model: String, year: Int, numberOfDoors: Int, fuelType: String) {
        self.numberOfDoors = numberOfDoors
        self.fuelType = fuelType
        super.init(make: make, model: model, year: year)
    }
}

// Implement a protocol called "Drivable" with a method called "drive()". Create a class called "Driver" that has a weak reference to a "Drivable" object. Implement the "drive()" method in the "Car" class to conform to the "Drivable" protocol.
protocol Drivable: AnyObject {
    func drive()
}

class Driver {
    weak var vehicle: Drivable?
    
    init(vehicle: Drivable?) {
        self.vehicle = vehicle
    }
    
    func startDriving() {
        vehicle?.drive()
    }
}

extension Car: Drivable {
    func drive() {
        print("Started driving \(self.make) \(self.model)")
    }
}

// MARK: Combining Multiple Topics - 1
// Create a struct called "Book" with properties like title, author, and pages. Implement a class called "Library" that has an array of "Book" objects. Create a protocol called "Sortable" with a method to sort the array based on a closure that defines the sorting criteria (e.g., sort by title, author, or number of pages).
struct Book {
    var title: String
    var author: String
    var pages: Int
}

class Library {
    var books: [Book]

    init(books: [Book]) {
        self.books = books
    }
}

protocol Sortable {
    func sortBooks(_ closure: (Book, Book) -> Bool) -> [Book]
}

extension Library: Sortable {
    func sortBooks(_ closure: (Book, Book) -> Bool) -> [Book] {
        return self.books.sorted(by: closure)
    }
}

// MARK: Combining Multiple Topics - 2
// Define a class called "Employee" with properties like name, age, and department. Create a protocol called "Promotable" with a method to promote an employee to a higher position. Implement a closure within the "promote()" method that calculates the new salary based on the employee's current salary and a promotion factor.
class Employee {
    var name: String
    var age: Int
    var department: String
    var salary: Double
    
    init(name: String, age: Int, department: String, salary: Double) {
        self.name = name
        self.age = age
        self.department = department
        self.salary = salary
    }

    func printData() {
        print("Name: \(self.name)\nAge: \(self.age)\nDepartment: \(self.department)\nSalary: \(self.salary)\n")
    }
}

protocol Promotable {
    func promote(_ promotionFactor: Double, closure: (Double, Double) -> Double)
}

extension Employee: Promotable {
    func promote(_ promotionFactor: Double, closure: (Double, Double) -> Double) {
        self.salary = closure(self.salary, promotionFactor)
    }
}

// MARK: Main ViewController
class ViewController: UIViewController {

    // MARK: Optionals and Ways to Get Data from Optionals
    // Create a function that takes a string as input and returns an optional integer. If the string can be converted to an integer, return the integer value; otherwise, return nil.
    func stringToInt(_ inputString: String) -> Int? {
        return Int(inputString) ?? nil
    }

    // Implement a function that takes an array of strings and returns an array of optional integers. Use appropriate methods to unwrap the optionals and filter out any nil values.
    func stringArrayToIntArray(_ inputArray: [String]) -> [Int] {
        return inputArray.compactMap { Int($0) }
    }

    // MARK: Closure and Its Usage
    // Create a function that takes a closure as a parameter. The closure should accept two integers and return their sum. Inside the function, call the closure with different sets of numbers and print the results.
    func closureSum(_ closure: (Int, Int) -> (Int)) {
        print(closure(1, 2))
        print(closure(3, 4))
    }

    // Implement a function that sorts an array of integers using a closure as a comparison function. The closure should define the sorting criteria (e.g., ascending or descending order).
    func closureSort(_ inputArray: [Int],_ closure: (Int, Int) -> Bool) -> [Int] {
        return inputArray.sorted(by: closure)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(stringToInt("1234"))
//        print(stringArrayToIntArray(["1234", "Hello", "", "345"]))
//
//        var student = Student(name: "Shivam", age: 26, grade: "A", subjects: ["Math", "Physics", "Chemistry"])
//        print(student.subjects)
//
//        student.addSubject("History")
//        student.removeSubject("History")
//        student.removeSubject("Biology")

//        var rectangle = Rectangle(width: 10, height: 20)
//        print(rectangle.area)
//        rectangle.updateArea()

//        closureSum { num1, num2 in
//            return num1 + num2
//        }

//        let sortedArrayAsc = closureSort([3,5,1,2,8,4]) { num1, num2 in
//            return num1 < num2
//        }
//        print(sortedArrayAsc)
//
//        let sortedArrayDes = closureSort([3,5,1,2,8,4]) { num1, num2 in
//            return num1 > num2
//        }
//        print(sortedArrayDes)

//        let car = Car(make: "Honda", model: "Accord", year: 2024, numberOfDoors: 4, fuelType: "Petrol")
//        let driver = Driver(vehicle: car)
//        driver.startDriving()

//        let library = Library(books: [
//            Book(title: "Let Us C", author: "Yashavant Kanetkar", pages: 300),
//            Book(title: "Atomic Habits", author: "James Clear", pages: 900),
//            Book(title: "Decode and Conquer", author: "A. Lewis Lin", pages: 200)
//        ])
//
//        let sortedBooksTitle = library.sortBooks { book1, book2 in
//            return book1.title < book2.title
//        }
//        print(sortedBooksTitle)
//
//        let sortedBooksAuthor = library.sortBooks { book1, book2 in
//            return book1.author < book2.author
//        }
//        print(sortedBooksAuthor)
//
//        let sortedBooksPages = library.sortBooks { book1, book2 in
//            return book1.pages < book2.pages
//        }
//        print(sortedBooksPages)
        let employee = Employee(name: "Shivam Shishangia", age: 26, department: "iOS Development", salary: 50000)
        employee.printData()
        
        employee.promote(1.25) { oldSalary, promotionFactor in
            return oldSalary * promotionFactor
        }
        employee.printData()
    }
}

