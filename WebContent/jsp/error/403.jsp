<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<div class="container" style="text-align: center; padding: 10rem 2rem;">
    <h1 style="font-size: 8rem; margin-bottom: 0;">403</h1>
    <h2 style="margin-bottom: 2rem;">Access Denied</h2>
    <p style="color: var(--text-muted); margin-bottom: 3rem;">You do not have the necessary permissions to access this secure sector.</p>
    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Return to Base</a>
</div>

<%@ include file="../common/footer.jsp" %>
