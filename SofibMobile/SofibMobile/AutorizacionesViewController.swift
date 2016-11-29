//
//  AutorizacionesViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/5/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class AutorizacionesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    
    let jsonAutorizaciones: NSArray = OpcionesSecundariasViewController.jsonAutorizaciones!
    //let autorizaciones = ["Solicitud de ampliación de estadía generada por un informe médico",
      //                    "Procedimiento:MEDICAMENTOS COADYUVANTES PARA CANCER (SOLO OROPLUS)        Procedimiento en Idioma Extranjero:sdas asd<br/> Costo Total: $0.00<br/> Moneda Extranjera: $0.00<br/>"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonAutorizaciones.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AutorizacionesViewCell
        
        if let resultadoConsulta = self.jsonAutorizaciones[indexPath.row] as? Dictionary<String, Any>{
            cell.lblAutorizaciones.text = resultadoConsulta["solicitudDescripcion"] as! String?;
        }
        
        return cell
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
