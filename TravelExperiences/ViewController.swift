//
//  ViewController.swift
//  TravelExperiences
//
//  Created by Karan on 2021-11-27.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rememberMe: UISwitch!
    @IBOutlet weak var invalidCredentials: UITextView!
    @IBOutlet weak var showPasswordBtn: UIButton!
    
    var isRememberMe: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // populate users
        populateUsers()
        
        // set defaults
        rememberMe.isOn = false
        invalidCredentials.isHidden = true
        
        
        // Getting isRememberMe object
        let keyRememberMe = defaults.bool(forKey: "KEY_REMEMBER_ME")
        print(keyRememberMe)
        if keyRememberMe {
            // redirect to second screen
            print("qwe")
        }
    }
    
    func refresh() {
        
    }


    @IBAction func rememberMePressed(_ sender: UISwitch) {
        isRememberMe = sender.isOn
    }
    
    @IBAction func signIn(_ sender: Any) {
        let emailValid = isValidEmail(email.text!)
        if emailValid {
            for user:User in UsersDB.shared.getUsersList() {
                if (email.text == user.getEmail() && password.text == user.getPassword()) {
                    if isRememberMe {
                        defaults.set(isRememberMe, forKey: "KEY_REMEMBER_ME")
                    }
                    else {
                        defaults.set(isRememberMe, forKey: "KEY_REMEMBER_ME")
                    }
                    print("Successfully Logged in")
                    openThingsToDoScreen()
                    invalidCredentials.isHidden = true
                }
                else {
                    invalidCredentials.text = "The email or password entered is incorrect. Please try again!"
                    invalidCredentials.isHidden = false
                }
            }
        }
        else {
            invalidCredentials.text = "Please enter a valid email address"
            invalidCredentials.isHidden = false
        }
    }
    
    @IBAction func showPassword(_ sender: UIButton) {
        password.isSecureTextEntry = !password.isSecureTextEntry
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func populateUsers() {
        let user1 = User("Rahul", "rahul.vashist@georgebrown.ca", "GeorgeBrown")
        let user2 = User("Kamal", "kamal.singh@georgebrown.ca", "KamalSingh")
        let user3 = User("Test", "test.user@georgebrown.ca", "Test")
        let user4 = User("A", "a@a.com", "a")
        
        UsersDB.shared.usersList.append(user1)
        UsersDB.shared.usersList.append(user2)
        UsersDB.shared.usersList.append(user3)
        UsersDB.shared.usersList.append(user4)
    }
    
    func openThingsToDoScreen () {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let thingsToDoVC = storyboard.instantiateViewController(identifier: "ThingsToDo") as! ThingsToDoTableTableViewController
        
        self.navigationController?.pushViewController(thingsToDoVC, animated: true)
    }
}

