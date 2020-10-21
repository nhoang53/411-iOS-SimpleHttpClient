//
//  ViewController.swift
//  SimpleHttpClient
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        print("ViewController about to call getAll() method")
//        let pService = PersonService()
//        pService.getAll()   // call main thread, running in background
//        let pList = pService.personList // this line run before the getAll service done
        
        // upload data to server
        let pService = PersonService()
        pService.addPerson(pObj: Person(firstName:"Amie", lastName:"Lam", ssn:"56565"))
        
        // start using GUI UIView class
//        let pService = PersonService()
        let textFrame = CGRect(x: 160, y: 240, width: 200, height: 40)
        let lable = UILabel(frame: textFrame)   // subclass UIView class define hierachi
        lable.text = "This is a test string."
        lable.backgroundColor = UIColor.yellow
        view.addSubview(lable)  // put view into container
    }


}

