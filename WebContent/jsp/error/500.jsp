<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<div class="container" style="text-align: center; padding: 10rem 2rem;">
    <h1 style="font-size: 8rem; color: #ef4444; margin: 0;">500</h1>
    <h2 style="margin-bottom: 1.5rem;">System Error</h2>
    <p style="color: var(--text-muted); margin-bottom: 3rem; font-size: 1.1rem;">An internal error occurred. Our engineers have been notified.</p>
    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Try Refreshing</a>
</div>

<%@ include file="../common/footer.jsp" %>
