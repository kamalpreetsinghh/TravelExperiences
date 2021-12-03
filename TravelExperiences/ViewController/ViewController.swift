//
//  ViewController.swift
//  TravelExperiences
//
//  Created by Karan on 2021-11-27.
//

import UIKit

class UserInfo {
    var email:String = ""
    var isRememberMe: Bool = false
    var isLoggedIn: Bool = false
    var favouritesList: [ThingsToDo] = []
}

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
        email.text = ""
        password.text = ""
        print("Hello")
        loginIfRememberMe()
    }
    
    @IBAction func rememberMePressed(_ sender: UISwitch) {
        isRememberMe = sender.isOn
    }
    
    @IBAction func signIn(_ sender: Any) {
        let emailValid = isValidEmail(email.text!)
        if emailValid {
            for user:User in UsersDB.shared.getUsersList() {
                if (email.text == user.getEmail() && password.text == user.getPassword()) {
                    
                    let userinfo = UserInfo()
                    userinfo.email = email.text!
                    userinfo.isRememberMe = isRememberMe
                    userinfo.isLoggedIn = true
//                    userinfo.favouritesList = []
                    
                    if isRememberMe {
                        defaults.set(user.email, forKey: "KEY_REMEMBER_ME")
                    }
                    else {
                        defaults.set("", forKey: "KEY_REMEMBER_ME")
                    }
                    
                    print("Successfully Logged in")
                    openThingsToDoScreen()
                    UsersDB.shared.currentUser = user
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
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func populateUsers() {
        let user1 = User("Rahul", "rahul.vashist@georgebrown.ca", "GeorgeBrown")
        let user2 = User("Kamal", "kamal.singh@georgebrown.ca", "KamalSingh")
        let user3 = User("Test", "test.user@georgebrown.ca", "Test")
        let user4 = User("A", "a@a.com", "a")
        
        UsersDB.shared.usersList.append(user1)
        UsersDB.shared.usersList.append(user2)
        UsersDB.shared.usersList.append(user3)
        UsersDB.shared.usersList.append(user4)
    }
    
    private func openThingsToDoScreen () {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let thingsToDoVC = storyboard.instantiateViewController(identifier: "ThingsToDo") as! ThingsToDoTableTableViewController
        
        self.navigationController?.pushViewController(thingsToDoVC, animated: true)
    }
    
    private func loginIfRememberMe () {
        let rememberMeUser = defaults.string(forKey: "KEY_REMEMBER_ME")
        
        if !(rememberMeUser?.isEmpty ?? true) {
            for user:User in UsersDB.shared.getUsersList() {
                if (rememberMeUser == user.getEmail()) {
                    openThingsToDoScreen()
                    UsersDB.shared.currentUser = user
                    invalidCredentials.isHidden = true
                }
            }
        }
    }
    
}

