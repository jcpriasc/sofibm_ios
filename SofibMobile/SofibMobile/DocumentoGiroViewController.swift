//
//  DocumentoGiroViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 10/01/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class DocumentoGiroViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(DetalleGiroViewController.path!)
        webView.loadRequest(URLRequest(url: DetalleGiroViewController.path!))
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

}
