<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/credit/car/js/paylistLink.js"></script>
<script type="text/javascript" src="${ctx }/credit/car/js/paylistIrrMonthPrice.js"></script>
		<script type="text/javascript"> 
		$(function (){
			if($("#TAX_PLAN_CODE_").val()==4||$("#TAX_PLAN_CODE_").val()==6||$("#TAX_PLAN_CODE_").val()==7||$("#TAX_PLAN_CODE_").val()==8) {
			if($("#TAX_PLAN_CODE_").val()==5) {
				$("#pay1").show();
				$("#pay2").show();
				$("#pay3").show();
				$("#pay4").show();
				$("#pay5").show();
				$("#pay6").show();
			} else {
				$("#pay1").hide();
				$("#pay2").hide();
				$("#pay3").hide();
				$("#pay4").hide();
				$("#pay5").hide();
				$("#pay6").hide();
				$(".pay_panel").hide();
			}
			}
			if($("#TAX_PLAN_CODE_").val()==4) {
				$("#aaa").html("用于一次抵冲租金");
			} else {
				$("#aaa").html("用于平均抵冲金额");
			}
			if($("#TAX_PLAN_CODE_").val()==7) {
				$("#pay1").show();
				$("#pay2").show();
			}
			var tax=0;
			if($("#TAX_PLAN_CODE_").val()=='4') {
				tax=$("#totalPayAddTax1").val();
			} else if($("#TAX_PLAN_CODE_").val()=='6') {
				tax=$("#totalPayAddTax1").val()/1.1;
			} else {
				tax=$("#totalPayAddTax1").val();
			}
			
			$("#PAY_START_DATE").datepicker($.datepicker.regional["zh-CN"]);
			document.getElementById("yearRent1").innerHTML=Number(($("#totalRenPrice").val()-tax)/(${paylist.LEASE_TOPRIC }-${paylist.PLEDGE_AVE_PRICE})/($("#PAY_LEASE_PERIOD").val()/12)*100).toFixed(2)+'%';
			document.getElementById("yearRent").innerHTML=Number($("#totalRenPrice").val()/(${paylist.LEASE_TOPRIC }-${paylist.PLEDGE_AVE_PRICE})/($("#PAY_LEASE_PERIOD").val()/12)*100).toFixed(2)+'%';
			if($("#TAX_PLAN_CODE_").val()==4) {
			document.getElementById("valueAdd").innerHTML=$("#totalPayAddTax").val();
			document.getElementById("valueAdd1").innerHTML=$("#incomeTax").val();
			}
			if($("#TAX_PLAN_CODE_").val()==4||$("#TAX_PLAN_CODE_").val()==6||$("#TAX_PLAN_CODE_").val()==7||$("#TAX_PLAN_CODE_").val()==8) {
				$("#aaa1").hide();
				$("#aaa2").hide();
				$("#aaa3").hide();
			}
			
		});
		var baseRate = ${baseRateJson};
		</script>
		<script type="text/javascript"> 
			function addWuzdRow(){
				var tab = document.getElementById("wuzd");
				var trs = tab.rows.length-1;
				var leasePeriod = getLeasePeriod();
				var value =1;
				if (trs>0){
					var lastTr = tab.rows[trs];
					var lastVal = $(lastTr).find("select").val();
					if (lastVal >= leasePeriod) {
						alert("上一结束期次已经到达租赁期数的最大值！");
						return ;
					} else {
						value = Number(lastVal) + 1;
					}
				}
				var tid = document.getElementById("wuzd");
				var row = tid.insertRow(trs+1);
				addWuzd(row,0,'NAME', null);	
				addWuzd(row,1,'VALUE',value);	
				addWuzd(row,2,'DELSPAN',null);	
				
				hideWuzdDelSpan();
			}
			function addWuzd(row, index, name,value){
				var sed = document.getElementById("wuzd").rows.length;
				var html='';
				var cell = row.insertCell(index); 
				cell.className = "ui-widget-content jqgrow ui-row-ltr";
				
				if (name == "NAME") {
					html = html + "融资租赁总价值<font color=\"red\">&nbsp;*</font>";
				}
				if (name == "VALUE"){
					html = html + '<input type="text"  name="W" class="input_right" style="width: 130px;" value="">';
					html = html + '第<select name="W">';
					for (var i=0;i<=getLeasePeriod();i++){
							html = html + '<option value="'+i+'">'+i+'</option>';
						}
					html = html + '</select>月支付';					
				}
				if (name == "DELSPAN"){
					html = html + '<span name="wuzdDelSpan" style="display: block;"><input type="button" name="delBut" onclick="deleteWuzdRow(this)" value="删 除" class="ui-state-default ui-corner-all"></span>'
				}
				cell.innerHTML =html;
				row.appendChild(cell);
				return;
			}
			
			function deleteWuzdRow(obj){
			   var tr = obj.parentNode.parentNode.parentNode;
			   tr.parentNode.removeChild(tr); 
			   hideWuzdDelSpan();
			}
			function hideWuzdDelSpan(){
				var spans = document.getElementsByName("wuzdDelSpan");
				var len = spans.length-1;
				for (var i=0;i<spans.length;i++){
					if (i != len){
						spans[i].style.display = 'none';
					} else {
						spans[i].style.display = 'block';
					}
				}
			}		
				
		</script>		
