/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.command;

import com.br.TO.VeiculoTO;
import com.br.constate.ConstanteCadastro;
import com.br.constate.ConstanteView;
import com.br.dao.VeiculoPO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

/**
 *
 * @author EDSON
 */
public class CadastroVeiculoCommand implements Command {

    @Override
    public String execute(HttpServletRequest request) {
        
         String next = ConstanteView.CADASTRO_VEICULO;
         String chassi = request.getParameter(ConstanteCadastro.CHASSI);
         if(chassi!=null){
         next = ConstanteView.HOME;
         
         VeiculoTO veiculo = new VeiculoTO();
         veiculo.getCategoria().setCodigo(Integer.parseInt(request.getParameter(ConstanteCadastro.CODIGO_CATEGORIA)));      
         veiculo.getMarca().setCodigo(Integer.parseInt(request.getParameter(ConstanteCadastro.CODIGO_MARCA)));
         veiculo.getModeli().setCodigo(Integer.parseInt(request.getParameter(ConstanteCadastro.CODIGO_MODELO)));
         veiculo.setChassi(request.getParameter(ConstanteCadastro.CHASSI));
         veiculo.setPlaca(request.getParameter(ConstanteCadastro.PLACA));
         veiculo.setValorFraquia(Double.parseDouble(request.getParameter(ConstanteCadastro.VALOR_FRANQUIA)));
         veiculo.setAnoFabricação(Integer.parseInt(request.getParameter(ConstanteCadastro.ANO_FABRICACAO)));
         boolean stats ;
         String status = request.getParameter(ConstanteCadastro.STATUS);          
            if(status.equals("a")){
               stats = true;
            }
            else{
               stats = false;
            }
         veiculo.setStatus(stats);        
           
        VeiculoPO dao = new VeiculoPO();
        if (!request.getParameter("codigoMarca").equals("")) {
            dao.salvar(veiculo);
             
        } else {
            dao.atualizar(veiculo);
             
        } 
         }
        return next;
    }
    
    
}
