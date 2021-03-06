<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page import="java.lang.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.aepscolombia.platform.util.JavascriptHelper"%>            
<% String table = "display:none;";%>
<% String label = "";%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<% Users userCrop  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% UsersDao usrCropDao = new UsersDao(); %>
<% Integer entTypeCropId = new EntitiesDao().getEntityTypeId(userCrop.getIdUsr()); %>

<s:if test="listCrops.size() > 0">
    <% table = "";%>
    <% label = "display:none;";%> 
</s:if>            
<% int pageNow = (request.getParameter("page") != null) ? Integer.parseInt(String.valueOf(request.getParameter("page"))) : 1;%>
<% int countTotal = Integer.parseInt(String.valueOf(request.getAttribute("countTotal")));%>
<% int maxResults = Integer.parseInt(String.valueOf(request.getAttribute("maxResults")));%>
<% String valId   = String.valueOf(request.getAttribute("valId"));%>
<% String valName = String.valueOf(request.getAttribute("valName"));%>
<% String typeEnt = String.valueOf(request.getAttribute("typeEnt"));%>
<% HashMap add    = (HashMap) request.getAttribute("additionals");%>
<% String value   = (String) add.get("selected");%>
<% String divShow = "";%>
<% String divHide = "";%>
<% divHide = "divConListCrop"; %>    
<%  if (value.equals("soil")) {
        divShow = "divSoilForm";
        divHide = "divListSoilForm";
    } else if (value.equals("cropcheck")) {
        divShow = "divCropForm";
        divHide = "divListCropForm";
    }         
%>

<div class="msgWin" id="messageWin"></div>
<div id="divCrops" class="table-responsive w-box">    
    <% if (usrCropDao.getPrivilegeUser(userCrop.getIdUsr(), "crop/create")) { %>
        <% if (entTypeCropId!=3) { %>
            <% if (value.equals("crop")) {  %>
                <button type="button" class="btn btn-lg btn-register btn-space" onclick="viewForm('/crop/showCrop.action?action=create', 'idCrop', '', '<s:property value="getText('title.addcrop.crop')" />', 1050, 700)">
                    <i class="icon-plus"></i> <s:property value="getText('button.addcrop.crop')" />
                </button><br />
                <div class="btn-group btn-space" onclick="clickSelAll('chkSelectAll', 'chkNumber', 'btnDelCrop');">
                    <button class="btn btn-default" type="button"><input type="checkbox" class="chkSelectAll textFloat" />&nbsp;<s:property value="getText('label.selectall.crop')" /></button>
                </div>
                <button type="button" id="btnDelCrop" disabled="disabled" class="btn btn-initial btn-space btnGetAll disabled" onclick="showDialogDeleteAll(this, 'chkNumber', 'confirm_dialog_crop', '/crop/deleteAllCrop.action', '/crop/searchCrop.action?page=<%=pageNow%>', 'divCrops', '<%=divHide%>');">
                    <i class="icon-trash"></i> <s:property value="getText('button.deletesel.crop')" />
                </button>                
            <% } %>
        <% } %>
    <% } %>
    <table class="table table-bordered table-hover table-condensed" style="<%= table %>" id='tblCrops'>
        <thead>
            <tr>
                <% if (usrCropDao.getPrivilegeUser(userCrop.getIdUsr(), "crop/modify") || (usrCropDao.getPrivilegeUser(userCrop.getIdUsr(), "crop/delete"))) { %>
                    <% if (value == "crop" || value.equals("crop")) {%>
                        <th></th>
                    <% }%>
                <% } %>
                <% if (!value.equals("crop")) {%>
                    <% if (value.equals("soil") || value.equals("cropcheck")) {%>
                        <th></th>
                    <% }%>
                <% }%>        
                <% if (entTypeCropId==3) { %>    
                    <th><s:property value="getText('td.agronomist.crop')" /></th>
                <% } %>
                <th><s:property value="getText('td.infocrop.crop')" /></th>                
                <s:if test="%{typeEnt!=2}">
                    <th><s:property value="getText('td.nameproducer.crop')" /></th>
                </s:if>
                <th><s:property value="getText('td.whichcrop.crop')" /></th>
                <th><s:property value="getText('td.namecrop.crop')" /></th>
                <th>
                    <s:property value="getText('td.datesowing.crop')" />
                    <span>[mm/dd/yyyy]</span>
                </th>
                <th><s:property value="getText('td.namegenotype.crop')" /></th>
                <th>
                    <s:property value="getText('td.datecreated.crop')" />
                    <span>[mm/dd/yyyy]</span>
                </th>
                <% if (usrCropDao.getPrivilegeUser(userCrop.getIdUsr(), "crop/modify") || (usrCropDao.getPrivilegeUser(userCrop.getIdUsr(), "crop/delete"))) { %>
                    <% if (value == "crop" || value.equals("crop")) {%>
                        <th><s:property value="getText('td.action.crop')" /></th>
                    <% }%>
                <% } %>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="listCrops" var="crop">
                <% String action = "";%>
                <% if (value.equals("soil")) {  %>
                    <% action = "selectItem('formSoil_nameCrop', 'formSoil_idCrop', '" + request.getAttribute("nameCrop") + "', '" + request.getAttribute("idCrop") + "','" + divShow + "', '" + divHide + "');"; %>
                <% } %>
                <% if (value.equals("cropcheck")) { %>
                    <% action = "selectItemCropcheck('formCrop_nameCrop', 'formCrop_idCrop', '" + request.getAttribute("nameCrop") + "', '" + request.getAttribute("idCrop") + "');"; %>
                <% } %>
                <tr onclick="<%= action%>" id="trCrop<s:property value="idCrop" />>">
                    <%@ include file="row-crops.jsp" %>                                
                </tr>
            </s:iterator>
        </tbody>
    </table>
    <label style="<%= label%>"><s:property value="getText('label.nofounddata.crop')" /></label>
    <div class="hideInfo">
        <div id="confirm_dialog_crop" class="cbox_content">
            <div class="sepH_c"><s:text name="%{getText('area.deletecrop.crop')}" /></div>
            <div>
                <a href="#" class="btn btn-small btn-initial confirm_yes"><s:property value="getText('link.optyes')" /></a>
                <a href="#" class="btn btn-default btn-small confirm_no"><s:property value="getText('link.optno')" /></a>
            </div>
        </div>
    </div>
</div>
<div>
    <% if (!value.equals("crop") && !value.equals("cropcheck")) {%>
        <button class="btn btn_per btn-default" onclick="toggleAndClean('<%=divShow%>', '<%=divHide%>')"><i class="icon-arrow-left"></i> <s:property value="getText('button.backoption')" /></button>
    <% }%>
</div>
<div class="text-center" style="<%= table %>">
    <% String result = JavascriptHelper.pager_params_ajax(pageNow, countTotal, maxResults, "/crop/searchCrop.action?selected="+value, "divConListCrop", "", "", "formCropSearch");%>    
    <%= result%>
</div>
<s:if test="listCrops.size() > 2">
    <!--<script> $("#divSearchCrops").show(); </script>-->
</s:if> 
<s:else>
    <!--<script> $("#divSearchCrops").hide(); </script>-->
</s:else>
