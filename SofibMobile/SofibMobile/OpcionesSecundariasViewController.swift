//
//  OpcionesSecundariasViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/4/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class OpcionesSecundariasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    let opciones = [NSLocalizedString("lbl_autorizaciones", comment: "lbl_autorizaciones"),
                    NSLocalizedString("lbl_servicio_asistencial", comment: "lbl_servicio_asistencial"),
                    NSLocalizedString("lbl_informes_medicos", comment: "lbl_informes_medicos"),
                    NSLocalizedString("lbl_documentos_medicos", comment: "lbl_documentos_medicos"),
                    NSLocalizedString("lbl_bitacoras", comment: "lbl_bitacoras"),
                    NSLocalizedString("lbl_epicrisis", comment: "lbl_epicrisis"),
                    NSLocalizedString("lbl_procedimientos_adicionales", comment: "lbl_procedimientos_adicionales"),
                    NSLocalizedString("lbl_funcionarios_externos", comment: "lbl_funcionarios_externos"),
                    NSLocalizedString("lbl_consultar_solicitudes_aprobacion", comment: "lbl_consultar_solicitudes_aprobacion")]
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (opciones.count)
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellOpcion = tableView.dequeueReusableCell(withIdentifier: "cellOpcion", for: indexPath) as! OpcionesSecundariasViewCell
        
        
        cellOpcion.lblOpcion.text = opciones[indexPath.row]
        
        let opcionSeleccionada = indexPath.row
        
        switch opcionSeleccionada {
        case 0:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_autorizaciones")
        case 1:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_servicios_asistenciales")
        case 2:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_informes_medicos")
        case 3:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_documentos_medicos")
        case 4:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_bitacoras")
        case 5:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_epicrisis")
        case 6:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_procedimientos_ad")
        case 7:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_funcionarios")
        default:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_aprobacion")
        }
        
        
        
        return cellOpcion
    }
    
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        switch opcionSeleccionada {
        case 0:
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "autorizacionesView")
            self.show(vc as! UIViewController, sender: vc)
        case 1:
            print("The last letter of the alphabet")
        case 2:
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "informesMedicosView")
            self.show(vc as! UIViewController, sender: vc)
        case 3:
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "documentosMedicosView")
            self.show(vc as! UIViewController, sender: vc)
        case 4:
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "bitacorasView")
            self.show(vc as! UIViewController, sender: vc)
            print("The last letter of the alphabet")
        case 5:
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "epicrisisView")
            self.show(vc as! UIViewController, sender: vc)
        default:
            print("Some other character")
        }
        
        return indexPath
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
