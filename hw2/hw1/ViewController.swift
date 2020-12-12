//
//  ViewController.swift
//  hw1
//
//  Created by David Dakhovich on 05/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    private let login = "test"
    private let pass = "test"

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "login"){
            if signIn() {
                return true
            } else {
                let alert = UIAlertController(title: "Error", message: "Wrong email or password", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: {_ in
                    self.emailField.text = nil
                    self.passwordField.text = nil
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
        return true
    }
    
    func signIn() -> Bool {
        return emailField.text == login && passwordField.text == pass
    }
}

