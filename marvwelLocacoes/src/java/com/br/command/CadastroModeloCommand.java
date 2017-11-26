/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.command;

import com.br.TO.EntidadeApoioTO.MarcaTO;
import com.br.TO.EntidadeApoioTO.ModeloTO;
import com.br.constate.ConstanteCadastro;
import com.br.constate.ConstanteView;
import com.br.dao.MarcaPO;
import com.br.dao.ModeloPO;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

/**
 *
 * @author EDSON
 */
public class CadastroModeloCommand  implements Command{

  @Override
    public String execute(HttpServletRequest request) {
        
     
       String PAGINA= ConstanteView.CADASTRO_MODELO;
       String acao = request.getParameter(ConstanteCadastro.ACAO);
       String codigo =request.getParameter(ConstanteCadastro.CODIGO);  
        
       if(acao.equals("salvarModelo")){
           ModeloTO modelo = new ModeloTO();
           ModeloPO dao  = new ModeloPO(); 
           
           MarcaTO marca = new MarcaTO();
           marca.setCodigo(Long.parseLong(request.getParameter(ConstanteCadastro.CODIGO_MARCA)));
           modelo.setMarca(marca);
           modelo.setNome((String) request.getParameter("nome")); 
           
           new ModeloPO().salvar(modelo);          
           
            if(request.getParameter("codigo").equalsIgnoreCase("")) {               
              
                dao.salvar(modelo);                
            } else {               
                modelo.setCodigo(Long.parseLong(codigo));
                JOptionPane.showMessageDialog(null,"entrou");
                dao.atualizar(modelo);
                 
            }  
            request.setAttribute("modelos", new ModeloPO().list(new ModeloTO()).iterator());  
            PAGINA= ConstanteView.PGLISTAMODELOS;
       }else {
          request.setAttribute("marcas",new MarcaPO().list(new MarcaTO()).iterator());
       }
       return PAGINA;
    }
}
