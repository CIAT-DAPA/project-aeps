<%@page import="java.util.HashMap"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <s:actionerror theme="bootstrap"/>
        <s:actionmessage theme="bootstrap"/>
        <s:fielderror theme="bootstrap"/>
        <div class="row-fluid alert fade in">
            <strong>Recuerde que en Colombia:</strong>
            <br /><p></p> 
            <p>Las latitudes en decimales se encuentran entre -4.3 y 13.5</p>
            <p>Las longitudes en decimales se encuentran entre -81.8 y -66</p>
            <p>Las latitudes en grados se encuentran entre -5 y 14</p>
            <p>Las longitudes en grados se encuentran entre -82 y -66</p>
            <p>Las altitudes se encuentran entre 0 y 9000 (metros)</p>
            <p>El area se encuentran entre 0 y 3000 (hectarea)</p>
        </div>
        <div class="row-fluid" id="divRastaForm">
            <s:form id="formRasta" action="saveSoil" cssClass="form-horizontal">
                <fieldset>         
                    <legend>Caracteristicas y Observaciones</legend>
                    <s:hidden name="rasta.idRas"/>    
                    <div class="control-group">
                        <s:label for="formRasta_rasta_fechaRas" cssClass="control-label req" value="Seleccione el lote al cual pertenece:"></s:label>
                        <div class="controls">
                            <s:hidden name="idField"/>
                            <s:textfield
                                name="nameField"         
                                tooltip="Seleccione un lote con la lupa a la derecha"                        
                                />
                            <img src="/aeps-plataforma-mvn/img/search_icon.gif" style="cursor: pointer" alt="Seleccione el lote" onclick="listInfo('/aeps-plataforma-mvn/viewField.action?selected=rasta', 'formRasta_nameField', 'formRasta_idField', 'divListRastaForm', 'divRastaForm')" />
                        </div>  
                    </div>  
                    <div class="control-group">
                        <s:label for="formRasta_rasta_fechaRas" cssClass="control-label req" value="Fecha:"></s:label>
                        <div class="controls">
                            <s:date name="rasta.fechaRas" format="dd/MM/yyyy" var="dateTransform"/>
                            <s:textfield cssClass="form-control" name="rasta.fechaRas" value="%{#dateTransform}"/>
                            <span class="prefix sec">&nbsp;[dd/mm/yyyy]</span>
                        </div>
                    </div>    
                    <div class="control-group">
                        <s:label for="formRasta_rasta_latitudRas" cssClass="control-label req" value="Latitud del rasta (decimales):"></s:label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" name="rasta.latitudRas" onkeyup="generateDegrees('formRasta_rasta_latitudRas', 'formRasta_rasta_latitude_degrees', 'formRasta_rasta_latitude_minutes', 'formRasta_rasta_latitude_seconds')"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_latitude_degrees" cssClass="control-label req" value="Latitud del rasta (grados):"></s:label>
                        <div class="controls">
                            <div class="row-fluid">
                                <div class="span2 input-prepend controls" style="width: 100px;">
                                    <span class="add-on">Grados</span>
                                    <input type="text" name="latitude_degrees" onkeyup="generateDecimals('formRasta_rasta_latitudRas', 'formRasta_rasta_latitude_degrees', 'formRasta_rasta_latitude_minutes', 'formRasta_rasta_latitude_seconds')" id="formRasta_rasta_latitude_degrees" style="padding: 8px; max-width:30px; max-height: 12px"/>
                                </div>
                                <div class="span2 input-prepend controls" style="width: 100px; margin-left: 2%">
                                    <span class="add-on">Minutos</span>
                                    <input type="text" name="latitude_minutes" onkeyup="generateDecimals('formRasta_rasta_latitudRas', 'formRasta_rasta_latitude_degrees', 'formRasta_rasta_latitude_minutes', 'formRasta_rasta_latitude_seconds')" id="formRasta_rasta_latitude_minutes" style="padding: 8px; max-width:30px; max-height: 12px"/>
                                </div>
                                <div class="span2 input-prepend controls" style="width: 100px; margin-left: 2.2%">
                                    <span class="add-on">Segundos</span>
                                    <input type="text" name="latitude_seconds" onkeyup="generateDecimals('formRasta_rasta_latitudRas', 'formRasta_rasta_latitude_degrees', 'formRasta_rasta_latitude_minutes', 'formRasta_rasta_latitude_seconds')" id="formRasta_rasta_latitude_seconds" style="padding: 8px; max-width:30px; max-height: 12px"/>
                                </div>
                            </div>
                        </div>
                    </div>                            
                    <div class="control-group">
                        <s:label for="formRasta_rasta_longitudRas" cssClass="control-label req" value="Longitud del rasta (decimales):"></s:label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" id="formRasta_rasta_longitudRas" name="rasta.longitudRas" onkeyup="generateDegrees('formRasta_rasta_longitudRas', 'formRasta_rasta_length_degrees', 'formRasta_rasta_length_minutes', 'formRasta_rasta_length_seconds')"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_length_degrees" cssClass="control-label req" value="Longitud del rasta (grados):"></s:label>
                            <div class="controls">
                                <div class="row-fluid">
                                    <div class="span2 input-prepend controls" style="width: 100px;">
                                        <span class="add-on">Grados</span>
                                        <input type="text" name="length_degrees" onkeyup="generateDecimals('formRasta_rasta_longitudRas', 'formRasta_rasta_length_degrees', 'formRasta_rasta_length_minutes', 'formRasta_rasta_length_seconds')" id="formRasta_rasta_length_degrees" style="padding: 8px; max-width:30px; max-height: 12px"/>
                                    </div>
                                    <div class="span2 input-prepend controls" style="width: 100px; margin-left: 2%">
                                        <span class="add-on">Minutos</span>
                                        <input type="text" name="length_minutes" onkeyup="generateDecimals('formRasta_rasta_longitudRas', 'formRasta_rasta_length_degrees', 'formRasta_rasta_length_minutes', 'formRasta_rasta_length_seconds')" id="formRasta_rasta_length_minutes" style="padding: 8px; max-width:30px; max-height: 12px"/>
                                    </div>
                                    <div class="span2 input-prepend controls" style="width: 100px; margin-left: 2.2%">
                                        <span class="add-on">Segundos</span>
                                        <input type="text" name="length_seconds" onkeyup="generateDecimals('formRasta_rasta_longitudRas', 'formRasta_rasta_length_degrees', 'formRasta_rasta_length_minutes', 'formRasta_rasta_length_seconds')" id="formRasta_rasta_length_seconds" style="padding: 8px; max-width:30px; max-height: 12px"/>
                                    </div>
                                </div>
                            </div>
                        </div>                             
                        <div class="control-group">
                        <s:label for="formRasta_rasta_altitudRas" cssClass="control-label req" value="Altitud del rasta (metros):"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" id="formRasta_rasta_altitudRas" name="rasta.altitudRas" tooltip="Ingrese la altitud del rasta en metros"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_pendienteTerrenoRas" cssClass="control-label req" value="Pendiente:"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" id="formRasta_rasta_pendienteTerrenoRas" name="rasta.pendienteTerrenoRas" tooltip="Ingrese la pendiente del rasta"/>
                        </div>
                    </div>
                    <div class="form-group control-group">
                        <s:label for="formRasta_rasta_terrenoCircundanteRas" cssClass="control-label req" value="Terreno circundante:"></s:label>
                        <div class="controls">
                            <s:select
                                name="rasta.terrenoCircundanteRas"
                                list="{'plano o llano', 'ondulado', 'montañoso', 'ondulado y montañoso'}"           
                                headerKey="-1" 
                                headerValue="---" />
                        </div>   
                    </div>
                    <div class="form-group control-group">
                        <s:label for="formRasta_rasta_posicionPerfilRas" cssClass="control-label req" value="Posición del perfil:"></s:label>
                        <div class="controls">
                            <s:select
                                name="rasta.posicionPerfilRas"
                                list="{'meseta', 'cima', 'ladera convexa', 'ladera cóncava', 'ladera plana', 'plano', 'plano con ondulaciones', 'pie de una elevación'}"           
                                headerKey="-1" 
                                headerValue="---" />
                        </div>   
                    </div>
                    <div class="control-group">
                        <%@page import="java.lang.*"%>
                        <%@page import="java.util.List"%>
                        <%@page import="java.util.ArrayList"%>
                        <% String actionOpt = String.valueOf(request.getAttribute("actExe"));%>
                        <table class="table table-condensed" style="width: auto;">
                            <thead>
                                <tr>
                                    <th colspan="1" rowspan="1" style="width:80px;padding:3px;text-align: center;">Capas y horizontes</th>
                                    <th colspan="1" rowspan="1" style="width:128px;padding-left:0;text-align: center;">Espesor</th>
                                    <th colspan="1" rowspan="1" style="width:60px;padding-left:0;text-align: center;">Color seco</th>
                                    <th colspan="1" rowspan="1" style="width:60px;padding-left:0;text-align: center;">Color humedo</th>
                                    <th colspan="1" rowspan="1" style="width:175px;padding-left:0;text-align: center;">Textura</th>
                                    <th colspan="1" rowspan="1" style="width:250px;padding-left:0;text-align: center;">Resistencia al rompimiento</th>
                                </tr>
                            </thead>
                            <tbody id="tableAdit">
                                <% if (actionOpt.equals("create")) {%>
<!--                                    <tr value="1">
                                    </tr>-->
                                    <tr value="1" id="RowAddit_1">
                                        <td style="padding: 3px 0.5em;">
                                            <div class="">
                                                <div class="">
                                                    <s:textfield cssClass="form-control write_tiny" name="additionalsAtrib[0].numeroHorizonteHorRas"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="padding: 3px 0.5em 0px 30px;">
                                            <div class="">
                                                <div class="">
                                                    <s:textfield cssClass="form-control write_tiny" name="additionalsAtrib[0].espesorHorRas"/> cm
                                                </div>
                                            </div>
                                        </td>
                                        <td style="padding: 3px 0.5em;">
                                            <div class="">
                                                <div class="">
                                                    <s:textfield cssClass="form-control write_tiny" name="additionalsAtrib[0].colorSecoHorRas"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="padding: 3px 0.5em;">
                                            <div class="">
                                                <div class="">
                                                    <s:textfield cssClass="form-control write_tiny" name="additionalsAtrib[0].colorHumedoHorRas"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="padding: 3px 0.5em;">
                                            <div class="">
                                                <div class="">
                                                    <s:select
                                                        cssClass="select"
                                                        name="additionalsAtrib[0].textures.idTex"
                                                        list="#{'1':'Arenoso (A)', '2':'Limoso (L)', '3':'Franco Limoso (FL)', '4':'Franco (F)', '5':'Franco Arenoso (FA)', '6':'Areno Franco (AF)', '7':'Franco Arcilloso (FAr)', '8':'Arcillo Arenoso (ArA)', '9':'Arcillo Limoso (ArL)', '10':'Arcilloso (Ar)'}"           
                                                        headerKey="-1" 
                                                        headerValue="---" />
                                                </div>
                                            </div>
                                        </td>
                                        <td style="padding: 3px 0.5em;">
                                            <div class="">
                                                <div class="">
                                                    <s:select
                                                        cssClass="select"
                                                        name="additionalsAtrib[0].resistenciasRompimiento.idResRom"
                                                        list="#{'1':'Friable', '2':'Firme', '3':'Extremadamente firme', '4':'Blando', '5':'Duro', '6':'Extremadamente duro', '7':'Plástico', '8':'Muy plástico'}"           
                                                        headerKey="-1" 
                                                        headerValue="---" />
                                                </div>
                                            </div>
                                        </td>
                                        <td style="vertical-align: bottom ! important; padding: 0 0.5em;">
                                            <a class="btn btn-small delete_rows_dt" title="Quitar" style="margin-bottom:1.2em" onclick="$('#RowAddit_2').remove();"><i class="icon-trash"></i></a>
                                        </td>
                                    </tr>
                                    <script>
                                        //For Horizontes					
                                        $("#formRasta_additionalsAtrib_0__numeroHorizonteHorRas").numeric({ decimal: false, negative: false });
                                        $("#formRasta_additionalsAtrib_0__espesorHorRas").numeric({ negative: false });
                                        $("#formRasta_additionalsAtrib_0__espesorHorRas").val(parsePointSeparated($("#formRasta_additionalsAtrib_0__espesorHorRas").val()));
                                        $("#formRasta_additionalsAtrib_0__colorSecoHorRas").numeric({ decimal: false, negative: false });
                                        $("#formRasta_additionalsAtrib_0__colorHumedoHorRas").numeric({ decimal: false, negative: false });
                                    </script>
                                <% } else { %>
                                    <% //if(!request.getAttribute("additionalsAtrib").equals(null)) { %>
                                    <%--<s:if test="%{#additionalsAtrib.size()>0}">--%>
                                        <s:iterator value="additionalsAtrib" var="horizon" status="estatus">
                                            <s:include value="row_additional_horizon.jsp">
                                                <s:param name="numRows" value="#estatus.index+1" />
                                                <s:param name="actionOpt" value="{request.actExe}" />
                                            </s:include>
                                        </s:iterator>
                                    <% //} else { %>
                                    <%--</s:if>--%>
                                    <%--<s:else>--%>
<!--                                        <tr value="1">
                                        </tr>-->
                                    <% //} %>    
                                    <%--</s:else>--%>
                                <% }%>
                            </tbody>
                        </table>
                        <button type="button" class="btn btn-default" onclick="showRowAdditionalItem('../soil/showRowAdditional?action=<%=actionOpt%>', 'tableAdit')">Agregar</button>
                    </div> 
                    <div class="control-group">
                        <s:label for="formRasta_rasta_phRas" cssClass="control-label req" value="pH:"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" name="rasta.phRas" tooltip="Ingrese el pH del rasta"/>
                        </div>
                    </div>
                    <div class="form-group control-group">
                        <s:label for="formRasta_rasta_carbonatosRas" cssClass="control-label req" value="Carbonatos:"></s:label>
                            <div class="controls">
                                <s:select
                                    name="rasta.carbonatosRas"
                                    list="{'no tiene', 'bajos a muy bajos', 'medios', 'altos'}"           
                                    headerKey="-1" 
                                    headerValue="---" />
                            </div>   
                        </div>
                        <div class="control-group">
                            <s:label for="formRasta_rasta_profundidadCarbonatosRas" cssClass="control-label" value="Profundidad Carbonatos:"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" name="rasta.profundidadCarbonatosRas" tooltip="Ingrese la profundidad de los carbonatos"/>&nbsp;cm
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Pedregosidad</legend>
                    <div class="row-fluid">
                        <div class="span8 control-group">
                            <s:label for="formRasta_rasta_rocasSuperficieRas" cssClass="control-label" value="Pedregosidad superficial:"></s:label>
                            <!--</div>-->
                            <!--<div class="span4 control-group">-->
                            <div class="controls">
                                <s:select
                                    name="rasta.rocasSuperficieRas"
                                    list="{'sin rocas', 'rocoso', 'muy rocoso'}"           
                                    headerKey="-1" 
                                    headerValue="---" />
                            <!--</div>-->
                        <!--</div>-->
                        <!--<div class="span4 control-group">-->
                            <!--<div class="controls">-->
                                <s:select
                                    name="rasta.piedrasSuperficieRas"
                                    list="{'sin piedras', 'pedregoso', 'muy pedregoso'}"           
                                    headerKey="-1" 
                                    headerValue="---" />
                            </div>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span8 control-group">
                            <s:label for="formRasta_rasta_rocasPerfilRas" cssClass="control-label" value="Pedregosidad en el Perfil:"></s:label>
                            <div class="controls">
                                <s:select
                                    name="rasta.rocasPerfilRas"
                                    list="{'sin rocas', 'rocoso', 'muy rocoso'}"           
                                    headerKey="-1" 
                                    headerValue="---" />
                                <s:select
                                    name="rasta.piedrasPerfilRas"
                                    list="{'sin piedras', 'pedregoso', 'muy pedregoso'}"           
                                    headerKey="-1" 
                                    headerValue="---" />
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_horizontePedrogosoRocosoRas" cssClass="control-label" value="Horizonte pedregoso o rocoso:"></s:label>
                        <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.horizontePedrogosoRocosoRas" value="false" />
                        </div>
                    </div> 
                    <div class="control-group">
                        <s:label for="formRasta_rasta_profundidadHorizontePedregosoRas" cssClass="control-label" value="Profundidad de horizonte pedregoso o rocoso:"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" name="rasta.profundidadHorizontePedregosoRas" tooltip="Ingrese la profundidad del horizonte pedregoso o rocoso"/>&nbsp;cm
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_espesorHorizontePedregosoRas" cssClass="control-label" value="Espesor de horizonte pedregoso o rocoso:"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" name="rasta.espesorHorizontePedregosoRas" tooltip="Ingrese el espesor del horizonte pedregoso o rocoso"/>&nbsp;cm
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_profundidadPrimerasPiedrasRas" cssClass="control-label" value="Profundidad de primeras rocas o piedras:"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" name="rasta.profundidadPrimerasPiedrasRas" tooltip="Ingrese la profundidad de primeras rocas o piedras"/>&nbsp;cm
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Capas endurecidas</legend>    
                    <div class="control-group">
                        <s:label for="formRasta_rasta_capasEndurecidasRas" cssClass="control-label" value="Capas endurecidas:"></s:label>
                            <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.capasEndurecidasRas" value="false" />
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_prufundidadCapasRas" cssClass="control-label" value="Profundidad de capas endurecidas:"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" name="rasta.prufundidadCapasRas" tooltip="Ingrese la profundidad de capas endurecidas"/>&nbsp;cm
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_espesorCapaEndurecidaRas" cssClass="control-label" value="Espesor de capas endurecidas:"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" name="rasta.espesorCapaEndurecidaRas" tooltip="Ingrese el espesor de capas endurecidas"/>&nbsp;cm
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Suelo Moteado</legend>    
                    <div class="control-group">
                        <s:label for="formRasta_rasta_moteadosRas" cssClass="control-label" value="Moteados:"></s:label>
                            <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.moteadosRas" value="false" />
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_profundidadMoteadosRas" cssClass="control-label" value="Profundidad de moteados:"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" name="rasta.profundidadMoteadosRas" tooltip="Ingrese la profundidad de moteados"/>&nbsp;cm
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_moteadosMas70cmRas" cssClass="control-label" value="Moteados mas bajo de 70cm:"></s:label>
                            <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.moteadosMas70cmRas" value="false" />
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Estructura del suelo</legend>    
                    <div class="form-group control-group">
                        <s:label for="formRasta_rasta_estructuraRas" cssClass="control-label req" value="Estructura del suelo:"></s:label>
                        <div class="controls">
                            <s:select
                                name="rasta.estructuraRas"
                                list="{'granular', 'aterronada', 'prismática', 'columnar', 'laminar', 'suelta o polvosa', 'masiva'}"           
                                headerKey="-1" 
                                headerValue="---" />
                        </div>   
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_erosionRas" cssClass="control-label" value="Erosion:"></s:label>
                        <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.erosionRas" value="false" />
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_mohoRas" cssClass="control-label" value="Moho:"></s:label>
                        <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.mohoRas" value="false" />
                        </div>
                    </div>
                    <div class="form-group control-group">
                        <s:label for="formRasta_rasta_costrasDurasRas" cssClass="control-label req" value="Costras duras:"></s:label>
                        <div class="controls">
                            <s:select
                                name="rasta.costrasDurasRas"
                                list="{'muy marcadas', 'poco marcadas', 'no hay'}"           
                                headerKey="-1" 
                                headerValue="---" />
                        </div>   
                    </div>
                    <div class="form-group control-group">
                        <s:label for="formRasta_rasta_exposicionSolRas" cssClass="control-label req" value="Sitio expuesto a sol:"></s:label>
                        <div class="controls">
                            <s:select
                                name="rasta.exposicionSolRas"
                                list="{'la mañana y la tarde', 'la mañana', 'la tarde'}"           
                                headerKey="-1" 
                                headerValue="---" />
                        </div>   
                    </div>
                    <div class="form-group control-group">
                        <s:label for="formRasta_rasta_costrasBlancasRas" cssClass="control-label req" value="Costras blancas:"></s:label>
                        <div class="controls">
                            <s:select
                                name="rasta.costrasBlancasRas"
                                list="{'muy marcadas', 'poco marcadas', 'no hay'}"           
                                headerKey="-1" 
                                headerValue="---" />
                        </div>   
                    </div>
                    <div class="form-group control-group">
                        <s:label for="formRasta_rasta_costrasNegrasRas" cssClass="control-label req" value="Costras negras:"></s:label>
                        <div class="controls">
                            <s:select
                                name="rasta.costrasNegrasRas"
                                list="{'muy marcadas', 'poco marcadas', 'no hay'}"           
                                headerKey="-1" 
                                headerValue="---" />
                        </div>   
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_regionSecaRas" cssClass="control-label" value="Region seca:"></s:label>
                        <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.regionSecaRas" value="false" />
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_raicesVivasRas" cssClass="control-label" value="Raices vivas:"></s:label>
                            <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.raicesVivasRas" value="false" />
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_profundidadRaicesRas" cssClass="control-label" value="Profundidad de raices vivas:"></s:label>
                            <div class="controls">
                            <s:textfield cssClass="form-control" name="rasta.profundidadRaicesRas" tooltip="Ingrese la profundidad de raices vivas"/>&nbsp;cm
                        </div>
                    </div>
                    <div class="form-group control-group">
                        <s:label for="formRasta_rasta_plantasPequenasRas" cssClass="control-label req" value="Crecimiento de las plantas afectadas:"></s:label>
                            <div class="controls">
                                <s:select
                                    name="rasta.plantasPequenasRas"
                                    list="{'poco afectadas', 'muy afectadas', 'plantas normales', 'no hay cultivo'}"           
                                    headerKey="-1" 
                                    headerValue="---" />
                            </div>   
                        </div>
                        <div class="control-group">
                            <s:label for="formRasta_rasta_hojarascaRas" cssClass="control-label" value="Mucha hojarasca:"></s:label>
                            <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.hojarascaRas" value="false" />
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_sueloNegroBlandoRas" cssClass="control-label" value="Suelo es muy negro, muy blando:"></s:label>
                            <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.sueloNegroBlandoRas" value="false" />
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_cuchilloPrimerHorizonteRas" cssClass="control-label" value="Cuchillo entra sin ningún esfuerzo:"></s:label>
                            <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.cuchilloPrimerHorizonteRas" value="false" />
                        </div>
                    </div>
                    <div class="control-group">
                        <s:label for="formRasta_rasta_cercaRiosQuebradasRas" cssClass="control-label" value="Cerca de agua subterránea muy superficial:"></s:label>
                            <div class="controls radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="rasta.cercaRiosQuebradasRas" value="false" />
                        </div>
                    </div>
                    <div class="form-group control-group">
                        <s:label for="formRasta_rasta_recubrimientoVegetalRas" cssClass="control-label req" value="Recubrimiento vegetal del suelo:"></s:label>
                            <div class="controls">
                                <s:select
                                    name="rasta.recubrimientoVegetalRas"
                                    list="{'muy bueno', 'bueno', 'regular', 'espaciado', 'sin cobertura'}"           
                                    headerKey="-1" 
                                    headerValue="---" />
                            </div>   
                        </div>
                    </fieldset>
                    <div> 
                    <s:hidden name="page"/>
                    <s:hidden name="actExe"/>    
                    <s:hidden name="newRow" value="1"/>    
                    <sj:submit type="button" cssClass="btn btn-initial btn-large" onclick="addMessageProcess()" targets="divMessage" onCompleteTopics="completeRasta" validate="true" validateFunction="validationForm">Guardar Rasta</sj:submit>
                    <button class="btn btn-large bt_cancel_producer" onclick="resetForm('formRasta'); closeWindow();">Cancelar</button>
                </div>    
            </s:form>        
            <script>
                var page = $("#formRasta_page").val();

                //For Rasta
                $.mask.definitions['i'] = "[-0-9]";
                $.mask.definitions['f'] = "[-.0-9]";
                
