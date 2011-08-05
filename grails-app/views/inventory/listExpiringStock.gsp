<%@ page import="org.pih.warehouse.inventory.Transaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${warehouse.message(code: 'transaction.label', default: 'Transaction')}" />
        
        <title>Expiring/expired stock ${session.warehouse.name}</title>    
    </head>    

	<body>
		<div class="body">
       		
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<table>
				<tr>
            		<td style="border: 1px solid lightgrey; background-color: #f5f5f5;">
			            <g:form action="listExpiringStock" method="get">
			            	<table >
			            		<tr>
			            			<th><warehouse:message code="default.category.label"/></th>
			            			<th><warehouse:message code="inventory.expiresWithin.label"/></th>
			            			<th><warehouse:message code="inventory.excludeExpired.label"/></th>
			            		</tr>
			            		<tr>
						           	<td class="filter-list-item">
						           		<g:select name="category"
														from="${categories}"
														optionKey="id" optionValue="name" value="${categorySelected?.id}" 
														noSelection="['':'--All--']" />&nbsp;&nbsp;    
									</td>
									<td>
						           		<g:select name="threshhold"
														from="['1':'one week', '14':'two weeks', '30':'one month', 
															'60':'two months', '90':'three months',
															'180': 'six months', '365':'one year']"
														optionKey="key" optionValue="value" value="${threshholdSelected}" 
														noSelection="['':'--All--']" />&nbsp;&nbsp;    
						           	</td>
						           	<td>	
						           		<g:checkBox name="excludeExpired" value="${excludeExpired }" } />
						           	
						           	</td>						           	
									<td class="filter-list-item" style="height: 100%; vertical-align: bottom">
										<button name="filter">
											<img src="${resource(dir: 'images/icons/silk', file: 'zoom.png')}"/>&nbsp;Filter </button>
									</td>							           	
								</tr>
							</table>
			            </g:form>
            		</td>
            	</tr>
			</table>
			<br/>
			<fieldset>
				<h3><warehouse:message code="inventory.expiringStockWithin6Months.label"/></h3>
				<table>
					<tr>					
						<td>
							<div style="padding: 10px;">
								<h1><img src="${resource(dir:'images/icons/silk',file:'error.png')}" style="vertical-align: middle"/> Expiring Stock</h1>
							</div>
							<div class="list">
								
								<table>
				                    <thead>
				                        <tr>   
											<th><warehouse:message code="item.label"/></th>
											<th><warehouse:message code="inventory.lotNumber.label"/></th>
											<th><warehouse:message code="inventory.expires.label"/></th>
											<th class="center"><warehouse:message code="default.qty.label"/></th>
				                        </tr>
				                    </thead>
				       	           	<tbody>			
				       	     			<g:set var="counter" value="${0 }" />
										<g:each var="inventoryItem" in="${expiringStock}" status="i">           
											<g:set var="quantity" value="${quantityMap[inventoryItem] }"/>
											
											<tr class="${(counter++ % 2) == 0 ? 'odd' : 'even'}">            
												<td>
													<g:link controller="inventoryItem" action="showStockCard" params="['product.id':inventoryItem?.product?.id]">
														${inventoryItem.product.name } 
														<span class="fade">${inventoryItem.product.category.name } </span>
													</g:link>
													
												</td>
												<td>
													${inventoryItem.lotNumber }
												</td>
												<td>
													<g:formatDate date="${inventoryItem?.expirationDate}" format="MMM yyyy"/>
													<%-- 
													${prettyDateFormat(date: inventoryItem.expirationDate)}
													--%>
													
												</td>
												<td class="center">
													${quantity }
												</td>									
											</tr>											
										</g:each>
									</tbody>
								</table>				
							</div>
							<br/><br/>
							<g:if test="${!excludeExpired }">
								<div style="padding: 10px;">
									<h1><img src="${resource(dir:'images/icons/silk',file:'exclamation.png')}" style="vertical-align: middle"/> Expired Stock </h1>
								</div>
								<div class="list">
								
									<table>
					                    <thead>
					                        <tr>                           	
						                        <%--<th width="2%">Actions</th> --%>
												<th><warehouse:message code="inventory.item.label"/></th>
												<th><warehouse:message code="inventory.lotNumber.label"/></th>
												<th><warehouse:message code="inventory.expired.label"/></th>
												<th class="center"><warehouse:message code="inventory.quantity.label"/></th>
					                        </tr>
					                    </thead>
					       	           	<tbody>			
						       	           	<g:set var="counter" value="${0 }" />	
											<g:each var="inventoryItem" in="${expiredStock}" status="i">     
												<g:set var="quantity" value="${quantityMap[inventoryItem] }"/>							
												<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">            
													<td>
														<g:link controller="inventoryItem" action="showStockCard" params="['product.id':inventoryItem?.product?.id]">
															<format:product product="${inventoryItem.product}"/>
															<span class="fade">${inventoryItem.product.category.name } </span>
														</g:link>
													</td>
													<td>
														${inventoryItem.lotNumber }
													</td>
													<td>
														${prettyDateFormat(date: inventoryItem.expirationDate)}
													</td>
													<td class="center">
														${quantity }
													</td>
												</tr>
											</g:each>
										</tbody>
									</table>
								</div>
								<br/><br/>
							</g:if>							
							
						</td>
					</tr>			
				</table>
			</fieldset>		
		</div>
		
	</body>

</html>