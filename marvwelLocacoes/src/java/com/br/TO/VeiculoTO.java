package com.br.TO;

import com.br.TO.EntidadeApoioTO.CategoriaTO;
import com.br.TO.EntidadeApoioTO.MarcaTO;
import com.br.TO.EntidadeApoioTO.ModeloTO;
import java.util.Date;

public  class VeiculoTO {

	private long codigo;
	private String chassi;
	private MarcaTO marca;
	private boolean status;
	private CategoriaTO categoria;
	private ModeloTO modelo;	
	private int  anoFabricação;

   
    public int getAnoFabricação() {
        return anoFabricação;
    }

    public void setAnoFabricação(int anoFabricação) {
        this.anoFabricação = anoFabricação;
    }
	private String placa;
	private double valorFraquia;
	
	
	public VeiculoTO() {
		this.codigo = 0;
		this.chassi = "";
		this.marca = new MarcaTO();
		this.status = false;
		this.categoria = new CategoriaTO();
		this.modelo = new ModeloTO();		
		this.anoFabricação = 0;
		this.placa = "";
		this.valorFraquia = 0;
	}
	public long getCodigo() {
		return codigo;
	}
	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}
	public String getChassi() {
		return chassi;
	}
	public void setChassi(String chassi) {
		this.chassi = chassi;
	}
	public MarcaTO getMarca() {
		return marca;
	}
	public void setMarca(MarcaTO marca) {
		this.marca = marca;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public CategoriaTO getCategoria() {
		return categoria;
	}
	public void setCategoria(CategoriaTO categoria) {
		this.categoria = categoria;
	}
	public ModeloTO getModeli() {
		return modelo;
	}
	public void setModeli(ModeloTO modeli) {
		this.modelo = modeli;
	}
	
	
	public String getPlaca() {
		return placa;
	}
	public void setPlaca(String placa) {
		this.placa = placa;
	}
	public double getValorFraquia() {
		return valorFraquia;
	}
	public void setValorFraquia(double valorFraquia) {
		this.valorFraquia = valorFraquia;
	}

    @Override
    public String toString() {
        return "VeiculoTO{" + "codigo=" + codigo + ", chassi=" + chassi + ", marca=" + marca + ", status=" + status + ", categoria=" + categoria + ", modelo=" + modelo + ", anoFabrica\u00e7\u00e3o=" + anoFabricação + ", placa=" + placa + ", valorFraquia=" + valorFraquia + '}';
    }
	
	
	
}
