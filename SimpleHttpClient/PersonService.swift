//
//  PersonService.swift
//  SimpleHttpClient

import Foundation

struct Person : Codable {
    var firstName : String
    var lastName : String
    var ssn : String
}

class PersonService {
    // create member variable personList is a list of Person
    var personList : [Person] = [Person]()
    
    // Code skeleton
    func addPerson(pObj : Person) {
//        implement logic using Async HTTP client API
        var requestUrl = "http://localhost:8020/PersonService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(pObj)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // task: call the resume
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                // resp type is Data, so convert to String
                let respStr = String(bytes: resp, encoding: .utf8)
                print("The respone data sent from the server is \(respStr!)")
            } else if let respError = error {
                print("Server Error: \(respError)")
            }
        }
        task.resume()
    }
    
//    func getAll() -> [Person] {
    func getAll() {
//        var personList = [Person]()
        print("PersonService about to send HTTP request to server\n")
        
        let requestUrl = "http://localhost:8020/PersonService/getAll"
        let request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        
        // to send data request we use dataTask
        // dataTask: asynchoronous processing, running in background
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let respData = data {
                // data is of Data type
//                let respStr = String(data: respData, encoding: .utf8)   // convert to String
//                print("The respones data is \(respStr!)")
                
                // decode data, convert back to list Person [Person] Json dict
                // self.personList: local object
                self.personList = try! JSONDecoder().decode([Person].self, from: respData)
                print("\nThe Person List:\n \(self.personList)")
            }
        }
        //
        task.resume()
//        return personList
    }
}


