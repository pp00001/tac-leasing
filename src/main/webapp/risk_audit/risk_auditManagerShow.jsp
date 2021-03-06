<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查审核浏览</title>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#dateend").datepicker($.datepicker.regional['zh-CN']);
			});
			
			function openPath(path){
				var url = $("#url").val();
				window.parent.openCredit(url,path);
			}
			function exportPdf(id,ids){
				window.location.href="${ctx }/servlet/defaultDispatcher?__action=exportCreditMakeContractPdf.exportCreditMakeConPdf&credit_id="+id;
			}
			function checkAll(e, itemName)
			{
		  	var aa = document.getElementsByName(itemName);
		  	for (var i=0; i<aa.length; i++)
		  	 aa[i].checked = e.checked;
			}	
				//导出合同
			 function pdfFun(){
					  var chk_value =[];   
					  $('input[name="credit_idxx"]:checked').each(function(){   
					   chk_value.push($(this).val());   
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择数据");
					  	return false;}	 
					  if(chk_value.length>1){
					  	alert("现在一次只能导出一个核准函！");
					  	return false;}	
	  		$("#__action").val("exportApporvalletters.prePdf");
	  		$("#form1").submit();
	  		$("#__action").val("riskAudit.riskAudit");
	  }		
	  
	  	function reportExcel(differentReport){
			location.href='../servlet/defaultDispatcher?__action=differentReport.reportExcel';
		}
	  	
	  	function showScoreCard(prc_id){
			var url = "${ctx }";
	  		window.parent.openNewTab(url,"riskAudit.showScoreCardForRisk&prc_id=" + prc_id, "评分表");
		}
	  	
	  	function showRisk(credit_id,prc_id){
	  		$("#progressbar").dialog({
				closeOnEscape : false,
				open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
				modal : true,
				resizable : false,
				draggable : false,
				title : "数据加载中... ..."
			});
			$("#sub___action").val("riskAuditSee.selectRiskAuditForSee_zulin");
			$("#sub_credit_id").val(credit_id);
			$("#sub_prc_id").val(prc_id);
			$("#subForm").submit();
	  	}
	  	
		</script>
		<script type="text/javascript" src="${ctx }/risk_audit/js/manage.js"></script>	
	</head>
	<body>
	<form action="../servlet/defaultDispatcher" name="subForm" id="subForm" method="post">
		<input type="hidden" name="__action" id="sub___action">
		<input type="hidden" name="credit_id" id="sub_credit_id">
		<input type="hidden" name="prc_id" id="sub_prc_id">
	</form>
	<div id="progressbar" style="display: none;text-align: center;">
		<img src="${ctx }/images/loading.gif" style="vertical-align: middle;">
	</div>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }">
			<input type="hidden" name="user.userId" value="145">
			<input type="hidden" name="user.userName" value="yy">
			<input type="hidden" name="__action" id="__action" value="riskAudit.riskAuditShow">
			<input type="hidden" id="url" name="url" value="${ctx }"/>
			<input type="hidden" id="credit_id" name="credit_id">
			
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;<c:if test="${isSalesDesk eq 'Y' }">审查中客户清单</c:if><c:if test="${isSalesDesk ne 'Y' }">评审浏览</c:if></span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
		   	<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起始日期：</td>
				          <td><input type="text" name="start_date" style="width:80px; height:18px;" readonly="readonly"
							id="datebegin" value="${start_date }">
				          <td>
				          结束日期：</td>
				          <td><input type="text" name="end_date" id="dateend" style="width:80px; height:18px;" readonly="readonly"
							value="${end_date }">
					</td>
					<td>
					类型：
					</td>
					<td>
					<c:set var="type0" value=""></c:set>
							<c:set var="type1" value=""></c:set>
							<c:set var="type2" value=""></c:set>
							<c:set var="type3" value=""></c:set>
							<c:set var="type4" value=""></c:set>
							<c:set var="type5" value=""></c:set>		
							<c:if test="${wind_state eq 0}">
							<c:set var="type0" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${wind_state eq 1}">
							<c:set var="type1" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${wind_state eq -1}">
							<c:set var="type2" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${wind_state eq 3}">
							<c:set var="type3" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${wind_state eq 4}">
							<c:set var="type4" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${wind_state eq 5}">
							<c:set var="type5" value="selected='selected'"></c:set>
							</c:if>
							<select name="wind_state" style="width: 100px;">
								<option value=""${ type0}>
								全部
								</option>
								<option value="1"${ type1}>
								评审中
								</option>
								<%-- <option value="-1"${ type2}>
								待评审
								</option> --%>
								<option value="3"${ type3}>
									不通过附条件
								</option>
								<option value="4"${ type4}>
									不通过
								</option>
								<option value="5"${ type5}>
									无条件通过
								</option>			
							</select>
					</td>
					<td>
						报告来源：
					</td>
					<td>
						<select name="vip_flag" style="width: 100px;">
							<option value="">全部</option>
							<option value="0" <c:if test="${vip_flag eq '0' }">selected</c:if>>一般</option>
							<option value="1" <c:if test="${vip_flag eq '1' }">selected</c:if>>绿色通道</option>
						</select>
					</td>
		          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="3"><input type="text" name="content" value="${content }" style=" width:230px;height:18px; font-size: 12px;"></td>
				          <td>
								进度：
							</td>
							<td>
								<select name="rate_of_progress" style="width: 100px;">
									<option value="">全部</option>
									<option value="0" <c:if test="${rate_of_progress eq '0' }">selected</c:if>>初级评审</option>
									<option value="1" <c:if test="${rate_of_progress eq '1' }">selected</c:if>>一级评审</option>
									<option value="2" <c:if test="${rate_of_progress eq '2' }">selected</c:if>>二级评审</option>
									<option value="3" <c:if test="${rate_of_progress eq '3' }">selected</c:if>>三级评审</option>
									<option value="4" <c:if test="${rate_of_progress eq '4' }">selected</c:if>>四级评审</option>
									<option value="5" <c:if test="${rate_of_progress eq '5' }">selected</c:if>>已完成</option>
								</select>
							</td>
				          	<td>办事处：</td>
							<td><select name="search_decp" style="width: 100px;">
								<option value="0">全部</option>
								<option value="-1" <c:if test="${search_decp eq '-1'}">selected="selected"</c:if>>默认</option>
								<c:forEach items="${decpList }" var="decp">
									<option value="${decp.option_value }" <c:if test="${search_decp eq decp.option_value}">selected="selected"</c:if>>${decp.display_name }</option>
								</c:forEach>
							</select></td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onClick="$('#form1').submit();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
		   			<c:if test="${isSalesDesk eq 'Y' }">
		          		<br>
		          		<div style="text-align: center">
						&nbsp;&nbsp;<input type="button" value="供应商维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="supplier()">
						&nbsp;&nbsp;<input type="button" value="客户维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="customer()">
						&nbsp;&nbsp;<input type="button" value="资料中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="dataOnGoing()">
						&nbsp;&nbsp;<input type="button" value="访厂客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="access()">
						&nbsp;&nbsp;<input type="button" value="审查中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer;color:gray" disabled="disabled">
						&nbsp;&nbsp;<input type="button" value="已核准客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="approve()">
						&nbsp;&nbsp;<input type="button" value="待补文件清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="pending()">
						&nbsp;&nbsp;<input type="button" value="延滞客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="delay()">
		          		&nbsp;&nbsp;<input type="button" value="案件查询" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="caseQuery()">
		          		</div>
		          		<br>
	          		</c:if>
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table style="width: 100%;">
						<tr >
							<td>
							<c:if test="${export1 == true}">
								<input type="button" name="pdfbutton" onClick="pdfFun();" class="panel_button" value="导出核准函">
							</c:if>
							&nbsp;&nbsp;
							<c:if test="${export2 == true}">
								<input class="panel_button" type="button" id="buttonAdd" value="导出评审统计Excel" onclick="reportExcel()"></input>
							</c:if>
							</td>
							<td><page:pagingToolbarTop pagingInfo="${pagingInfo}"/></td>
						</tr>
					</table>
						<table class="grid_table">
							<tr>
								<c:if test="${export1 == true || export2 == true}">
									<th width="2%">
											<input type="checkbox" NAME="all" id="all" onClick="checkAll(this,'credit_idxx');">
									</th>
								</c:if>
								<th >
									<page:pagingSort orderBy="WIND_STATE" pagingInfo="${pagingInfo}"><strong><c:if test="${isSalesDesk eq 'Y' }">案件进度</c:if><c:if test="${isSalesDesk ne 'Y' }">状态</c:if></strong></page:pagingSort>
								</th>
								<th >
									标签
								</th>
								<th >
									<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo}"><strong>案件号 </strong></page:pagingSort>
								</th>
								<th >
									<page:pagingSort orderBy="REAL_PRC_HAO" pagingInfo="${pagingInfo}"><strong>批覆书号 </strong></page:pagingSort>
								</th>	
								<th >
									<page:pagingSort orderBy="PRC_LEVEL_ID" pagingInfo="${pagingInfo}"><strong>评审进度 </strong></page:pagingSort>
								</th>														
								<!-- <th>
									<strong>承租人类型 </strong>
								</th> -->
								<th>
									<page:pagingSort orderBy="CUST_NAME" pagingInfo="${pagingInfo}"><strong>客户名称 </strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="CLERK_NAME" pagingInfo="${pagingInfo}"><strong>办事处主管 </strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="SENSOR_NAME" pagingInfo="${pagingInfo}"><strong>客户经理 </strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="VISIT_DATE" pagingInfo="${pagingInfo}"><strong>访厂时间 </strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="CREATE_TIME" pagingInfo="${pagingInfo}"><strong>提交风控时间 </strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="LEASE_RZE" pagingInfo="${pagingInfo}"><strong>融资额</strong></page:pagingSort>
								</th>	
								<th>
									<strong>资信调查报告 </strong>
								</th>							
								<th>
									<strong>风控会议纪要 </strong>
								</th>								
							</tr>
							<c:forEach items="${pagingInfo.resultList}" var="item">
								<tr>
									<c:if test="${export1 == true || export2 == true}"><td style="text-align: center;"><c:if test="${item.WIND_STATE eq 1}"><input type="checkbox" value="${item.ID }"  name ="credit_idxx"></c:if>&nbsp;</td></c:if>
									<td style="text-align: center;"><c:if test="${isSalesDesk ne 'Y' }"><c:choose><c:when test="${item.PRC_ID eq null}"><img src="${ctx }/images/u622.gif" title="评审中"></c:when><c:when test="${item.WIND_STATE eq 3}"><img src="${ctx }/images/u617.gif" title="不通过附条件"></c:when><c:when test="${item.WIND_STATE eq 4}"><img src="${ctx }/images/u614.gif" title="不通过"></c:when><c:when test="${item.WIND_STATE eq 1}"><img src="${ctx }/images/u611.gif" title="无条件通过"></c:when><c:when test="${!empty item.PRC_ID}"><img src="${ctx }/images/u622.gif" title="评审中"></c:when></c:choose></c:if><c:if test="${isSalesDesk eq 'Y' }"><c:choose><c:when test="${item.PRC_ID eq null}">评审中</c:when><c:when test="${item.WIND_STATE eq 3}">不通过附条件</c:when><c:when test="${item.WIND_STATE eq 4}">不通过</c:when><c:when test="${item.WIND_STATE eq 1}">无条件通过</c:when><c:when test="${!empty item.PRC_ID}">评审中</c:when></c:choose></c:if></td>
									<td style="text-align: center;padding-top: 4px;">
										<c:forEach  items="${item.TAGS }" var="tag">
											&nbsp;<img title="${tag.tagName}" src="${ctx}/images/tags/${tag.tagColor}.png">	
										</c:forEach>&nbsp;						
									</td>
									<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
									<td style="text-align: center;">${item.REAL_PRC_HAO }&nbsp;</td>
									<td style="text-align: center;"><c:choose><c:when test="${empty item.PRC_NODE }">初级评审</c:when><c:when test="${item.WIND_STATE eq 3 or item.WIND_STATE eq 4 or item.WIND_STATE eq 1}">已完成</c:when><c:otherwise>${item.PRC_NODE + 1 }级评审</c:otherwise></c:choose>&nbsp;</td>
									<!-- <td style="text-align: center;"><c:if test="${item.CUST_TYPE eq 0 }">自然人</c:if><c:if test="${item.CUST_TYPE eq 1 }">法人</c:if></td>
									 --><td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
									<td style="text-align: center;"><c:choose><c:when test="${not empty item.NONE_VISIT_REASON }">${item.NONE_VISIT_REASON }</c:when><c:otherwise>${item.VISIT_DATE }</c:otherwise></c:choose>&nbsp;</td>
									<td style="text-align: center;"><fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
									<td style="text-align:right">&nbsp;<fmt:formatNumber type="currency" value="${item.LEASE_RZE }" /></td>
									<td style="text-align: center;">
										<a href="#" onclick="openPath('creditReport.selectCreditForShow&credit_id=${item.ID }');">查看</a> | 
										<a href="javascript:void(0)" onClick="creditfiles('${item.ID }','${item.CONTRACT_TYPE+1 }');">资料</a>
									</td>
									<td style="text-align: center;">
										<c:choose>
											<c:when test="${item.PRC_ID eq null}">未评审</c:when>
											<c:otherwise>
												<a href="javaScript:void(0)" onclick="showRisk('${item.ID }', '${item.PRC_ID }');">查看</a> 
											</c:otherwise>
										</c:choose>
										<c:if test="${not empty item.SCORE_CARD}">
											|&nbsp;<a href="javaScript:void(0)" onclick="showScoreCard('${item.PRC_ID}');">评分结果</a>
										</c:if>
										<c:if test="${empty item.SCORE_CARD}">
											|&nbsp;未评分
										</c:if>
									</td>									
								</tr>
							</c:forEach>
						</table>
						<page:pagingToolbar pagingInfo="${pagingInfo}"/>
						<c:if test="${isSalesDesk ne 'Y' }">
							<table class="STYLE2" width="100%" border="0" cellpadding="0"
								cellspacing="0">
								<tbody>
									<tr>
										<td align="right">
											<%-- <img src="${ctx }/images/u608.gif">
											待评审&nbsp; --%>
											<img src="${ctx }/images/u622.gif">
											评审中&nbsp;											
											<img src="${ctx }/images/u617.gif">
											不通过附条件&nbsp;
											<img src="${ctx }/images/u614.gif" >
											不通过&nbsp;
											<img src="${ctx }/images/u611.gif">
											无条件通过&nbsp;
										</td>
									</tr>
									<tr>
										<td align="right">
												<c:forEach items="${tags}" var="tag" varStatus="position">
													<img src="${ctx }/images/tags/${tag.tagColor }.png" style="position:relative;top:4px;" title="${tag.comments}"/>			
													${tag.tagName } &nbsp;
												</c:forEach>
										</td>
									</tr>
								</tbody>
							</table>
						</c:if>
				</div>
				</div>
			</div>	
		</form>
			<div id="creditfile" align="center" title="资料管理" style="display: none;  text-align:center; width:840px">
				<img src="${ctx }/images/loading.gif">
			</div>
			<div id="fenOrder" align="center" title="测评分等级" style="display: none;  text-align:center; width:840px">
					<form action="../servlet/defaultDispatcher" name="form2" id="form2" method="post">
						<input type="hidden" name="__action" id="__action" value="riskAuditSee.fenOrder">
						<input type="hidden" id="credit_id" name="credit_id" value="">	
						<input type="hidden" id="prc_id" name="prc_id" value="">			
									<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">		
										<tr>
											<td class="ui-widget-content jqgrow ui-row-ltr" width="16%">评审数量</td>
											<td class="ui-widget-content jqgrow ui-row-ltr" width="16%"><span id="cout"></span>&nbsp;</td>
											<td class="ui-widget-content jqgrow ui-row-ltr" width="16%">平均分值</td>
											<td class="ui-widget-content jqgrow ui-row-ltr" width="16%"><span id="sump"></span>&nbsp;</td>					
											<td class="ui-widget-content jqgrow ui-row-ltr" width="16%">当前分值</td>
											<td class="ui-widget-content jqgrow ui-row-ltr" width="16%"><span id="poi"></span>&nbsp;</td>													
										</tr>																									
									</table>
									<br>
									<table id="data1" align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">		
										<tr id="data2">
											<td class="ui-widget-content jqgrow ui-row-ltr" style='text-align:center'>名次</td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style='text-align:center'>编号</td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style='text-align:center'>客户名称</td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style='text-align:center'>承租人编号</td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style='text-align:center'>风控时间</td>					
											<td class="ui-widget-content jqgrow ui-row-ltr" style='text-align:center'>融资额</td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style='text-align:center'>分值</td>													
										</tr>																																										
									</table>
								<div align="right" style="text-align:right;">
								共<span id="barNum"></span>条,共<span id="total"></span>页
								当前第<span id="pageNum" ></span>页
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="ui-state-default ui-corner-all" type="button" onClick="firstPage()" value="首页"/>
								&nbsp;&nbsp;&nbsp;
								<input class="ui-state-default ui-corner-all" type="button" onClick="prevPage()" value="上一页"/>
								&nbsp;&nbsp;&nbsp;
								<input class="ui-state-default ui-corner-all" type="button" onClick="nextPage()" value="下一页"/>
								&nbsp;&nbsp;&nbsp;
								<input class="ui-state-default ui-corner-all" type="button" onClick="lastPage()" value="尾页"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								到第<input size="3" type="text" id="assign"/>页<input class="ui-state-default ui-corner-all" type="button" value="跳转" onClick="assignPage()"/>
								</div>
									
						</form>
			</div>		
	</body>
</html>