<form action="../servlet/defaultDispatcher" name="payForm" id="payForm" onsubmit="return submitPayForm();" method="post">
	<input type="hidden" name="__action" value="">
	<input type="hidden" name="credit_id" id="cccccc" value="${creditMap.ID }">
	<input type="hidden" name="word" value="${word }">
	<input type="hidden" value="<fmt:formatNumber value="${paylist.LEASE_TOPRIC/1.17*0.17 }" type="currency" />" id='incomeTax'>
	<c:forEach items="${paylist.paylines }" var="item"  varStatus="status">
	<input type="hidden" name="FIRST_OWN_PRICE" id="FIRST_OWN_PRICE${ status.count }" value="<fmt:formatNumber value="${item.REAL_OWN_PRICE }" type="currency" />" />
	</c:forEach>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           	<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
	
	<table width="982" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="wuzd">
		<tr>
			<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
				<b style="font-size: 14px;">&nbsp;&nbsp;融资租赁方案</b>
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				融资租赁总价值<font color="red">&nbsp;*</font>
			</td>
			<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="PAY_LEASE_TOPRIC" id="PAY_LEASE_TOPRIC" onchange="changeFieldPay('PAY_LEASE_TOPRIC',this);"
					value="<fmt:formatNumber value="${schemeMap.LEASE_TOPRIC }" type="currency" />"
					class="input_right" style="width: 130px;" readonly="readonly">
			</td>
		 
			<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				概算成本（RZE）
			</td>
			<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="PAY_LEASE_RZE" id="PAY_LEASE_RZE" readonly="readonly"
					value="<fmt:formatNumber value="${schemeMap.LEASE_RZE }" type="currency" />"
					class="input_right" style="width: 130px;">
			</td>
		</tr>
		<tr>
			<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				租赁期数<font color="red">&nbsp;*</font>
			</td>
			<td width="25%"style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" onchange="changeFieldPay('PAY_LEASE_PERIOD',this);"
					name="PAY_LEASE_PERIOD" id="PAY_LEASE_PERIOD"
					value="${schemeMap.LEASE_PERIOD }" style="width: 60px;" readonly="readonly">
			</td>
			<td width="17%"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				租赁周期<font color="red">&nbsp;*</font>
			</td>
			<td width="43%"   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<select name="PAY_LEASE_TERM" id="PAY_LEASE_TERM"
					onchange="changeFieldPay('PAY_LEASE_TERM',this);">
					<option value="1"
						<c:if test="${schemeMap.LEASE_TERM eq 1 }">selected="selected"</c:if>>
						月份
					</option>
					<option value="2"
						<c:if test="${schemeMap.LEASE_TERM eq 2 }">selected="selected"</c:if>>
						双份
					</option>
					<option value="3"
						<c:if test="${schemeMap.LEASE_TERM eq 3 }">selected="selected"</c:if>>
						季度
					</option>
					<option value="6"
						<c:if test="${schemeMap.LEASE_TERM eq 6 }">selected="selected"</c:if>>
						半年
					</option>
					<option value="12"
						<c:if test="${schemeMap.LEASE_TERM eq 12 }">selected="selected"</c:if>>
						年度
					</option>
				</select>
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				首期租金
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<!--  
				<input type="text"
					onchange="changeFieldPay('PAY_MANAGEMENT_FEE_RATE',this);"
					name="PAY_MANAGEMENT_FEE_RATE" id="PAY_MANAGEMENT_FEE_RATE"
					value="${schemeMap.MANAGEMENT_FEE_RATE}" 
					style="width: 60px;" readonly="readonly">
				%
				<input type="text" onchange="changeFieldPay('PAY_MANAGEMENT_FEE',this);"
					name="PAY_MANAGEMENT_FEE" id="PAY_MANAGEMENT_FEE"
					value="<fmt:formatNumber value="${schemeMap.MANAGEMENT_FEE }" type="currency" />"
					class="input_right" style="width: 130px;" readonly="readonly">
			-->
			<input type="text" onchange="changeFieldPay('PAY_HEAD_HIRE_PERCENT',this);"
					name="PAY_HEAD_HIRE_PERCENT" id="PAY_HEAD_HIRE_PERCENT"
					value="${empty schemeMap.HEAD_HIRE_PERCENT ? 0 : schemeMap.HEAD_HIRE_PERCENT }" style="width: 60px;" readonly="readonly">
				%
				<input type="text" onchange="changeFieldPay('PAY_HEAD_HIRE',this);"
					name="PAY_HEAD_HIRE" id="PAY_HEAD_HIRE" class="input_right"
					style="width: 130px;"
					value="<fmt:formatNumber value="${empty schemeMap.HEAD_HIRE ? 0 : schemeMap.HEAD_HIRE }" type="currency" />" readonly="readonly">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				保证金<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" onchange="changeFieldPay('PAY_PLEDGE_PRICE_RATE',this);"
					name="PAY_PLEDGE_PRICE_RATE" id="PAY_PLEDGE_PRICE_RATE"
					value="${schemeMap.PLEDGE_PRICE_RATE }" style="width: 60px;" readonly="readonly">
				%
				<input type="text" onchange="changeFieldPay('PAY_PLEDGE_PRICE',this);"
					name="PAY_PLEDGE_PRICE" id="PAY_PLEDGE_PRICE"
					value="<fmt:formatNumber value="${schemeMap.PLEDGE_PRICE }" type="currency" />"
					class="input_right" style="width: 130px;" readonly="readonly">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<!-- 
					实际使用保证金<font color="red">&nbsp;*</font>
				 -->&nbsp;
			</td>
			<td   style="text-align:  left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;<input type="hidden" name="PAY_PLEDGE_REALPRIC" id="PAY_PLEDGE_REALPRIC" value="${schemeMap.PLEDGE_REALPRIC }" readonly="readonly">
			</td>
		</tr>
		<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<span id="aaa">用于平均抵冲金额</span>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="PAY_PLEDGE_AVE_PRICE" id="PAY_PLEDGE_AVE_PRICE" onchange="paylistchangeRZE();paylistchangePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_AVE_PRICE?0:schemeMap.PLEDGE_AVE_PRICE }" />" style="text-align: right" readonly="readonly">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						用于期末退还金额
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="PAY_PLEDGE_BACK_PRICE" id="PAY_PLEDGE_BACK_PRICE" onchange="paylistchangeRZE();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_BACK_PRICE?0:schemeMap.PLEDGE_BACK_PRICE }" />" style="text-align: right" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						用于最后抵冲期数
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="hidden" name="PAY_PLEDGE_LAST_PRICE" id="PAY_PLEDGE_LAST_PRICE" onchange="paylistchangeRZE();paylistchangePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_LAST_PRICE?0:schemeMap.PLEDGE_LAST_PRICE }" />" style="text-align: right" readonly="readonly">
						<input type="text" name="PAY_PLEDGE_LAST_PERIOD" id="PAY_PLEDGE_LAST_PERIOD" size="8"
							value="${empty schemeMap.PLEDGE_LAST_PERIOD?0:schemeMap.PLEDGE_LAST_PERIOD }" style="text-align: center;" readonly="readonly">
					</td>
					<!-- Modify by Michael 2012 4-19 隐藏收入时间 -->
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						延迟拨款期数<!--	收入时间  -->
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="PAY_DEFER_PERIOD" id="PAY_DEFER_PERIOD" size="8"
							value="${empty schemeMap.DEFER_PERIOD?0:schemeMap.DEFER_PERIOD }" style="text-align: center;" readonly="readonly">
						<input type="hidden" name="PAY_PLEDGE_PERIOD" size="8" id="PAY_PLEDGE_PERIOD"
							value="${empty schemeMap.PLEDGE_PERIOD?0:schemeMap.PLEDGE_PERIOD }" style="text-align: center;" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						保证金入账
					</td>
					<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<!--<input type="radio" name="PAY_PLEDGE_ENTER_WAY" value="1" <c:if test="${empty paylist.PLEDGE_ENTER_WAY or paylist.PLEDGE_ENTER_WAY eq 1 }">checked="checked"</c:if> >-->入我司&nbsp;&nbsp;&nbsp;

						<input type="text" name="PAY_PLEDGE_ENTER_CMPRICE" id="PAY_PLEDGE_ENTER_CMPRICE" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_CMPRICE?0:schemeMap.PLEDGE_ENTER_CMPRICE }" />"  readonly="readonly">&nbsp;&nbsp;<span id="aaa1">税金&nbsp;
						<input type="text" name="PAY_PLEDGE_ENTER_CMRATE" id="PAY_PLEDGE_ENTER_CMRATE" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_CMRATE?0:schemeMap.PLEDGE_ENTER_CMRATE }" />" readonly="readonly">&nbsp;&nbsp;</span>我司入供应商&nbsp;
						<input type="text" name="PAY_PLEDGE_ENTER_MCTOAG" id="PAY_PLEDGE_ENTER_MCTOAG" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_MCTOAG?0:schemeMap.PLEDGE_ENTER_MCTOAG}" />" readonly="readonly">&nbsp;&nbsp;<span id="aaa2">税金&nbsp;
						<input type="text" name="PAY_PLEDGE_ENTER_MCTOAGRATE" id="PAY_PLEDGE_ENTER_MCTOAGRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_MCTOAGRATE?0:schemeMap.PLEDGE_ENTER_MCTOAGRATE}" />" readonly="readonly"></span>
						<br>
						<!--<input type="radio" name="PAY_PLEDGE_ENTER_WAY" value="2" <c:if test="${paylist.PLEDGE_ENTER_WAY eq 2 }">checked="checked"</c:if>>-->入供应商&nbsp;

						<input type="text" name="PAY_PLEDGE_ENTER_AG" id="PAY_PLEDGE_ENTER_AG" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_AG?0:schemeMap.PLEDGE_ENTER_AG }" />" readonly="readonly">&nbsp;&nbsp;<span id="aaa3">税金&nbsp;
						<input type="text" name="PAY_PLEDGE_ENTER_AGRATE" id="PAY_PLEDGE_ENTER_AGRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_AGRATE?0:schemeMap.PLEDGE_ENTER_AGRATE}" />" readonly="readonly"></span>
					</td>
				</tr>
