//
//  DetalleDocumentoMedicoViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 13/12/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleDocumentoMedicoViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(DocumentosMedicosViewController.path!)
        webView.loadRequest(URLRequest(url: DocumentosMedicosViewController.path!))
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "detalleDocumentoMedico"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
