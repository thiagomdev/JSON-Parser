//
//  ViewController.swift
//  JsonParser
//
//  Created by do Nascimento Monteiro, Thiago on 20/10/21.
//

import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let path = Bundle.main.path(forResource: "usersAPI", ofType: "txt") else { return }
        let baseURL = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: baseURL)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(json)
            guard let array = json as? [Any] else { return }
            for user in array {
                guard let userDict = user as? [String: Any] else { return }
                guard let userId = userDict["id"] as? Int else { print("not an Int"); return }
                guard let name = userDict["name"] as? String else { return }
                guard let company = userDict["company"] as? [String: String] else { return }
                guard let companyName = company["name"] else { return }
                print(userId)
                print(name)
                print(companyName)
                print(" ")
            }
        }
        catch {
            print(error)
        }
    }
}

