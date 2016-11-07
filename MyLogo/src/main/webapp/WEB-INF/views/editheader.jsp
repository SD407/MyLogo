<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="authbar lead" style=" margin-left: -15;">
	<span>Hi, <strong>${loggedinuser}</strong>, you're about to edit </span>
	<strong><c:out value='${username}' /></strong><span>'s details below.</span> 
</div>
