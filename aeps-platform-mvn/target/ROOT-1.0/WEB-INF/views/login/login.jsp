<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="icon" type="image/ico" href="img/logoAEPS.ico">
        <title>AEPS</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <meta http-equiv="Cache-control: max-age=86400" content="public">
        <sj:head jqueryui="true" loadAtOnce="true"/>
        <sb:head includeScripts="true" includeScriptsValidation="true"/>        
        <link rel="stylesheet" href="scripts/css/colorbox/colorbox.css"/>
        <link rel="stylesheet" href="scripts/css/generals/login.css">
        <link rel="stylesheet" href="scripts/css/font-awesome/css/font-awesome.min.css">
        <link href = 'http://fonts.googleapis.com/css?family=Istok+Web:400700400cursiva,700italicysubconjunto=latin,latin-ext' rel='stylesheet' type='text/css'>        
    </head>
    <body>
        <%@ include file="../generals/googleAnalytics.jsp" %>
        <div id="divMessage" style="display:none;"></div>
        <div id="login-wrapper" class="container col-md-3">  
            <div class="panel-heading">
                <a href="initial.action" class="img-responsive"><img src="img/logoAEPS.png"/></a>
            </div>
            <div class="panel-body">
                <s:actionerror theme="bootstrap"/>
                <s:actionmessage theme="bootstrap"/>
                <s:fielderror theme="bootstrap"/>                      
                <div class="panel" id="divRegisterUser">
                    <h3 class=""><s:property value="getText('title.contact.login')" /></h3>
                    <s:form id="formLogin" action="signin.action">
                        <s:hidden name="actExe" value="login"/>
                        <s:hidden name="lanSel"/>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label class="control-label" for="formLogin_username">
                                    <s:property value="getText('text.user.login')" />
                                    <i class="icon-info-sign pop-over" data-content="<s:property value="getText('desc.user.login')" />." data-toggle="popover" title="<s:property value="getText('help.user.login')" />" data-placement="right" data-trigger="hover"></i>
                                </label>
                                <div class="controls">
                                    <s:textfield id="formLogin_username" name="username"/>
                                </div>                         
                            </div>
                            <div class="col-md-12 form-group">
                                <label class="control-label" for="formLogin_password"><s:property value="getText('text.password.login')" /></label>
                                <div class="controls">
                                    <s:password id="formLogin_password" name="password"/>
                                </div>
                            </div>
                            <div class="login_links col-md-12">
                                <a href="javascript:void(0)" id="remPass">
                                    <span><s:property value="getText('link.forgetpass.login')" /></span>
                                </a>
                            </div>
                            <div class="login_links col-md-12">
                                <a href="javascript:void(0)" id="newUser">
                                    <span><s:property value="getText('link.signup.login')" /></span>
                                </a>
                            </div>
                        </div>                 
                    </s:form>
                    <div class="">
                        <sj:submit type="button" formIds="formLogin" cssClass="btn btn-initial btn-lg" onclick="addMessageProcessLogin('formLogin_lanSel'); ga('send', 'event', 'Register', 'click', 'SingIn');" onCompleteTopics="completeLogin" validate="true" validateFunction="validationForm"><s:property value="%{getText('button.signin.login')}"/>
                        </sj:submit>
                    </div>
                    <script>
                        $.subscribe('completeLogin', function (event, data) {
                            $.unblockUI();
                            //                                alert(event.originalEvent.request.responseText)
                            //                            document.location='http://localhost:8083/dashboard.action'
                        });
                    </script>
                </div>
                <div class="panel" style="display:none;" id="divRestoreUser">
                    <h3 class=""><s:property value="getText('title.cantenter.login')" /> ?</h3>
                    <s:form id="formValidate" action="restorePassword.action">
                        <s:hidden name="actExe" value="restuser"/>
                        <s:hidden name="lanSel"/>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label class="control-label" for="formValidate_infoUser"><s:property value="getText('text.emailcontact.login')" /></label>
                                <div class="controls">
                                    <s:textfield id="formValidate_infoUser" name="infoUser" />
                                </div>
                            </div>
                            <div class="login_links col-md-12">
                                <a href="javascript:void(0)" id="accessSystem">
                                    <span><s:property value="getText('link.systementry.login')" /></span>
                                </a>
                            </div>
                            <div class="col-md-12">
                                <sj:submit type="button" id="btRestore" cssClass="btn btn-initial btn-lg" onclick="addMessageProcessLogin('formValidate_lanSel'); ga('send', 'event', 'Register', 'click', 'Remember');" targets="divMessage" onCompleteTopics="completeRestore" validate="true" validateFunction="validationForm"><s:property value="getText('button.restore.login')" /></sj:submit>
                                </div>
                            </div>
                    </s:form>
                    <div class="hideInfo">
                        <div id="confirm_dialog" class="cbox_content">
                            <div class="sepH_c">
                                <p><s:text name="%{getText('area.restoreinfo.login')}" />.</p>
                            </div>
                            <div>
                                <a href="#" class="btn btn-small confirm_ok"><s:property value="getText('link.resultok.login')" /></a>
                            </div>
                        </div>
                    </div>
                    <script>
                        $.subscribe('completeRestore', function (event, data) {
                            showDialogWarning('confirm_dialog');
                            completeForm('', 'formValidate', event.originalEvent.request.responseText);
                        });
                    </script>
                </div>
                <div class="panel" style="display:none;" id="divNewUser">
                    <h3 class=""><s:property value="getText('title.newuser.login')" /></h3>
                    <s:form id="formNewUser" action="saveUser.action">
                        <s:hidden name="actExe" value="newuser"/>
                        <s:hidden name="lanSel"/>
                        <div class="form-group">
                            <label class="control-label req" for="formNewUser_typeUser">
                                <s:property value="getText('text.typeuser.login')" />:
                                <i class="icon-info-sign pop-over" data-content="<s:property value="getText('desc.typeuser.login')" />." title="<s:property value="getText('help.typeuser.login')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls">
                                <s:select
                                    name="typeUser"
                                    list="#{'2':'Productor', '1':'Agronomo/Asistente', '3':'Gremio/Empresa'}"
                                    headerKey="-1" 
                                    headerValue="---" 
                                    onchange="showOtherElementUser(this.value, 'divWorkType', 'divDataAssociation');"
                                    />
                            </div>   
                        </div>
                        <div class="hideInfo" id="divWorkType">
                            <div class="form-group">
                                <label for="formNewUser_workType" class="control-label req"><s:property value="getText('select.howwork.login')" />:</label>
                                <div class="controls">
                                    <s:select
                                        name="workType"
                                        list="#{'1':'Como independiente', '3':'Para empresa privada', '4':'Para gremio', '5':'Para entidades gubernamentales'}"           
                                        headerKey="-1" 
                                        headerValue="---"   
                                        onchange="showOtherElementWorkType(this.value, 'divAssociationAdd');"
                                        />
                                </div>
                            </div>
                            <div class="hideInfo" id="divAssociationAdd">
                                <div class="form-group">
                                    <label class="control-label req" for="formNewUser_idAssoExt"><s:property value="getText('select.wherework.login')" />:</label>
                                    <div class="controls">
                                        <s:select
                                            name="idAssoExt" 
                                            list="association_list" 
                                            listKey="idAsc" 
                                            listValue="nameAsc"          
                                            headerKey=" " 
                                            headerValue="---"
                                            />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group hideInfo" id="divDataAssociation">                     
                            <div class="form-group">
                                <label class="control-label req" for="formNewUser_emailRep"><s:property value="getText('text.emailagent.login')" />:</label>
                                <div class="controls">
                                    <s:textfield class="form-control" type="email" name="emailRep" placeholder="%{getText('desc.emailagent.login')}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label req" for="formNewUser_pageLink"><s:property value="getText('text.pagelink.login')" />:</label>
                                <div class="controls">
                                    <s:textfield class="form-control" name="pageLink"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label req" for="formNewUser_direction"><s:property value="getText('text.direction.login')" />:</label>
                                <div class="controls">
                                    <s:textfield class="form-control" name="direction"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label req" for="formNewUser_nameAsso"><s:property value="getText('text.nameasso.login')" />:</label>
                                <div class="controls">
                                    <s:textfield class="form-control" name="nameAsso"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="formNewUser_emailUser"><s:property value="getText('text.emailuser.login')" />:</label>
                            <div class="controls">
                                <s:textfield type="email" class="form-control" id="formNewUser_emailUser" name="emailUser" placeholder="%{getText('desc.emailuser.login')}"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-5">
                                    <label class="control-label password req" for="formNewUser_passwordUser"><s:property value="getText('text.passworduser.login')" />:</label>
                                    <label for="formNewUser_passwordUser">(<s:property value="getText('label.passworduser.login')" />)</label>
                                    <div class="controls">
                                        <s:password class="form-control" id="formNewUser_passwordUser" name="passwordUser"/>
                                        <div id="pwdMeter" class="progress progress-danger">
                                            <div class="bar" style="width: 0%"></div>
                                            <span class="pwdText"></span>
                                        </div>
                                    </div>
                                    <script>
                                        var veryWeakLogin = "";
                                        var weakLogin = "";
                                        var mediumLogin = "";
                                        var strongLogin = "";
                                        var veryStrongLogin = "";
                                        var lanVal = $('#formNewUser_lanSel').val();
                                        var str = lanVal;
                                        var valEs = str.search("es");
                                        var valEn = str.search("en");

                                        if (valEs != -1) {
                                            veryWeakLogin = "Muy Debil";
                                            weakLogin = "Debil";
                                            mediumLogin = "Normal";
                                            strongLogin = "Fuerte";
                                            veryStrongLogin = "Muy Fuerte";
                                        }

                                        if (valEn != -1) {
                                            veryWeakLogin = "Very Weak";
                                            weakLogin = "Weak";
                                            mediumLogin = "Normal";
                                            strongLogin = "Strong";
                                            veryStrongLogin = "Very Strong";
                                        }

                                        $('.itooltip').popover({
//                                            placement: wheretoplace,
                                            html: true,
                                            trigger: 'hover',
                                            template: '<div class="popover arrowSituate"><div class="arrow" style="top:65px;"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
                                        });

