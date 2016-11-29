//
//  EpicrisisViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/8/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class EpicrisisViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    //let epicrisis = ["epicrisis 1", "epicrisis 2", "epicrisis 3", "epicrisis 4", "epicrisis 5", "epicrisis 6", "epicrisis 7", "epicrisis 9"]
    let jsonEpicrisis: NSArray = OpcionesSecundariasViewController.jsonEpicrisis!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonEpicrisis.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EpicrisisViewCell
        
        if let resultadoConsulta = self.jsonEpicrisis[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNombreArchivo.text = resultadoConsulta["nombreDocumento"] as! String?;
        }
        
        return (cell)
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
