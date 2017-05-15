//
//  CargarPickers.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/30/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import Foundation



class CargarPickers{
    
    static var listParams: String = "/SAC/"+PropertiesProject.TOKEN+"";
    static var conveniosJson : NSArray?
    static var estadosJson : NSArray?
    static var ciudadJson : NSArray?
    static var tipoRegistrosJson : NSArray?
    static var tipoServiciosJson : NSArray?
    static var serviciosJson : NSArray?
    
    static var tipoServicio : String = "/0"

    
    static func cargar_pickers(){
        
        cargarEstados();
        cargarCiudades();
        //cargarConvenios();
        cargarTiposRegistros();
        cargarTiposServicios();
        cargarServicios();
        
    }
    
    static func cargarEstados(){
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_estados+listParams)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        CargarPickers.estadosJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    
    static func cargarConvenios(){
        
        var usuario = "0";
        
        if (LoginViewController.usuarioSesion.tipoUsuario == Constantes.usuarioTipoExterno){
            usuario = LoginViewController.usuarioSesion.codigoUsuario
        }

        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_convenios+listParams+"/"+usuario)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        CargarPickers.conveniosJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    
    static func cargarCiudades(){
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_ciudades+listParams)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        CargarPickers.ciudadJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    
    static func cargarTiposRegistros(){
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_tipos_registros+listParams)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        CargarPickers.tipoRegistrosJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }

    
    static func cargarTiposServicios(){

        let uri = PropertiesProject.URL+PropertiesProject.complement_tipos_servicios+listParams+tipoServicio
        
        let url = URL(string: uri)
        
        print(tipoServicio)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        CargarPickers.tipoServiciosJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        print ("ok")
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    static func cargarServicios(){

        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_servicios+listParams)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        CargarPickers.serviciosJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        print ("ok")
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }

}


