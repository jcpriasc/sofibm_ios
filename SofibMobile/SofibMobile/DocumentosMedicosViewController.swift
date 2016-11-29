//
//  DocumentosMedicosViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/8/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DocumentosMedicosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //let documentosMedicos = ["documentosMedicos 1", "documentosMedicos 2", "documentosMedicos 3", "documentosMedicos 4", "documentosMedicos 5", "documentosMedicos 6", "documentosMedicos 7", "documentosMedicos 9"]
    let jsonDocumentosMedicos: NSArray = OpcionesSecundariasViewController.jsonDocumentosMedicos!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonDocumentosMedicos.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DocumentosMedicosViewCell
        if let resultadoConsulta = self.jsonDocumentosMedicos[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNombre.text = resultadoConsulta["nombreDocumento"] as! String?;
            cell.txtTipoDocumento.text = resultadoConsulta["tipoArchivo"] as! String?;
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
