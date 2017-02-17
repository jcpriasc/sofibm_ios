//
//  SolAprobTabTipoAprobacionViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 1/9/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class SolAprobTabTipoAprobacionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var txtEntidad: UILabel!
    @IBOutlet var txtTipoServicio: UILabel!
    
    @IBOutlet var txtJustificacion: UILabel!
    @IBOutlet var txtJustificacionValor: UILabel!
    
    static var jsonTabTipoAprobacion: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let solicitud = DetalleSolicitudAprobacionViewController.jsonDetalleSolicitudAprobacion as? Dictionary<String, Any>{
            
            SolAprobTabTipoAprobacionViewController.jsonTabTipoAprobacion = solicitud["lstDocumentos"] as? NSArray
            txtEntidad.text = "\(NSLocalizedString("lbl_entidad", comment: "lbl_entidad")) \(": ")\((solicitud["entidad"] as? String ?? ""))"
            txtTipoServicio.text = "\(NSLocalizedString("lbl_tipo", comment: "lbl_tipo")) \(": ")\((solicitud["tipo"] as? String ?? ""))"
            txtJustificacion.text = NSLocalizedString("lbl_justificacion", comment: "lbl_justificacion")
            txtJustificacionValor.text = (solicitud["justificacion"] as? String ?? "")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        if(SolAprobTabTipoAprobacionViewController.jsonTabTipoAprobacion != nil){
            return (SolAprobTabTipoAprobacionViewController.jsonTabTipoAprobacion!.count)
        }else{
            return 0
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SolAprobTipoAprobacionViewCellController
        
        if let solicitud = SolAprobTabTipoAprobacionViewController.jsonTabTipoAprobacion?[indexPath.row] as? Dictionary<String, Any>{
            
            cell.txtNombreArchivo.text = (solicitud["nombreDocumento"] as? String ?? " ");
            
        }
        
        return (cell)
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
