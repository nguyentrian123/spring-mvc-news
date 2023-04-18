<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><dec:title default="Trang chủ" /></title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="<c:url value='/template/web/css/small-business.css'/>" rel="stylesheet" type="text/css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <!-- MDB -->
    <link rel="stylesheet" href="<c:url value='/template/category/css/mdb.min.css'/>" />
   
    <link rel="stylesheet" href="<c:url value='/template/category/css/style.css'/>" />
    
    <!-- NewDetail -->
     <link rel="manifest" href="site.webmanifest">
	 <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/template/new/assets/img/favicon.ico'/>">

		<!-- CSS here -->
            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/bootstrap.min.css'/>">
            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/owl.carousel.min.css'/>">

            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/ticker-style.css'/>">

            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/flaticon.css'/>">

            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/slicknav.css'/>">
            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/animate.min.css'/>">
            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/magnific-popup.css'/>">
            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/fontawesome-all.min.css'/>">
            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/themify-icons.css'/>">
            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/slick.css'/>">
            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/nice-select.css'/>">
            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/style.css'/>">
            <link rel="stylesheet" href="<c:url value='/template/new/assets/css/responsive.css'/>">
     <!-- NewDetail -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
    
     <!-- sweetalert -->
    <script  src="<c:url value='/template/admin/sweetalert/sweetalert2.min.js' />"></script>
    <link rel="stylesheet" href="<c:url value='/template/admin/sweetalert/sweetalert2.min.css' />" />
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/common/web/header.jsp" %>

	<dec:body/>

	<!-- Footer -->
	<%@ include file="/common/web/footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value='/template/web/vendor/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	
	<!-- MDB -->
    <script type="text/javascript" src="<c:url value='/template/category/js/mdb.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/template/category/js/script.js'/>"></script>
    
    
    <!-- newDetail -->
    <script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js' />"></script>
    <!-- All JS Custom Plugins Link Here here -->
        <script src="<c:url value='/template/new/assets/js/vendor/modernizr-3.5.0.min.js'/>"></script>
		
		<!-- Jquery, Popper, Bootstrap -->
		<script src="<c:url value='/template/new/assets/js/vendor/jquery-1.12.4.min.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/popper.min.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/bootstrap.min.js'/>"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="<c:url value='/template/new/assets/js/jquery.slicknav.min.js'/>"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="<c:url value='/template/new/assets/js/owl.carousel.min.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/slick.min.js'/>"></script>
        <!-- Date Picker -->
        <script src="<c:url value='/template/new/assets/js/gijgo.min.js'/>"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="<c:url value='/template/new/assets/js/wow.min.js'/>"></script>
		<script src="<c:url value='/template/new/assets/js/animated.headline.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/jquery.magnific-popup.js'/>"></script>

        <!-- Breaking New Pluging -->
        <script src="<c:url value='/template/new/assets/js/jquery.ticker.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/site.js'/>"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="<c:url value='/template/new/assets/js/jquery.scrollUp.min.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/jquery.nice-select.min.js'/>"></script>
		<script src="<c:url value='/template/new/assets/js/jquery.sticky.js'/>"></script>
        
        <!-- contact js -->
        <script src="<c:url value='/template/new/assets/js/contact.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/jquery.form.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/jquery.validate.min.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/mail-script.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/jquery.ajaxchimp.min.js'/>"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="<c:url value='/template/new/assets/js/plugins.js'/>"></script>
        <script src="<c:url value='/template/new/assets/js/main.js'/>"></script>
        
        <!-- Pagiation -->
        <script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js' />"></script>
</body>
</html>