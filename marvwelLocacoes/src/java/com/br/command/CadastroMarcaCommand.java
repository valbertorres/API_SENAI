/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.command;

import com.br.TO.EntidadeApoioTO.MarcaTO;
import com.br.constate.ConstanteCadastro;
import com.br.constate.ConstanteView;
import com.br.dao.MarcaPO;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

/**
 *
 * @author EDSON
 */
public class CadastroMarcaCommand implements Command{

    @Override
    public String execute(HttpServletRequest request) {
        
       String PAGINA = ConstanteView.CADASTRO_MARCA;
       String acao = request.getParameter(ConstanteCadastro.ACAO);
       String codigo = (request.getParameter(ConstanteCadastro.CODIGO));
       
           if(acao.equalsIgnoreCase("salvarMarca")){
           MarcaTO marca = new MarcaTO();
           MarcaPO dao = new MarcaPO();
           marca.setNome((String) request.getParameter("nome")); 
           
           if(request.getParameter("codigo").equalsIgnoreCase("")){
            
            dao.salvar(marca);
           }
           else{
                
                 marca.setCodigo(Long.parseLong(request.getParameter("codigo")));
           dao.atualizar(marca);
           }
                                       
          request.setAttribute("marcas", new MarcaPO().list(new MarcaTO()).iterator());
           PAGINA =  ConstanteView.PGLISTAMARCAS;
        }
         
       return PAGINA;
    }
    
}
