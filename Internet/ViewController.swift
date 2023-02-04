//
//  ViewController.swift
//  Internet
//
//  Created by Abigail Zoe Magaña on 03/02/23.
//

import UIKit
import Network
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var actInd: UIActivityIndicatorView!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let ad = UIApplication.shared.delegate as! AppDelegate
        var mensaje = ""
        if ad.internetStatus{
            mensaje = "La conexion a Internet es " + ad.internetType
            // Hacemos la carga del contenido HTML
            //1.Creamos la URL del contenido
            let urlString = "https://manualweb.net/html/introduccion-html/"
           // guard let laUrl = URL(string: urlString) else { return }
            
            //Implementacion archivos locales
            guard let laUrl = Bundle.main.url(forResource: "entrenamiento_anaeróbico", withExtension: "pdf")else {return}
            
            //2. Creamos el request que se va a enviar
            let request = URLRequest(url: laUrl)
            webView.load(request)
        }else{
            mensaje = "No hay conexion a internet"
        }
        let ac = UIAlertController(title: "Hola", message: mensaje, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default){
                alertaction in
        }
        ac.addAction(action)
        self.actInd.stopAnimating()
        self.present(ac, animated: true)
        
    }


}

