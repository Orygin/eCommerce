<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/importTags.jsp" %>

	<!-- Pets -->
	<div class="categories">
		<div class="container">
			<c:forEach items="${categories}" var="c">
				<div class="col-md-2 focus-grid">
					<a href="${c.translatedCategory.categoryId}">
						<div class="focus-border">
							<div class="focus-layout">
								<div class="focus-image"><i class="fa fa-${c.translatedCategory.icon}"></i></div>
								<h4 class="clrchg">${c.categoryTranslation}</h4>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="total-ads main-grid-border">
		<div class="container">
			<!--  div class="select-box">
				
				<div class="browse-category ads-list">
					<select class="selectpicker show-tick" data-live-search="true">
					  <option data-tokens="Pets">Potions et Poudres</option>
					  <option data-tokens="Mobiles">Pierre Précieuses et Oeufs</option>
					  <option data-tokens="Electronics & Appliances">Objets uniques</option>
					  <option data-tokens="Cars">Baguettes</option>
					  <option data-tokens="Bikes">Grimoires et Parchemins</option>
					  <option data-tokens="Furniture">Plantes</option>
					</select>
				</div>
				<div class="search-product ads-list">
					<label>Rechercher </label>
					<div class="search">
						<div id="custom-search-input">
							<div class="input-group">
								<input type="text" class="form-control input-lg" placeholder="Pierre philosophale" />
								<span class="input-group-btn">
									<button class="btn btn-info btn-lg" type="button">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div-->
			<ol class="breadcrumb" style="margin-bottom: 5px;">
			  <li><a href="../index">Accueil</a></li>
			  <li class="active">${category.categoryTranslation}</li>
			</ol>
			<div class="ads-grid">
				<div class="side-bar col-md-3">
					<div class="search-hotel">
					<h3 class="sear-head">Name contains</h3>
					<form>
						<input type="text" value="Product name..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Product name...';}" required="">
						<input type="submit" value=" ">
					</form>
				</div>
				
				<div class="range">
					<h3 class="sear-head">Price range</h3>
							<ul class="dropdown-menu6">
								<li>
									                
									<div id="slider-range"></div>							
										<input type="text" id="amount" style="border: 0; color: #ffffff; font-weight: normal;" />
									</li>			
							</ul>
							<!---->
							<script type="text/javascript" src="<spring:url value='/js/jquery-ui.js' />"></script>
							<script type='text/javascript'>//<![CDATA[ 
							$(window).load(function(){
							 $( "#slider-range" ).slider({
										range: true,
										min: 0,
										max: 9000,
										values: [ 50, 6000 ],
										slide: function( event, ui ) {  $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
										}
							 });
							$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );

							});//]]>  

							</script>
							
				</div>
				
				</div>
				<div class="ads-display col-md-9">
					<div class="wrapper">					
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					  <!-- ul id="myTab" class="nav nav-tabs nav-tabs-responsive" role="tablist">
						<li role="presentation" class="active">
						  <a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">
							<span class="text">All Ads</span>
						  </a>
						</li>
						<li role="presentation" class="next">
						  <a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">
							<span class="text">Ads with Photos</span>
						  </a>
						</li>
					  </ul -->
					  <div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
						   <div>
												<div id="container">
								<div class="view-controls-list" id="viewcontrols">
									<label>view :</label>
									<a class="gridview"><i class="glyphicon glyphicon-th"></i></a>
									<a class="listview active"><i class="glyphicon glyphicon-th-list"></i></a>
								</div>
								<div class="sort">
								   <div class="sort-by">
										<label>Sort By : </label>
										<select>
														<option value="">Most recent</option>
														<option value="">Price: Rs Low to High</option>
														<option value="">Price: Rs High to Low</option>
										</select>
									   </div>
									 </div>
								<div class="clearfix"></div>
							<ul class="list">
								<c:forEach items="${products}" var="p">
									<a href="<spring:url value='/single/${p.productId}' />">
										<li>
										<img src="<spring:url value='/images/products/${image[p.productId].path}' />" title="${image[p.productId].name}" alt="${image[p.productId].name}" />
										<section class="list-left">
										<h5 class="title">${p.name}</h5>
										<span class="adprice">€ ${p.unitPrice}</span>
										</section>
										<section class="list-right">
										<span class="date">Ref : C${p.category.categoryId}A${p.productId}</span>
										<c:choose>
										    <c:when test="${p.storedQuantity > 0}">
										        <span class="cityname">En stock</span>
										    </c:when>    
										    <c:otherwise>
										        <span class="cityname">Plus disponible</span>
										    </c:otherwise>
										</c:choose>										
										</section>
										<div class="clearfix"></div>
										</li> 
									</a>
								</c:forEach>
							</ul>
						</div>
							</div>
						</div>
						
					</div>
				</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>	
	</div>
	<!-- // Pets -->
	
