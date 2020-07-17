//
//  iniciarSesionViewController.swift
//  Snapchat
//
//  Created by mbtec22 on 7/15/20.
//  Copyright © 2020 com.tecsup. All rights reserved.
//

import UIKit
import Firebase

class iniciarSesionViewController: UIViewController {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion:{ (user, error)in
            print("Intentamos Iniciar Sesión")
            if(error != nil){
                print("Tenemos el diguiente Error:\(error)")
            }else{
                print("Inicio de Sesion Exitoso")
            }
        })
    }
}
