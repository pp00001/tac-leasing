<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
$selectPayline = {
	allOrNot : function (obj) {
			$("input[name='MONTH_PRICE']").attr("disabled",!obj.checked);
			$("input[name='PERIOD_NUM']").attr("checked",obj.checked);
		}
};
</script>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="11" style="text-align:left ;height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
			<b>融资租赁还款计划</b>
		</td>
	</tr>
	<tr>
		<td height="30" rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			不等额<br/><input type="checkbox" name="checkboxAll"  onclick="$selectPayline.allOrNot(this);" />
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			期次
		</td>
		<td style="text-align: center;height: 20px;" class="ui-state-default ui-th-ltr zc_grid_head">
			支付时间
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			应收租金
		</td>
		<!-- <td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			净现金流
		</td> -->
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			预期租金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			本金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			利息
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			剩余本金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			<c:if test="${paylist.TAX_PLAN_CODE eq '1'}">营业税</c:if><c:if test="${paylist.TAX_PLAN_CODE eq '3'}">增值税</c:if>
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			收入
		</td>
	</tr>
	<tr>
		<td style="text-align: center;height: 20px;" class="ui-state-default ui-th-ltr zc_grid_head">
			（年/月/日）
		</td>
	</tr>
	<c:set value="" var="footDate"></c:set>
	<c:set value="0" var="TOTAL_IRR_MONTH_PRICE"></c:set>
	<c:set value="0" var="TOTAL_IRR_PRICE"></c:set>
	<c:set value="0" var="TOTAL_SALES_TAX"></c:set>
	<c:set value="0" var="TOTAL_MONTH_PRICE"></c:set>
	<c:set value="0" var="TOTAL_OWN_PRICE"></c:set>
	<c:set value="0" var="TOTAL_REN_PRICE"></c:set>
	<c:set value="0" var="TOTAL_INCOME"></c:set>
	<c:forEach items="${paylist.paylines }" var="item">
		<tr>
			<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="item_lock_${item.PERIOD_NUM}" type="checkbox"
					name="PERIOD_NUM" value="${item.PERIOD_NUM}"
					onclick="document.getElementById('item_monthPrice_${item.PERIOD_NUM}').disabled=!this.checked;" />
			</td>
			<td style="text-align: center;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.PERIOD_NUM}
			</td>
			<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd" />
				<c:set value="${item.PAY_DATE }" var="footDate"></c:set>
			</td>
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				
				<input id="item_monthPrice_${item.PERIOD_NUM}" type="text"
					name="MONTH_PRICE" class="input_right" autocomplete="off"
					value='<fmt:formatNumber value="${item.IRR_MONTH_PRICE }" type="currency" />'
					disabled />
			</td>
			<%-- <td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_PRICE }" type="currency" />
			</td> --%>
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber type="currency" value="${item.MONTH_PRICE}"/>
			</td >
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.OWN_PRICE }" type="currency" />
			</td>
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE }" type="currency" />
			</td>
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.LAST_PRICE }" type="currency" />
			</td>
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.SALES_TAX }" type="currency" />
			</td>
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE - item.SALES_TAX }" type="currency" />
			</td>
		</tr>
		<c:set value="${TOTAL_IRR_MONTH_PRICE + item.IRR_MONTH_PRICE  }" var="TOTAL_IRR_MONTH_PRICE"></c:set>
		<c:set value="${TOTAL_IRR_PRICE + item.IRR_PRICE }" var="TOTAL_IRR_PRICE"></c:set>
		<c:set value="${TOTAL_SALES_TAX + item.SALES_TAX }" var="TOTAL_SALES_TAX"></c:set>
		<c:set value="${TOTAL_MONTH_PRICE + item.MONTH_PRICE }" var="TOTAL_MONTH_PRICE"></c:set>
		<c:set value="${TOTAL_OWN_PRICE +  item.OWN_PRICE}" var="TOTAL_OWN_PRICE"></c:set>
		<c:set value="${TOTAL_REN_PRICE + item.REN_PRICE }" var="TOTAL_REN_PRICE"></c:set>
		<c:set value="${TOTAL_INCOME + item.REN_PRICE - item.SALES_TAX }" var="TOTAL_INCOME"></c:set>
	</c:forEach>
	<tr>
		<td colspan="3" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>合计:</b>
		</td>
		<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_IRR_MONTH_PRICE}" type="currency" />	
		</td>
		<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_IRR_PRICE}" type="currency" />	
		</td>
		<td   style="text-align: right;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_MONTH_PRICE}" type="currency" />	
		</td>
		<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_OWN_PRICE }" type="currency" />	
		</td>
		<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_REN_PRICE }" type="currency" />
		</td>
		<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_SALES_TAX }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_INCOME }" type="currency" />
		</td>
	</tr>
</table>
