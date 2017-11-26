<%-- 
    Document   : cadastroVeiculo
    Created on : 18/11/2017, 20:52:35
    Author     : EDSON
--%>


<!DOCTYPE html>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html lang="pt">
    <head>
        <!-- Required meta tags -->
        <title>CADASTRO VEICULO</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->

         <%@ include file = "links.jsp" %>   
    </head>
    <body> 

        <%@include file = "navFuncionario.jsp" %>

        <div class="container">

            <h3 style="color:black; margin-top:20px;">  CADASTRO CARRO </h3> 

            <form  id="form" method="POST" action='mainControll?action=salvarVeiculo'  data-toggle="validator" >
              <!----- aqui comeca  a div que pega os dados do veiculo  -----> 
                <div class="form-row"style="margin-top:30px;">        
                    <div class="col-5" style="display: ${1 == 2 ? 'block':'none'}">
                        <input class="form-control"
                            type="text"                                
                            id="example-text-input"
                            name="codigo"
                            value="${VeiculoTO.codigo}"
                         />
                    </div>      
                         
                   <br> <br> 
                    <div class="form-group col-md-6 has-feedback" >
                        <label for="inputState">Marca*</label> <br>
                            <select    class=" form-control"
                                       required="true"
                                       name="codigoMarca"
                                       id="inputState">
                                <option ></option>
                                <option >Selecionar...</option>
                                <c:forEach items="${marcas}" var="marca">
                                    <option value="<c:out value="${marca.codigo}"/>" 
                                                       ${marca.codigo == veiculo.marca.codigo ? 'selected' : ''}>
                                                    <c:out value="${marca.nome}"/>
                                    </option >
                                </c:forEach>
                            </select>
                    </div>
                    <div class="form-group col-md-6 has-feedback">
                        <label for="inputState">Modelo*</label> <br>
                        <select  class="form-control"
                                 required="true"
                                 name="codigoModelo"
                                 id="inputState" >
                            <option ></option>
                            <option >Selecionar...</option>
                            <c:forEach items="${modelos}" var="modelo">
                                <option value="<c:out value="${modelo.codigo}"/>" 
                                                   ${modelo.codigo == veiculo.modelo.codigo ? 'selected' : ''}>
                                                <c:out value="${modelo.nome}"/>
                                </option >
                            </c:forEach>
                        </select> 
                    </div>
                    <div class="form-group col-md-6 has-feedback">
                        <label  for="inputZip">Categoria*</label> <br>
                        <select  class="form-control" 
                                 required="true"
                                 name="codigoCategoria" 
                                 id="inputState" > 
                            <option ></option>
                            <option >Selecionar...</option>
                            <c:forEach items="${categorias}" var="categoria">                              
                                <option value="<c:out value="${categoria.codigo}"/>" 
                                                            ${categoria.codigo == veiculo.categoria.codigo ? 'selected' : ''}>
                                               <c:out value="${categoria.nome}"/>
                                </option >
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3 has-feedback">
                            <label for="inputAnoFabricacao">Ano*</label>
                            <input class="form-control"
                                   type="number"
                                   id="anofabricacao" 
                                   placeholder="0000"
                                   required="true"
                                   name="anoFabricacao"
                                   value="<c:out value="${veiculo.anoFabricacao}" />"
                            />
                        </div>
                        <div class="form-group col-md-3 has-feedback">
                            <label for="inpuPlaca">Placa*</label>
                            <input  class="form-control" 
                                   id="placa"
                                   type="text" 
                                   placeholder="ABC 1234"
                                   required="true"  
                                   name="placa"
                                   value="<c:out value="${veiculo.placa}" />"
                           />
                        </div>  

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-5 has-feedback">
                            <label for="inputCity">Chassi*</label>
                            <input  class="form-control"
                                    type="text"
                                    id="inputCity"
                                    required="true" 
                                    name="chassi"
                                    value="<c:out value="${VeiculoTO.chassi}" />" 
                           />
                        </div>
                        <div class="form-group col-md-4 has-feedback">
                            <label for="inputCity">Valor franquia*</label>
                            <input type="text"
                                   class="form-control" 
                                   id="inputCity"
                                   placeholder="R$0,00"
                                   required="true"  
                                   name="valorFranquia"
                                   value="<c:out value="${veiculo.valor}" />" 
                            />
                        </div> 
                        <c:if test="${veiculo.status eq null}">
                            <div class=" form-group col-md-3 has-feedback ">
                                <label for="inputCity">Status*</label>
                                <br>
                                <label class="form-check-label" >
                                    <input class="form-check-input" 
                                           type="radio" 
                                           name="status"
                                           required=""
                                           value="<c:out value="a" />"
                                    /> Ativo
                                </label>
                                <label class="form-check-label" style="margin-left:50px">
                                    <input class="form-check-input" 
                                           type="radio" 
                                           style="margin-top:25px; margin-left:15px;"
                                           name="status" 
                                           value="<c:out value="d" />"
                                    /> Inativo
                                </label>
                            </div>  

                        </c:if>
                        <c:if test="${veiculo.status eq false}">
                            <div class=" form-group col-md-3 has-feedback ">
                                <label for="inputCity">Status*</label>
                                <br>
                                <label class="form-check-label" >
                                    <input class="form-check-input" 
                                           type="radio" 
                                           required="" 
                                           name="status" 
                                           value="<c:out value="a" />"
                                    /> Ativo
                                </label>
                                <label class="form-check-label" style="margin-left:50px">
                                    <input class="form-check-input" 
                                           type="radio" style="margin-top:25px; margin-left:15px;"
                                           name="status" 
                                           checked="true" 
                                           value="<c:out value="d" />"
                                    /> Inativo
                                </label>
                            </div>     
                        </c:if>
                        <c:if test="${veiculoTO.status eq true }">
                            <div class=" form-group col-md-3 has-feedback ">
                                <label for="inputCity">Status*</label>
                                <br>
                                <label class="form-check-label" >
                                    <input class="form-check-input"
                                           type="radio" 
                                           required=""  
                                           name="status"  
                                           checked="true"  
                                           value="<c:out value="a" />"
                                    /> Ativo
                                </label>
                                <label class="form-check-label" style="margin-left:50px">
                                    <input class="form-check-input"
                                           type="radio" 
                                           style="margin-top:25px; margin-left:15px;"
                                           name="status"
                                           value="<c:out value="d" />"
                                    /> Inativo
                                </label>
                            </div>   
                        </c:if>    
                    </div>

                </div>
              <!----- aqui acaba a div que pega os dados do veiculo  ----->
              
              <!----- aqui comeca  a div que pega os dados da caracteristica do veiculo  ----->

                <div class="form-row" style="margin-top:30px;">
                    <br>  
                    <div class="form-group col-md-12 has-feedback">
                        <label  class=" " for="inputCity" style="font-weight: bold;"  >Características</label>
                        <br> <br> 
                    </div>
                    <div class="form-group col-md-2 has-feedback">
                        <label for="inputState">Motor*</label> <br>
                        <select  required="true" 
                                 name="Pmotor"
                                 id="inputState" 
                                 class=" form-control">
                            <option ></option>
                            <option >Selecionar...</option>
                            <option>1.0</option>
                            <option>1.4</option>
                            <option>1.6</option>
                            <option>1.8</option>
                            <option>2.0</option>
                        </select>
                    </div>
                    <div class="form-group col-md-2 has-feedback">
                        <label for="inputState">Portas*</label> <br>
                        <select  required="true" 
                                 name="Nporta" 
                                 id="inputState" 
                                 class="form-control">
                            <option ></option>
                            <option >Selecionar...</option>
                            <option>2</option>
                            <option>4</option>
                        </select> 
                    </div>
                    <div class="form-group col-md-2 has-feedback">
                        <label  for="inputZip">Passageiros*</label> <br>
                        <select  required="true"
                                 name="Npassageiro" 
                                 id="inputState" 
                                 class="form-control">
                            <option ></option>
                            <option >Selecionar...</option>
                            <option>Até 4</option>
                            <option>Mais que 4</option>
                        </select>
                    </div>
                         

                    <c:choose>
                        <c:when test="${empty caracteristicaTO.codigo}">                               
                            <div class="form-group col-md-2 "><br>
                                <label class="form-check-label">
                                    <input name="checkFreio" 
                                           class="form-check-input"
                                           type="checkbox" 
                                           style="margin-top:20px; margin-left:0px;"
                                    /> Freio ABS
                                </label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input  checked="true" 
                                            name="checkFreio" 
                                            class="form-check-input"
                                            type="checkbox" 
                                            style="margin-top:20px; margin-left:0px;"
                                    /> Freio ABS
                                </label>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${empty caracteristica.codigo}">                               
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input name="checkAirbag"
                                           class="form-check-input"
                                           type="checkbox" 
                                           style="margin-top:20px; margin-left:0px;"
                                    /> Airbag
                                </label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input  checked="true"
                                            name="checkAirbab" 
                                            class="form-check-input" 
                                            type="checkbox" 
                                            style="margin-top:20px; margin-left:0px;"
                                    /> Airbag
                                </label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty caracteristica.codigo}">                               
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input name="checkBanco" 
                                           class="form-check-input" 
                                           type="checkbox" 
                                           style="margin-top:20px; margin-left:0px;"
                                    /> Banco de Couro
                                </label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input  checked="true"
                                            name="checkBanco"
                                            class="form-check-input"
                                            type="checkbox" 
                                            style="margin-top:20px; margin-left:0px;"
                                    /> Banco de Couro
                                </label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty caracteristica.codigo}">                               
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input name="checkVidro"
                                           class="form-check-input"
                                           type="checkbox" 
                                           style="margin-top:20px; margin-left:0px;"
                                           /> Vidro Elétrico
                                </label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input  checked="true" 
                                            name="checkVidro" 
                                            class="form-check-input" 
                                            type="checkbox" style="margin-top:20px; margin-left:0px;"
                                    /> Vidro Elétrico
                                </label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty caracteristica.codigo}">                               
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input name="checkDirecao
                                           class="form-check-input" 
                                           type="checkbox" 
                                           style="margin-top:20px; margin-left:0px;"
                                    /> Direção Hidráulica 
                                </label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input  checked="true" 
                                            name="checkDirecao"
                                            class="form-check-input" 
                                            type="checkbox"
                                            style="margin-top:20px; margin-left:0px;"
                                    /> Direção Hidráulica
                                </label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty caracteristica.codigo}">                               
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input name="checkCambio"
                                           class="form-check-input" 
                                           type="checkBox" 
                                           style="margin-top:20px; margin-left:0px;"
                                    /> Câmbio Automático 
                                </label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input  checked="true"
                                            name="checkCambio" 
                                            class="form-check-input" 
                                            type="checkbox" 
                                            style="margin-top:20px; margin-left:0px;"
                                    /> Câmbio Automático 
                                </label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty caracteristica.codigo}">                               
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input name="checkAr" 
                                           class="form-check-input" 
                                           type="checkbox" 
                                           style="margin-top:20px; margin-left:0px;"
                                    />  Ar condicionado 
                                </label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input  checked="true"
                                            name="checkAr" 
                                            class="form-check-input" 
                                            type="checkbox" 
                                            style="margin-top:20px; margin-left:0px;"
                                    />  Ar condicionado 
                                </label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty caracteristica.codigo}">                               
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input name="checkSom" 
                                           class="form-check-input" 
                                           type="checkbox" 
                                           style="margin-top:20px; margin-left:0px;"
                                    /> Som  
                                </label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input  checked="true" 
                                            name="checkSom" 
                                            class="form-check-input"
                                            type="checkbox" 
                                            style="margin-top:20px; margin-left:0px;"
                                    /> Som  
                                </label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty caracteristica.codigo}">                               
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input name="checkTrava" 
                                           class="form-check-input"
                                           type="checkbox" 
                                           style="margin-top:20px; margin-left:0px;"
                                    /> Trava elétrica
                                </label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group col-md-2"><br>
                                <label class="form-check-label">
                                    <input  checked="true" 
                                            name="checkTrava"
                                            class="form-check-input" 
                                            type="checkbox" 
                                            style="margin-top:20px; margin-left:0px;"
                                    /> Trava elétrica
                                </label>
                            </div>
                        </c:otherwise>
                    </c:choose>                  
                </div>
   <!----- aqui acaba  a div que pega os dados da caracteristica do veiculo  -----> 
                <div class="form-row col-md-12" >
                    <label for="inputAddress2">* Ítens obrigatórios</label>
                </div> 
                <div class="form-group col-md-4">
                    <button type="submit" class="btn btn-success " style="margin-top:20px;">SALVAR</button>
                </div>
            </form>
        </div>
        <script>
        
$(document).ready(function() {
   
    $('#form').bootstrapValidator({
       
        fields: {
            cpf: {
                validators: {
                    callback: {
                        message: 'Preencha Corretamente '
                      
                   }
                }
           }
        }
    });
});
</script>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    </body>
</html>