/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.command;

import com.br.TO.EntidadeApoioTO.ModeloTO;
import com.br.constate.ConstanteCadastro;
import com.br.constate.ConstanteView;
import com.br.dao.ModeloPO;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author EDSON
 */
public class ListaModeloCommand implements Command {

    @Override
    public String execute(HttpServletRequest request) {
        
        
           ModeloTO modelo = new ModeloTO();      
           ModeloPO dao = new ModeloPO();
           String acao = request.getParameter(ConstanteCadastro.ACAO);
           String PAGINA = ConstanteView.PGLISTAMODELOS; 
           String codigo = (request.getParameter(ConstanteCadastro.CODIGO));
           
        if (acao.equalsIgnoreCase("RemoveModelo")) {
            dao.remove(Long.parseLong(codigo));

        }
        else if (acao.equalsIgnoreCase("EditarModelo")) {
            
            modelo.setCodigo(Long.parseLong(codigo));
            Iterator modelos = dao.list(modelo).iterator();
            request.setAttribute("modeloTO", modelos.next());
            PAGINA =   ConstanteView.CADASTRO_MODELO;
        }        
        
       request.setAttribute("modelos", new ModeloPO().list(new ModeloTO()).iterator());
       
       return  PAGINA;
    }
    
}