<!-- Add by Michael 2012 01/14 费用参数化 -->				
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<font color="RED"><b style="font-size: 14px;">管理费收入(影响TR计算)</b></font>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<font color="RED"><b style="font-size: 14px;">非管理费收入(不影响TR计算)</b></font>
			</td>
		</tr>	
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListRZETable">
					
							<c:forEach items="${feeListRZE }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="paylistchangeRZE();"
										value="<fmt:formatNumber pattern='###0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right" feeListRZE="feeListRZE" readonly="readonly" >&nbsp;&nbsp;&nbsp;&nbsp;来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select>
									</td>
								</tr>
							</c:forEach>							
						<c:forEach items="${feeSetListRZE }" var="item"  varStatus="status">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="paylistchangeRZE();"
									value="<fmt:formatNumber pattern='###0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right" feeListRZE="feeListRZE" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select>
								</td>
							</tr>
						</c:forEach>	
				</table>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListTable">
				<c:forEach items="${feeList }" var="item"  varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select>
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${feeSetList }" var="item"  varStatus="status">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr">
								<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
								value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>	
<!-- Add by Michael 2012 01/14 费用参数化 -->					
		<tr>		
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				支付方式<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<select name="PAY_PAY_WAY" id="PAY_PAY_WAY" onchange="changeFieldPay('PAY_PAY_WAY',this);">
					<c:forEach items="${payWays}" var="item">
						<option value="${item.CODE }"
							<c:if test="${ schemeMap.PAY_WAY eq item.CODE }"> selected="selected"</c:if>>
							${item.FLAG }
						</option>
					</c:forEach>
				</select>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				预估起租日
			</td>
			<td   style="text-align:  left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PAY_START_DATE" id="PAY_START_DATE"
					value="<fmt:formatDate value="${schemeMap.START_DATE }" pattern="yyyy-MM-dd" />"
					style="width: 100px" readonly="readonly" />
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<font color="RED" style="font-size: 14px;"><b>客户TR</b></font>
			</td>
			<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<b>&nbsp;&nbsp;<input type="text" name="TR_RATE" id="TR_RATE" value="<fmt:formatNumber value="${schemeMap.TR_RATE }" pattern="##0.000"/>" readonly="readonly">&nbsp;</b>%
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<font color="RED"><b style="font-size: 14px;">实际TR</b></font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<b style="font-size: 14px;">&nbsp;&nbsp;<input type="text" name="TR_IRR_RATE" id="TR_IRR_RATE" value="<fmt:formatNumber value="${schemeMap.TR_IRR_RATE }" pattern="##0.000"/>" readonly="readonly">&nbsp;</b>%
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<font color="RED"><b style="font-size: 14px;">利差</b></font>
			</td>
			<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<b style="font-size: 14px;">&nbsp;&nbsp;<input type="text" name="RATE_DIFF" id="RATE_DIFF" value="<fmt:formatNumber value="${schemeMap.RATE_DIFF }" pattern="##0.000"/>" readonly="readonly">&nbsp;</b>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				税费测算方案<font color="red">&nbsp;*</font>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<select name="TAX_PLAN_CODE" id="TAX_PLAN_CODE_">
						<c:forEach items="${taxPlanList}" var="item">
							<option value="${item.CODE }"
								<c:if test="${ schemeMap.TAX_PLAN_CODE eq item.CODE }"> selected="selected"</c:if>>${item.FLAG }
							</option>
						</c:forEach>
				</select>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
				<span id="pay1" style="font-size:14px;">佣金<font color="red">&nbsp;*</font></span>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
				<span id="pay2" style="font-size:14px;">${empty paylist.SALES_PAY?0:paylist.SALES_PAY }</span>
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<span id="pay3" style="font-size:14px;">手续费收入：</span>
				
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<span class="pay_panel">
					<select name="incomePayType" id="incomePayType" disabled="disabled">
						<option value="1" <c:if test="${incomePayType eq 1 }">selected="selected"</c:if>>无手续费</option>
						<option value="2" <c:if test="${incomePayType eq 2 }">selected="selected"</c:if>>非月结</option>
						<option value="3" <c:if test="${incomePayType eq 3 }">selected="selected"</c:if>>月结</option>
					</select>
					<input type="text" id="incomePay" name="incomePay" value="${incomePay }" style="width:80px;" disabled="disabled"/>
				</span>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<span id="pay4" style="font-size:14px;">手续费收入税额：</span>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<span class="pay_panel">
					<input type="text" id="incomePayTax" name="incomePayTax" value="${empty incomePayTax?0:incomePayTax }" disabled="disabled" style="width:80px;">
				</span>
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
				<span id="pay5" style="font-size:14px;">银行手续费：</span>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;" colspan="3">
				<span id="pay6" style="font-size:14px;"><input type="text" id="outPay" name="outPay" value="${outPay }" style="width:80px;" disabled="disabled"></span>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<table id="irrMonthPriceTab" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
							<b style="font-size: 14px;">&nbsp;&nbsp;融资租赁方案测算方式一</b>
						</td>
						<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
						&nbsp;
						</td>
					</tr>
				<c:forEach var="item" items="${irrMonthPaylines}" varStatus="status">
					<tr>
						<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							应付租金
						</td>
						<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text"  name="PAY_IRR_MONTH_PRICE" class="input_right"
									style="width: 130px;"
									value="<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" type="currency" />" readonly="readonly">
					</td>
						<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							对应期次
						</td>
						<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
					第<input type="text" name="PAY_IRR_MONTH_PRICE_START" value="${item.IRR_MONTH_PRICE_START}" readonly="readonly" style="width: 30px;text-align: center;">期到第<select name="PAY_IRR_MONTH_PRICE_END" onchange="changeIrrMonthPriceEnd(this);">
									<c:forEach begin="1" end="${paylist.LEASE_PERIOD}" var="item1" step="1">
										<option value="${item1 }" <c:if test="${item.IRR_MONTH_PRICE_END eq item1}">selected="selected"</c:if>>${item1 }</option>
				</c:forEach></select>期
									
						</td>
						<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
						</td>
					</tr>
				</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;display: none;">
				<!-- 利率上浮比率 -->
			</td>
			<td   style="text-align:  left;font-size: 14px;display: none;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" onchange="changeFieldPay('PAY_FLOAT_RATE',this);"
					name="PAY_FLOAT_RATE" id="PAY_FLOAT_RATE" value="${schemeMap.FLOAT_RATE }"
					style="width: 60px;display: none;">
				%
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;" colspan="4">
				合同利率：<input type="hidden" onchange="changeFieldPay('PAY_YEAR_INTEREST',this);"
					name="PAY_YEAR_INTEREST" id="PAY_YEAR_INTEREST"
					value="<fmt:formatNumber value="${paylist.YEAR_INTEREST }" pattern="#0.00000000" />"
					style="width: 60px;">
				<fmt:formatNumber value="${paylist.YEAR_INTEREST }" pattern="#0.000" />%&nbsp;&nbsp;
				<c:if test="${paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">
				未税年平息率：<span id="yearRent1" style="font-size: 14px;"></span>&nbsp;&nbsp;
				含税年平息率：<span id="yearRent" style="font-size: 14px;"></span>&nbsp;&nbsp;
				<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">
					增值税进销项差额：<span id="valueAdd" style="font-size: 14px;"></span>&nbsp;&nbsp;
					进项增值税：<span id="valueAdd1" style="font-size: 14px;"></span>
				</c:if>
				</c:if>
			</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${schemeMap.TAX_PLAN_CODE eq '2' }">
			<%@ include file="creditPaylineCreateValueAdded.jsp"%>
		</c:when>
		<c:when test="${schemeMap.TAX_PLAN_CODE eq '1' or schemeMap.TAX_PLAN_CODE eq '3' or schemeMap.TAX_PLAN_CODE eq '4' or schemeMap.TAX_PLAN_CODE eq '5' or schemeMap.TAX_PLAN_CODE eq '6' or schemeMap.TAX_PLAN_CODE eq '7' or schemeMap.TAX_PLAN_CODE eq '8'}">
		<%@ include file="creditPaylineCreate.jsp"%>
		</c:when>
	</c:choose>
	<center>
		<!-- 有时会导出空合同,暂时先禁止掉 -->
		<!--input type="button" class="ui-state-default ui-corner-all"   value="导出合同"  onclick="expCat('${creditMap.ID}');" -->
		<!-- Add by Michael 2012 6-15 屏蔽导出报价单功能 -->
		<!--<input type="button" class="ui-state-default ui-corner-all" id="But" value="导出报价单" name="But" onclick="expQuoToPdf('${creditMap.ID}');">-->
		<!--input type="button" class="ui-state-default ui-corner-all" id="But" value="导出租赁物情况表" name="But" onclick="submitCalCulate('3');"-->
		<c:if test="${paylist.TAX_PLAN_CODE ne '4' }">
		<%-- <input type="button" class="ui-state-default ui-corner-all" id="But" value="导出测算表" name="But" onclick="submitCalCulate('4','${schemeMap.TAX_PLAN_CODE_}');"> --%>
		</c:if>
	</center>
</div>
</div>
</div>
</form>

<div id="showDuibi" style="display: none;" title="融资租赁方案对比">
	<table border="0" width="100%">
		<tr id="showDuibiTr">
			 
		</tr>
	</table> 