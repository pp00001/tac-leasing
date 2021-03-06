<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="${ctx }/credit/js/creditPropertyAndDebt.js"></script>
<table id="capitalAndDebtTab2" width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectTab"  >
    <tr>
		 <th    class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="height: 28px;">
			 项目名称
		 </th>
		 <th colspan="7"  class="ui-state-default ui-th-ltr zc_grid_head">
			损益表暨水平分析(年度) 
		 </th> 			  
		 <th   class="ui-state-default ui-th-ltr zc_grid_head">
			 <font style="font-size: 12">单位（千元）</font>
		 </th> 			  
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 19%;height: 24px;" rowspan="2">
			科目\期间
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: center;height: 24px;">
			<jsp:setProperty name="now2" property="month" value="${now2.month+24}"/>
			<input type="text" readonly="readonly"  name="s_start_date" id="s_start_date1" value="<fmt:formatDate value="${now2}" pattern="yyyy-01-01" />" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;"  rowspan="2">
			<input type="button" value="剪切到下年" onclick="cutdown(2);" class="ui-state-default ui-corner-all">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;"  rowspan="2">
			成长率%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<jsp:setProperty name="now2" property="month" value="${now2.month-12}"/>
			<input type="text" readonly="readonly" name="s_start_date" id="s_start_date2" value="<fmt:formatDate value="${now2}" pattern="yyyy-01-01" />" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;"  rowspan="2">
			<input type="button" value="剪切到下年" onclick="cutdown(2,2);" class="ui-state-default ui-corner-all">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;"  rowspan="2">
			成长率%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<jsp:setProperty name="now2" property="month" value="${now2.month-12}"/>
			<input type="text" readonly="readonly"  name="s_start_date" id="s_start_date3" value="<fmt:formatDate value="${now2}" pattern="yyyy-01-01" />" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;" rowspan="2">
			&nbsp;
		</td>
	</tr> 
	<tr> 
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;height: 24px;">
			<div id="showProject_item1"></div>
		</td> 
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			<div id="showProject_item2"></div>
		</td> 
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			<div id="showProject_item3"></div>
		</td> 
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr"> 
			销售收入净额 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_sale_net_income" id="s_sale_net_income1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			100%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_sale_net_income" id="s_sale_net_income2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			100%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_sale_net_income" id="s_sale_net_income3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			100%
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			减:销售成本
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_sale_cost" id="s_sale_cost1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_sale_cost" id="s_sale_cost2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_sale_cost" id="s_sale_cost3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他业务毛利
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_other_gross_profit" id="s_other_gross_profit1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_other_gross_profit" id="s_other_gross_profit2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_other_gross_profit" id="s_other_gross_profit3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">销售毛利</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_sgp_sum" id="s_sgp_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_sgp_sum" id="s_sgp_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_sgp_sum" id="s_sgp_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			减:营业费用
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_operating_expenses" id="s_operating_expenses1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_operating_expenses" id="s_operating_expenses2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_operating_expenses" id="s_operating_expenses3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">营业利益</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_bp_sum" id="s_bp_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_bp_sum" id="s_bp_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_bp_sum" id="s_bp_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			营业外收入
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_nonbusiness_income" id="s_nonbusiness_income1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_nonbusiness_income" id="s_nonbusiness_income2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_nonbusiness_income" id="s_nonbusiness_income3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			利息支出
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_interest_expense" id="s_interest_expense1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_interest_expense" id="s_interest_expense2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_interest_expense" id="s_interest_expense3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他营业外支出
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_other_nonbusiness_expense" id="s_other_nonbusiness_expense1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_other_nonbusiness_expense" id="s_other_nonbusiness_expense2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_other_nonbusiness_expense" id="s_other_nonbusiness_expense3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">减:营业外支出</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_nbe_sum" id="s_nbe_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_nbe_sum" id="s_nbe_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_nbe_sum" id="s_nbe_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">税前损益</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_before_sum" id="s_before_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_before_sum" id="s_before_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_before_sum" id="s_before_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			减:所得税费用(利益)
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_income_tax_expense" id="s_income_tax_expense1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_income_tax_expense" id="s_income_tax_expense2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_income_tax_expense" id="s_income_tax_expense3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
		<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue"><strong>税后损益</strong></font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData2" name="s_after_sum" id="s_after_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_after_sum" id="s_after_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData2" name="s_after_sum" id="s_after_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
</table>
	  
	<c:if test="${showStatus eq 2}">
		<font color="blue">说明</font><br/>
		<textarea cols="120" rows="5" name="sunyi"></textarea>
	</c:if>
	<center>
			<c:if test="${showStatus eq 2}">
				<input type="button" value="保 存"  onclick="submitcheck();"   class="ui-state-default ui-corner-all">
			</c:if>
	</center>
<script type="text/javascript">  
		$("#project_item1").datepicker($.datepicker.regional['zh-CN']); 
		$("#project_item2").datepicker($.datepicker.regional['zh-CN']); 
		$("#project_item3").datepicker($.datepicker.regional['zh-CN']); 
		$("#s_start_date1").datepicker($.datepicker.regional['zh-CN']); 
		$("#s_start_date2").datepicker($.datepicker.regional['zh-CN']); 
		$("#s_start_date3").datepicker($.datepicker.regional['zh-CN']); 
		changeProjectItem();
		sumZiChanZongE();
		sumFuZaiZongE();
		sumJingZhiZongE()
		initAllData();
		sumYingYeLiYi();
		sumShuiQianSunYi();
		sumShuiHouSunYi();	
		initTable2Data();
		$(".inputData").blur(function(){
			valueChangeTable1(this);
		});
		$(".inputData2").blur(function(){
			valueChangeTable2(this);
		});
		$(".inputData").keypress(function(event){
			pressKeyFunc(this,event);
		});
		$(".inputData2").keypress(function(event){
			pressKeyFunc2(this,event);
		});  
</script> 
