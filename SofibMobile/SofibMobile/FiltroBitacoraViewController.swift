//
//  FiltroBitacoraViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/10/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FiltroBitacoraViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet var lblBusqueda: UILabel!
    @IBOutlet var txtNombrePaciente: UITextField!
    @IBOutlet var pickerCiudad: UITextField!
    @IBOutlet var pickerTipoRegistro: UITextField!
    @IBOutlet var pickerTipoServicio: UITextField!
    
    var tipoServicio = ["Medicamentos", "Prestador por fuera de la red", "Servicio de Alojamiento", "Servicio de Ambulancia Aérea", "Servicio de Ambulancia Terrestre"]
    var tipoRegistro = ["Devolución", "Solicitud de Atención", "Solicitud No Asistencial", "Giro", "Nota Crédito"]
    var ciudades = ["CALI", "BOGOTA", "CARTAGENA", "MEDELLIN", "PEREIRA"]
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        lblBusqueda.text = NSLocalizedString("lbl_titulo_bitacora", comment: "lbl_titulo_bitacora")
        
        pickerCiudad.placeholder = NSLocalizedString("seleccionar_ciudad", comment: "seleccionar_ciudad")
        pickerTipoRegistro.placeholder = NSLocalizedString("seleccionar_tipo_registro", comment: "seleccionar_tipo_registro")
        pickerTipoServicio.placeholder = NSLocalizedString("seleccionar_tipo_servicio", comment: "seleccionar_tipo_servicio")

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se crea el picker para ciudad
        let ciudadPickerView = UIPickerView()
        ciudadPickerView.delegate = self
        ciudadPickerView.tag = 1
        pickerCiudad.inputView = ciudadPickerView
        //Se crea el picker para tipo registro
        let tipoRegistroPickerView = UIPickerView()
        tipoRegistroPickerView.delegate = self
        tipoRegistroPickerView.tag = 2
        pickerTipoRegistro.inputView = tipoRegistroPickerView
        //Se crea el picker para tipo servicio
        let tipoServicioPickerView = UIPickerView()
        tipoServicioPickerView.delegate = self
        tipoServicioPickerView.tag = 3
        pickerTipoServicio.inputView = tipoServicioPickerView
        

        //Se crea el toolBar para el picker
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.default
        toolBar.tintColor = UIColor.white
        toolBar.barTintColor = UIColor.init(colorLiteralRed: 0.0, green: 0.40000000000000002, blue: 0.70196078429999997, alpha: 1)
        toolBar.isOpaque = true
        toolBar.backgroundColor = UIColor.init(colorLiteralRed: 0.0, green: 0.40000000000000002, blue: 0.70196078429999997, alpha: 1)
        toolBar.isTranslucent = true
        toolBar.alpha = 1
        let defaultButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FiltrosSolicitudAtencionController.tappedToolBarBtn))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(FiltrosSolicitudAtencionController.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        // label.text = ""
        label.textAlignment = NSTextAlignment.center
        
        let textBtn = UIBarButtonItem(customView: label)
        toolBar.setItems([defaultButton,flexSpace,textBtn,flexSpace,doneButton], animated: true)
        
        pickerCiudad.inputAccessoryView = toolBar
        pickerTipoRegistro.inputAccessoryView = toolBar
        pickerTipoServicio.inputAccessoryView = toolBar

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func donePressed(_ sender: UIBarButtonItem) {
        
        pickerCiudad.resignFirstResponder()
        pickerTipoRegistro.resignFirstResponder()
        pickerTipoServicio.resignFirstResponder()
        
    }
    
    func tappedToolBarBtn(_ sender: UIBarButtonItem) {
        
        pickerCiudad.text = ""
        pickerTipoRegistro.text = ""
        pickerTipoServicio.text = ""
        
        pickerCiudad.resignFirstResponder()
        pickerTipoRegistro.resignFirstResponder()
        pickerTipoServicio.resignFirstResponder()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return ciudades.count
        }
        
        if pickerView.tag == 2 {
            return tipoRegistro.count
        }
        
        if pickerView.tag == 3 {
            return tipoServicio.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            return ciudades[row]
        }
        
        if pickerView.tag == 2 {
            return tipoRegistro[row]
        }
        
        if pickerView.tag == 3 {
            return tipoServicio[row]
        }
        
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            pickerCiudad.text = ciudades[row]
        }
        
        if pickerView.tag == 2 {
            pickerTipoRegistro.text = tipoRegistro[row]
        }
        
        if pickerView.tag == 3 {
            pickerTipoServicio.text = tipoServicio[row]
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
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
