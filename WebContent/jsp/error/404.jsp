<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<div class="container" style="text-align: center; padding: 10rem 2rem;">
    <h1 style="font-size: 8rem; color: var(--primary); margin: 0;">404</h1>
    <h2 style="margin-bottom: 1.5rem;">Resource Not Found</h2>
    <p style="color: var(--text-muted); margin-bottom: 3rem; font-size: 1.1rem;">The page you are looking for has been moved or decommissioned.</p>
    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Go to Home</a>
</div>

<%@ include file="../common/footer.jsp" %>