//                                        $('[data-toggle=popover]').popover();
//
//                                        $('[data-toggle=popover]').on('shown.bs.popover', function () {
//                                          $('.popover').css('top',parseInt($('.popover').css('top')) + 52 + 'px !important')
//                                        })

//                                        function wheretoplace(){
//                                            var width = window.innerWidth;
//                                            if (width<500) return 'bottom';
//                                            return 'right';
//                                        }
                                    </script>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-5">
                                    <label class="control-label req" for="formNewUser_passwordRepUser"><s:property value="getText('text.reppassworduser.login')" />:</label>
                                    <label for="formNewUser_passwordRepUser">(<s:property value="getText('label.reppassworduser.login')" />)</label>
                                    <div class="controls">
                                        <s:password class="form-control" id="formNewUser_passwordRepUser" name="passwordRepUser"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">                            
                            <div class="login_links col-md-12">
                                <a href="javascript:void(0)" id="accessSystemUser">
                                    <span><s:property value="getText('link.systemingress.login')" /></span>
                                </a>
                            </div>
                            <div class="col-md-12">
                                <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
                            </div>
                            <div class="col-md-12">
                                <s:hidden name="intoVal" value="in"/>
                                <%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
                                <%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
                                <%
                                    ReCaptcha captcha = ReCaptchaFactory.newReCaptcha("6Le3bu4SAAAAAAIy3mS2Ov8XerDrpgVxmWOShi9C", "6Le3bu4SAAAAAAdFTwmmT_2XuBKPGUhfdlgpRseY", false);
                                    String captchaScript = captcha.createRecaptchaHtml(request.getParameter("error"), null);
                                    out.print(captchaScript);
                                %>
                            </div>                            
                            <div class="col-md-12">
                                <sj:submit cssClass="btn btn-initial btn-lg" onclick="addMessageProcessLogin('formNewUser_lanSel'); ga('send', 'event', 'Register', 'click', 'SignUp');" targets="divMessage" onCompleteTopics="completeUser" value="%{getText('button.createuser.login')}" validate="true" validateFunction="validationForm"/>
                            </div>
                        </div>                            
                    </s:form>
                    <script>
                        $.subscribe('completeUser', function (event, data) {
                            completeForm('', 'formNewUser', event.originalEvent.request.responseText);
                        });
                        if ($('.pop-over').length) {
                            $('.pop-over').popover({html: true});
                        }
                    </script>
                </div>                
            </div>
        </div>
        <% String logSel = String.valueOf(request.getParameter("logSel"));%>
        <script type="text/javascript" src="scripts/js/jquery/jquery.maskedinput.js"></script>
        <script type="text/javascript" src="scripts/js/jquery/jquery.numeric.js"></script>
        <script type="text/javascript" src="scripts/js/jquery/jquery.maskMoney.js"></script>
        <script type="text/javascript" src="scripts/js/jquery/jquery.blockUI.js"></script>
        <script type="text/javascript" src="scripts/js/colorbox/jquery.colorbox.min.js"></script>
        <script type="text/javascript" src="scripts/js/jquery/pwdMeter/jquery.pwdMeter.min.js"></script>
        <script type="text/javascript" src="scripts/js/generals/functions.js"></script>  
        <script type="text/javascript">
                        (function (a) {
                            a.fn.vAlign = function () {
                                return this.each(function () {
                                    var b = a(this).height(), c = a(this).outerHeight(), b = (b + (c - b)) / 2;
                                    a(this).css("margin-top", "-" + b + "px");
                                    a(this).css("top", "50%");
                                    a(this).css("position", "absolute")
                                })
                            }
                        })(jQuery);
                        (function (a) {
                            a.fn.hAlign = function () {
                                return this.each(function () {
                                    var b = a(this).width(), c = a(this).outerWidth(), b = (b + (c - b)) / 2;
                                    a(this).css("margin-left", "-" + b + "px");
                                    a(this).css("left", "50%");
                                    a(this).css("position", "absolute")
                                })
                            }
                        })(jQuery);
                        $(document).ready(function () {
                            $('#remPass').click(function () {
                                $('#divRegisterUser').slideUp('200');
                                $('#divNewUser').slideUp('200');
                                $('#divValidateUser').slideUp('200');
                                $('#divChangePass').slideUp('200');
                                $('#divRestoreUser').slideDown('200');
                            });

                            $('#accessSystem').click(function () {
                                $('#divNewUser').slideUp('200');
                                $('#divRestoreUser').slideUp('200');
                                $('#divValidateUser').slideUp('200');
                                $('#divChangePass').slideUp('200');
                                $('#divRegisterUser').slideDown('200');
                            });

                            $('#newUser').click(function () {
                                $('#divRegisterUser').slideUp('200');
                                $('#divRestoreUser').slideUp('200');
                                $('#divValidateUser').slideUp('200');
                                $('#divChangePass').slideUp('200');
                                $('#divNewUser').slideDown('200');
                                //$(this).children('span').toggle();
                            });

                            $('#accessSystemUser').click(function () {
                                $('#divNewUser').slideUp('200');
                                $('#divRestoreUser').slideUp('200');
                                $('#divValidateUser').slideUp('200');
                                $('#divChangePass').slideUp('200');
                                $('#divRegisterUser').slideDown('200');
                            });

                            $('#accessSystemUserVer').click(function () {
                                $('#divNewUser').slideUp('200');
                                $('#divRestoreUser').slideUp('200');
                                $('#divValidateUser').slideUp('200');
                                $('#divChangePass').slideUp('200');
                                $('#divRegisterUser').slideDown('200');
                            });

                            $('#verUser').click(function () {
                                $('#divNewUser').slideUp('200');
                                $('#divRestoreUser').slideUp('200');
                                $('#divRegisterUser').slideUp('200');
                                $('#divChangePass').slideUp('200');
                                $('#divValidateUser').slideDown('200');
                            });

                            $('#accessSystemChangePass').click(function () {
                                $('#divNewUser').slideUp('200');
                                $('#divRestoreUser').slideUp('200');
                                $('#divValidateUser').slideUp('200');
                                $('#divChangePass').slideUp('200');
                                $('#divRegisterUser').slideDown('200');
                            });

                            $('#changePass').click(function () {
                                $('#divNewUser').slideUp('200');
                                $('#divRestoreUser').slideUp('200');
                                $('#divRegisterUser').slideUp('200');
                                $('#divValidateUser').slideUp('200');
                                $('#divChangePass').slideDown('200');
                            });
                        });
                        if ($('#formNewUser_passwordUser').length) {
                            $('#formNewUser_passwordUser').pwdMeter({
                                minLength: 6,
                                displayGeneratePassword: false,
                                neutralText: "",
                                veryWeakText: veryWeakLogin,
                                weakText: weakLogin,
                                mediumText: mediumLogin,
                                strongText: strongLogin,
                                veryStrongText: veryStrongLogin
                            });
                        }
                        $.mask.definitions['h'] = "[3]";
                        $('#formNewUser_celphoneUser').mask("h999999999", {placeholder: ""});
                        $('#formNewUser_passwordRepUser').bind("cut copy paste", function (e) {
                            e.preventDefault();
                        });
                        var val = "<%=logSel%>";
                        if (val == 'new') {
                            $('#divRegisterUser').slideUp('200');
                            $('#divRestoreUser').slideUp('200');
                            $('#divValidateUser').slideUp('200');
                            $('#divChangePass').slideUp('200');
                            $('#divNewUser').slideDown();
                        }
        </script>
    </body>
</html>
