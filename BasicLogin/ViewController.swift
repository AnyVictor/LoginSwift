//
//  ViewController.swift
//  BasicLogin
//
//  Created by Victor Felipe dos Santos on 06/02/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBAction func loginClick(_ sender: Any) {
        let tv = self.storyboard?.instantiateViewController(withIdentifier: "InfosTV") as! Infos
        self.navigationController?.pushViewController(tv, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        // Do any additional setup after loading the view.
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == self.usernameTextField) {
            passwordTextField.becomeFirstResponder()
        }
        else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }

}

