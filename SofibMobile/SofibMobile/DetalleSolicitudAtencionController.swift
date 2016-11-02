//
//  DetalleSolicitudAtencionController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 2/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleSolicitudAtencionController: UIViewController {

    
    
    @IBOutlet var btnAceptar: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
         btnAceptar.setTitle(NSLocalizedString("aceptar", comment: "aceptar"), for: UIControlState.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
