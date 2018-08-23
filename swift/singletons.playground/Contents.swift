//: Playground - noun: a place where people can play

import Foundation
import Cocoa


var str = "Hello, playground"

class NavigationService{
    
    func hello(){
        print("hello world")
    }
}

class Services{
     static let navigation = NavigationService()
}

Services.navigation.hello()
