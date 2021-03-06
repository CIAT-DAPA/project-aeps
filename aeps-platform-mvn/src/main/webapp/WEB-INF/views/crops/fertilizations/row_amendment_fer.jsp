<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String valAmen = String.valueOf(request.getAttribute("numRows")); %>
<% int numRowsAmen = Integer.parseInt(valAmen); %>
<% if (numRowsAmen == 0) { %>
<% numRowsAmen = Integer.parseInt(String.valueOf(request.getParameter("numRows"))); %>
<% } %>
<% request.setAttribute("formAmen", "amenFert[" + (numRowsAmen - 1) + "]"); %>
<% request.setAttribute("formAmenId", "formCropFer_amenFert_" + (numRowsAmen - 1)); %>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% String coCodeAmend = (String) session.getAttribute(APConstants.COUNTRY_CODE);%>
<tr value="<%= numRowsAmen%>" id="RowAdditAme_<%= numRowsAmen%>">
    <td>
        <div id="divEnmiendasFer_<%= numRowsAmen%>" value="<%= numRowsAmen%>">
            <div class="row">
                <div class="col-md-6">
                    <s:hidden name="%{#attr.formAmen}.idAmeFer"/>
                    <div class="form-group">
                        <label for="${formAmenId}__amendmentsFertilizers_idAmeFer" class="col-md-6 req">
                            <s:property value="getText('select.amendfertilizer.fertilization')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="%{#attr.formAmen}.amendmentsFertilizers.idAmeFer"
                                value="%{#attr.amendmentsFertilizers.idAmeFer}"
                                cssClass="form-control"
                                list="type_prod_ame" 
                                listKey="idAmeFer" 
                                listValue="nameAmeFer"            
                                headerKey="-1" 
                                headerValue="---"
                                onchange="showOtherElement(this.value, 'divNewProAme')"
                                />
                        </div>                         
                    </div>                          
                </div> 
                <% String classCostAme = "hideInfo"; %>
                <s:set name="costAme" value="costCrop"/>
                <s:if test="%{#costAme==1}">
                    <% classCostAme = "";%>
                </s:if>
                <div   class="col-md-6 <%= classCostAme%>">
                    <div class="form-group">
                        <s:label for="formRowChemical_fer" cssClass="control-label " value="%{getText('select.chemfertilizer.formapp')}:"></s:label>
                            <div class="controls">
                            <s:select
                                id="%{#attr.formAmeId}__costFormAppAmeFer"
                                name="%{#attr.formAmen}.costFormAppAmeFer"
                                cssClass="form-control"
                                value="%{#attr.costFormAppAmeFer}"             
                                list="#{'0':'---','1':'Manual', '2':'Mecánica','3':'Aérea'}"         
                                headerKey="-1" 
                                />
                        </div>
                    </div> 
                </div>
            </div> 
            <% String classNewProAme = "hideInfo"; %>
            <s:set name="idCheAme" value="%{#attr.amendmentsFertilizers.idAmeFer}"/>
            <s:if test="%{#idCheAme==1000000}">
                <% classNewProAme = "";%>
            </s:if> 
            <div class="<%= classNewProAme%>" id="divNewProAme">
                <div class="row">


                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="${formAmenId}__otherProductAmeFer" class="col-md-6 req">
                                <s:property value="getText('text.otherproductamend.fertilization')" />:
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield cssClass="form-control" name="%{#attr.formAmen}.otherProductAmeFer" value="%{#attr.otherProductAmeFer}"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                                        
            <div class="row"> 
                <div class="<%= classCostAme%>"> 
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="${formAmenId}__costAppAmeFer" class="col-md-6">
                                <s:property value="getText('text.costapp.fertilization')" />
                                <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield cssClass="form-control" name="%{#attr.formAmen}.costAppAmeFer" id="%{#attr.formAmeId}__costAppAmeFer" value="%{#attr.costAppAmeFer}" maxlength="14"/>
                            </div>                         
                        </div>                          
                    </div>
                </div>        
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="${formAmenId}__amountProductUsedAmeFer" class="col-md-6 req">
                            <s:property value="getText('text.amountproductamend.fertilization')" /> 
                            <% if (coCodeAmend.equals("CO")) { %>
                            <button type="button" class="btn btn-initial"><b>(kg/ha)</b></button>:
                            <% } else if (coCodeAmend.equals("NI")) { %>
                            <button type="button" class="btn btn-initial"><b>(q/mz)</b></button>:
                            <% }%>                    
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield cssClass="form-control" name="%{#attr.formAmen}.amountProductUsedAmeFer" value="%{#attr.amountProductUsedAmeFer}" maxlength="14"/>
                        </div>                         
                    </div>                          
                </div>   

            </div>     

            <div class="row">
                <div class="<%= classCostAme%>">  
                    <div class="col-md-6" >
                        <div class="form-group">
                            <label for="${formAmenId}__costProductAmeFer" class="col-md-6">
                                <s:property value="getText('text.costproduct.fertilization')" />
                                <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield name="%{#attr.formAmen}.costProductAmeFer" cssClass="form-control" id="%{#attr.formAmeId}__costProductAmeFer" value="%{#attr.costProductAmeFer}"/>
                            </div>                         
                        </div>                          
                    </div>
                </div>           
                <div class="col-md-1">
                    <a class="btn btn-small btn-default delete_rows_dt" title="<s:property value="getText('link.removeamendfert.fertilization')" />" style="margin-bottom:1.2em" onclick="$('#RowAdditAme_<%= numRowsAmen%>').remove();"><i class="icon-trash"></i></a>
                </div>
            </div>  

            <script>
                var formAmenId = '<%= request.getAttribute("formAmenId")%>';

                $("#" + formAmenId + "__amountProductUsedAmeFer").numeric({negative: false});
                $("#" + formAmenId + "__amountProductUsedAmeFer").val(parsePointSeparated($("#" + formAmenId + "__amountProductUsedAmeFer").val()));

                $("#" + formAmenId + "__costAppAmeFer").maskMoney({prefix: ' $'});
                $("#__costAppAmeFer").maskMoney({prefix: ' $'});

                $("#" + formAmenId + "__costProductAmeFer").maskMoney({prefix: ' $'});
                $("#__costProductAmeFer").maskMoney({prefix: ' $'});
            </script>
        </div>
    </td>
</tr>
