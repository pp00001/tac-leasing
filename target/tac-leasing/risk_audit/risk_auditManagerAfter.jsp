<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查审核</title>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#dateend").datepicker($.datepicker.regional['zh-CN']);
			});
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
	  		$("#__action").val("exportApporvalletters.prePdf");
	  		$("#form1").submit();		
	  		$("#__action").val("riskAudit.riskAuditAfter");
	 		 }
	 		 
	 		 function reportExcel(differentReport)
			{
				location.href='../servlet/defaultDispatcher?__action=differentReport.reportExcel';
			}
			function createSubmit(creditId,address){
				$("#progressbar").dialog({
					closeOnEscape : false,
					open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
					modal : true,
					resizable : false,
					draggable : false,
					title : "数据加载中... ..."
				});
				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:'__action=creditReport.getIsCanSubmit&credit_id='+creditId,
					dataType:'json',
					success: function(dataBack){ 
						if(dataBack.content.toString() != ""){
							if(!confirm(dataBack.content.toString()+"是否继续")){
								return false;
							}
						} 
						location.href='../servlet/defaultDispatcher?__action='+address ;
					}
				});
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
			
			function doScoreCard(contract_type, prc_id){
				var url = "${ctx }";
		  		window.parent.openNewTab(url,"riskAudit.doScoreCardForRisk&contract_type=" + contract_type + "&prc_id=" + prc_id, "评分表");
			}
			
			function showScoreCard(prc_id){
				var url = "${ctx }";
		  		window.parent.openNewTab(url,"riskAudit.showScoreCardForRisk&prc_id=" + prc_id, "评分表");
			}
		</script>
	<script type="text/javascript" src="${ctx }/risk_audit/js/manage.js"></script>	
	</head>
	<body>
	<form action="../servlet/defaultDispatcher" name="subForm" id="subForm" method="post">
		<input type="hidden" name="__action" id="sub___action">
		<input type="hidden" name="credit_id" id="sub_credit_id">
		<input type="hidden" name="prc_id" id="sub_prc_id">
		<input type="hidden" name="flag" id="sub_flag">
	</form>
	<div id="progressbar" style="display: none;text-align: center;">
		<img src="${ctx }/images/loading.gif">
	</div>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">
			<input type="hidden" name="__action" id="__action" value="riskAudit.riskAuditAfter">
			<input type="hidden" id="credit_id" name="credit_id">
			<input type="hidden" id="prc_node" name="prc_node"  value="${prc_node}">	
			<c:if test="${prc_node eq 0}">
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
					   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;一级评审&nbsp;&nbsp;&nbsp;&nbsp;评审金额：${levelMap.LEVEL_PRICE_LOW }到${levelMap.LEVEL_PRICE_UPPER }(单位：元)</span>
					   	</div>
			</c:if>	
			<c:if test="${prc_node eq 1}">
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
					   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;二级评审&nbsp;&nbsp;&nbsp;&nbsp;评审金额：${levelMap.LEVEL_PRICE_LOW }到${levelMap.LEVEL_PRICE_UPPER }(单位：元)</span>
					   	</div>
			</c:if>
			<c:if test="${prc_node eq 2}">
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
					   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;三级评审&nbsp;&nbsp;&nbsp;&nbsp;评审金额：${levelMap.LEVEL_PRICE_LOW }到${levelMap.LEVEL_PRICE_UPPER }(单位：元) 或0到150(单位：万元)</span>
					   	</div>
			</c:if>
			<c:if test="${prc_node eq 3}">
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
					   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;四级评审&nbsp;&nbsp;&nbsp;&nbsp;评审金额：${levelMap.LEVEL_PRICE_LOW }到${levelMap.LEVEL_PRICE_UPPER }(单位：元)</span>
					   	</div>
			</c:if>	
			<c:if test="${prc_node eq 4}">
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
					   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;五级评审&nbsp;&nbsp;&nbsp;&nbsp;</span>
					   	</div>
			</c:if>	   				
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
			          <td>结束日期：</td>
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
						<c:if test="${wind_state eq -1}">
						<c:set var="type0" value="selected='selected'"></c:set>
						</c:if>
						<c:if test="${wind_state eq 0}">
						<c:set var="type1" value="selected='selected'"></c:set>
						</c:if>
						<c:if test="${wind_state eq 3}">
						<c:set var="type2" value="selected='selected'"></c:set>
						</c:if>
						<c:if test="${wind_state eq 4}">
						<c:set var="type3" value="selected='selected'"></c:set>
						</c:if>
						<c:if test="${wind_state eq 5}">
						<c:set var="type5" value="selected='selected'"></c:set>
						</c:if>
						<select name="wind_state" style="width: 80px;">
								<option value=""${ type0}>
									全部
								</option>
								<option value="0"${ type1}>
									待评审
								</option>
								<option value="3"${ type2}>
									不通过附条件
								</option>
								<option value="4"${ type3}>
									不通过
								</option>
								<option value="5"${ type5}>
									无条件通过
								</option>																				
							</select>
				       </td>					
			          </tr>
			          <tr>
			          <%-- <td>评审级别：</td>
							<td>
									<c:set var="type0" value=""></c:set>
									<c:set var="type1" value=""></c:set>
									<c:set var="type2" value=""></c:set>
									<c:set var="type3" value=""></c:set>
									<c:if test="${level_node eq 0}">
									<c:set var="type0" value="selected='selected'"></c:set>
									</c:if>																					
									<c:if test="${level_node eq 1}">
									<c:set var="type1" value="selected='selected'"></c:set>
									</c:if>
									<c:if test="${level_node eq 2}">
									<c:set var="type2" value="selected='selected'"></c:set>
									</c:if>	
									<c:if test="${level_node eq 3}">
									<c:set var="type3" value="selected='selected'"></c:set>
									</c:if>
									<select name="level_node" style="width: 80px;">
											<option value="0"${ type0}>
												全部
											</option>							
											<option value="1"${ type1}>
												二级评审
											</option>
											<option value="2"${ type2}>
												三级评审
											</option>
											<option value="3"${ type3}>
												四级评审
											</option>																				
									</select>
				     </td>	 --%>
				          <td>查询内容：</td>
				          <td colspan="3"><input type="text" name="content" value="${content }" style=" width:228px;height:18px; font-size: 12px;">
				          </td>
				          <td>
							报告来源：
						  </td>
							<td>
								<select name="vip_flag" style="width: 80px;">
									<option value="">全部</option>
									<option value="0" <c:if test="${vip_flag eq '0' }">selected</c:if>>一般</option>
									<option value="1" <c:if test="${vip_flag eq '1' }">selected</c:if>>绿色通道</option>
								</select>
							</td>
				          </tr>
		          </table>         
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
	          		
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table style="width: 100%">
						<tr >
							<td>
								<input type="button" name="pdfbutton" onclick="pdfFun();" class="panel_button" value="导出核准函">&nbsp;&nbsp;
								<input class="panel_button" type="button" id="buttonAdd" value="导出评审统计Excel" onclick="reportExcel()" />
							</td>
							<td><page:pagingToolbarTop pagingInfo="${pagingInfo}"/></td>
						</tr>
					</table>		
						<table class="grid_table">
							<tr>
								<th width="2%">
										<input type="checkbox" NAME="all" id="all" onclick="checkAll(this,'credit_idxx');">
								</th>
								<th >
									<page:pagingSort orderBy="STATE" pagingInfo="${pagingInfo}"><strong>状态 </strong></page:pagingSort>
								</th>
								<th >
									标签
								</th>
								<th >
									<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo}"><strong>案件号 </strong></page:pagingSort>
								</th>	
								<th >
									<page:pagingSort orderBy="REAL_PRC_HAO" pagingInfo="${pagingInfo}"><strong>批覆书号</strong></page:pagingSort>
								</th>															
								<!-- <th >
									<strong>承租人类型 </strong>
								</th> -->
								<th >
									<page:pagingSort orderBy="CUST_NAME" pagingInfo="${pagingInfo}"><strong>客户名称 </strong></page:pagingSort>
								</th>
								<th >
									<page:pagingSort orderBy="CLERK_NAME" pagingInfo="${pagingInfo}"><strong>办事处主管 </strong></page:pagingSort>
								</th>
								<th >
									<page:pagingSort orderBy="SENSOR_NAME" pagingInfo="${pagingInfo}"><strong>客户经理 </strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="VISITOR_DATE" pagingInfo="${pagingInfo}"><strong>访厂时间 </strong></page:pagingSort>
								</th>
								<th >
									<page:pagingSort orderBy="CREATE_TIME" pagingInfo="${pagingInfo}"><strong>提交风控时间 </strong></page:pagingSort>
								</th>
								<th >
									<page:pagingSort orderBy="LEASE_RZE" pagingInfo="${pagingInfo}"><strong>融资额 </strong></page:pagingSort>
								</th>								
								<th >
									<strong>资信调查报告 </strong>
								</th>
								<th >
									<strong>风控会议纪要 </strong>
								</th>								
							</tr>
							<c:forEach items="${pagingInfo.resultList}" var="item">
								<tr>
									<%-- <td style="text-align: center;"><c:if test="${item.STATE eq 1}"><input type="checkbox" value="${item.ID }"  name ="credit_idxx"></c:if>&nbsp;</td>
									<td style="text-align: center;"><c:choose><c:when test="${item.STATE eq 0 and item.PRC_LEVEL_ID == prc_node}"><img src="${ctx }/images/u608.gif" title="待评审"></c:when><c:when test="${item.STATE eq 3}"><img src="${ctx }/images/u617.gif" title="不通过附条件"></c:when><c:when test="${item.STATE eq 1}"><img src="${ctx }/images/u611.gif" title="无条件通过"></c:when><c:when test="${item.STATE eq 4}"><img src="${ctx }/images/u614.gif" title="不通过"></c:when><c:otherwise><img src="${ctx }/images/u622.gif" title="已评审"></c:otherwise></c:choose></td>
									 --%>
									<td style="text-align: center;"><c:if test="${item.WIND_STATE eq 1}"><input type="checkbox" value="${item.ID }"  name ="credit_idxx"></c:if>&nbsp;</td>
									<td style="text-align: center;"><c:choose><c:when test="${item.WIND_STATE eq 3}"><img src="${ctx }/images/u617.gif" title="不通过附条件"></c:when><c:when test="${item.WIND_STATE eq 4}"><img src="${ctx }/images/u614.gif" title="不通过"></c:when><c:when test="${item.WIND_STATE eq 2}"><img src="${ctx }/images/u620.gif" title="有条件通过"></c:when><c:when test="${item.WIND_STATE eq 1}"><img src="${ctx }/images/u611.gif" title="无条件通过"></c:when><c:otherwise><c:if test="${item.PRC_NODE eq prc_node}"><img src="${ctx }/images/u608.gif" title="待评审"></c:if><c:if test="${item.PRC_NODE != prc_node}"><img src="${ctx }/images/u622.gif" title="评审中"></c:if></c:otherwise></c:choose></td>
									<td style="text-align: center;padding-top: 4px;">
										<c:forEach  items="${item.TAGS }" var="tag">
											&nbsp;<img title="${tag.tagName}" src="${ctx}/images/tags/${tag.tagColor}.png">	
										</c:forEach>&nbsp;						
									</td>
									<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
									<td style="text-align: center;">${item.REAL_PRC_HAO }&nbsp;</td>
									<!-- <td style="text-align: center;"><c:if test="${item.CUST_TYPE eq 0 }">自然人</c:if><c:if test="${item.CUST_TYPE eq 1 }">法人</c:if></td>
									 --><td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
									<td style="text-align: center;"><c:choose><c:when test="${not empty item.NONE_VISIT_REASON }">${item.NONE_VISIT_REASON }</c:when><c:otherwise>${item.VISIT_DATE }</c:otherwise></c:choose>&nbsp;</td>
									<td style="text-align: center;"><fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
									<td style="text-align:right">&nbsp;<fmt:formatNumber type="currency" value="${item.LEASE_RZE }" />&nbsp;</td>
									<!-- Modify by Michael 2012 1/5去除资信报告的修改功能 -->
									<!-- 
									<td style="text-align: center;"><a href="javaScript:void(0)"
											onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">查看</a> | <a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForUpdate&credit_id=${item.ID }'">修改</a> | <a href="javascript:void(0)" onclick="creditfiles('${item.ID }','${item.CONTRACT_TYPE+1 }');">资料</a></td>
									-->
									<td style="text-align: center;"><a href="javaScript:void(0)"
											onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">查看</a> | <a href="javascript:void(0)" onclick="creditfiles('${item.ID }','${item.CONTRACT_TYPE+1 }');">资料</a></td>
							
									<td style="text-align: center;">
										<a href="javaScript:void(0)" onclick="showRisk('${item.ID }', '${item.PRC_ID }');">查看 </a>
										<c:choose>
											<c:when test="${prc_node eq  item.PRC_NODE and item.WIND_STATE eq 0}">
												|&nbsp;<a href="javaScript:void(0)" onclick="createSubmit(${item.ID},'riskAudit.selectRiskAuditForSucc_zulinAfter&VIP_FLAG=${item.VIP_FLAG }&credit_id=${item.ID }&prc_id=${item.PRC_ID }&prc_node=${prc_node}');">评审</a>
											</c:when>
											<c:otherwise>|&nbsp;评审</c:otherwise>
										</c:choose>
										<c:choose><c:when test="${empty item.SCORE_CARD}">
											|&nbsp;<a href="javaScript:void(0)" onclick="doScoreCard('${item.CONTRACT_TYPE}', '${item.PRC_ID }');">评分</a>
										</c:when><c:otherwise>
											|&nbsp;<a href="javaScript:void(0)" onclick="showScoreCard('${item.PRC_ID}');">评分结果</a>
										</c:otherwise></c:choose>
									</td>									
								</tr>
							</c:forEach>
							</table>
							<page:pagingToolbar pagingInfo="${pagingInfo}"/>
							<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td align="right">
											<img src="${ctx }/images/u608.gif">
											待评审&nbsp;
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
				</div>
				</div>
			</div>					
		</form>
			<div id="creditfile" align="center" title="资料管理" style="display: none; text-align:center; width:840px">
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
								<input class="ui-state-default ui-corner-all" type="button" onclick="firstPage()" value="首页"/>
								&nbsp;&nbsp;&nbsp;
								<input class="ui-state-default ui-corner-all" type="button" onclick="prevPage()" value="上一页"/>
								&nbsp;&nbsp;&nbsp;
								<input class="ui-state-default ui-corner-all" type="button" onclick="nextPage()" value="下一页"/>
								&nbsp;&nbsp;&nbsp;
								<input class="ui-state-default ui-corner-all" type="button" onclick="lastPage()" value="尾页"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								到第<input size="3" type="text" id="assign"/>页<input class="ui-state-default ui-corner-all" type="button" value="跳转" onclick="assignPage()"/>
								</div>						
						</form>
			</div>						
	</body>
</html>