//                Date.prototype.format = function(format) //author: meizz
//                {
//                  var o = {
//                    "M+" : this.getMonth()+1, //month
//                    "d+" : this.getDate(),    //day
//                    "h+" : this.getHours(),   //hour
//                    "m+" : this.getMinutes(), //minute
//                    "s+" : this.getSeconds(), //second
//                    "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
//                    "S" : this.getMilliseconds() //millisecond
//                  }
//
//                  if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
//                    (this.getFullYear()+"").substr(4 - RegExp.$1.length));
//                  for(var k in o)if(new RegExp("("+ k +")").test(format))
//                    format = format.replace(RegExp.$1,
//                      RegExp.$1.length==1 ? o[k] :
//                        ("00"+ o[k]).substr((""+ o[k]).length));
//                  return format;
//                }
//                
//                if ($("#formRasta_rasta_fechaRas").val()) {
//                    $("#formRasta_rasta_fechaRas").val(new Date($("#formRasta_rasta_fechaRas").val()).parse($("#formRasta_rasta_fechaRas").val()));
//                }

//                if ($("#formRasta_rasta_fechaRas").val()) {
//                    function dateToDMY(date) {
//                        var d = date.getDate();
//                        var m = date.getMonth() + 1;
//                        var y = date.getFullYear();
//    //                    return '' + y + '-' + (m<=9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d);
//                        return '' + (d <= 9 ? '0' + d : d) + '/' + (m<=9 ? '0' + m : m) + '/' + y;
//                    }
//                    
//                    var str = $("#formRasta_rasta_fechaRas").val();
////                    str = str.split(" ");
////                    alert(str[0])
//                    alert($("#formRasta_rasta_fechaRas").val())
//                    alert(Date.parse($("#formRasta_rasta_fechaRas").val()))
//                    $("#formRasta_rasta_fechaRas").val(dateToDMY(new Date(Date.parse($("#formRasta_rasta_fechaRas").val()))));
//                    alert($("#formRasta_rasta_fechaRas").val())
//                }
                
                $("#formRasta_rasta_fechaRas").datepicker({dateFormat: 'dd/mm/yy'});
                $("#formRasta_rasta_fechaRas").mask("99/99/9999", {placeholder: ""});
                
                $("#formRasta_rasta_latitudRas").numeric();
                $("#formRasta_rasta_latitudRas").val(parsePointSeparated($("#formRasta_rasta_latitudRas").val()));
                
                $("#formRasta_rasta_longitudRas").numeric();
                $("#formRasta_rasta_longitudRas").val(parsePointSeparated($("#formRasta_rasta_longitudRas").val()));
                
                $("#formRasta_rasta_altitudRas").numeric({decimal: false, negative: false});                
                $("#formRasta_rasta_length_degrees").numeric({decimal: false});
                $("#formRasta_rasta_length_minutes").numeric({decimal: false});
                $("#formRasta_rasta_length_seconds").numeric({decimal: false});
                $("#formRasta_rasta_latitude_degrees").numeric({decimal: false});
                $("#formRasta_rasta_latitude_minutes").numeric({decimal: false});
                $("#formRasta_rasta_latitude_seconds").numeric({decimal: false});
                
                $("#formRasta_rasta_pendienteTerrenoRas").numeric({negative: false});
                $("#formRasta_rasta_pendienteTerrenoRas").val(parsePointSeparated($("#formRasta_rasta_pendienteTerrenoRas").val()));
                
                $("#formRasta_rasta_phRas").numeric({negative: false});
                $("#formRasta_rasta_phRas").val(parsePointSeparated($("#formRasta_rasta_phRas").val()));
                
                $("#formRasta_rasta_profundidadCarbonatosRas").numeric({decimal: true, negative: false});
                $("#formRasta_rasta_profundidadCarbonatosRas").val(parsePointSeparated($("#formRasta_rasta_profundidadCarbonatosRas").val()));
                
                $("#formRasta_rasta_profundidadHorizontePedregosoRas").numeric({decimal: true, negative: false});
                $("#formRasta_rasta_profundidadHorizontePedregosoRas").val(parsePointSeparated($("#formRasta_rasta_profundidadHorizontePedregosoRas").val()));
                
                $("#formRasta_rasta_profundidadPrimerasPiedrasRas").numeric({decimal: true, negative: false});
                $("#formRasta_rasta_profundidadPrimerasPiedrasRas").val(parsePointSeparated($("#formRasta_rasta_profundidadPrimerasPiedrasRas").val()));
                
                $("#formRasta_rasta_espesorHorizontePedregosoRas").numeric({decimal: true, negative: false});
                $("#formRasta_rasta_espesorHorizontePedregosoRas").val(parsePointSeparated($("#formRasta_rasta_espesorHorizontePedregosoRas").val()));
                
                $("#formRasta_rasta_espesorCapaEndurecidaRas").numeric({decimal: false, negative: false});
                $("#formRasta_rasta_prufundidadCapasRas").numeric({decimal: true, negative: false});
                $("#formRasta_rasta_prufundidadCapasRas").val(parsePointSeparated($("#formRasta_rasta_prufundidadCapasRas").val()));
                
                $("#formRasta_rasta_profundidadMoteadosRas").numeric({decimal: true, negative: false});
                $("#formRasta_rasta_profundidadMoteadosRas").val(parsePointSeparated($("#formRasta_rasta_profundidadMoteadosRas").val()));
                $("#formRasta_rasta_profundidadRaicesRas").numeric({decimal: true, negative: false});
                $("#formRasta_rasta_profundidadRaicesRas").val(parsePointSeparated($("#formRasta_rasta_profundidadRaicesRas").val()));
                
                $.subscribe('completeRasta', function(event, data) {
                    completeFormGetting('dialog-form', 'formRasta', 'divRasta', event.originalEvent.request.responseText);
                    setTimeout(function() {
                        showInfo("searchSoil.action?page=" + page, "divConListRasta");
                    }, 2000);
                });
            </script>
        </div>
        <div class="row-fluid" id="divListRastaForm"></div>
    </body>
</html>