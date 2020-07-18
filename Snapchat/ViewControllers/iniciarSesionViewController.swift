//
//  iniciarSesionViewController.swift
//  Snapchat
//
//  Created by mbtec22 on 7/2/20.
//  Copyright © 2020 dquispe. All rights reserved.
//

import UIKit
import Firebase

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in print("Intentamos Iniciar Sesión")
            if error != nil {
                print("Tenemos el siguiente error : \(error)")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in print("Intentamos crear un usuario")
                    if error != nil{
                        print("Tenemos el siguiente error : \(error)")
                    }else{
                        print("El usuario fue creado exitosamente")
                        
                        Database.database().reference().child("usuarios").child((user?.user.uid)!).child("email").setValue(user?.user.email)
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else{
                print("Inicio de Sesión exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
    }
    
}

