<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<div style="text-align: center; padding: 6rem 0;">
    <div style="font-size: 6rem; color: var(--error); margin-bottom: 2rem;">
        <i class="fas fa-user-shield"></i>
    </div>
    <h1 style="font-size: 3rem;">Access Denied</h1>
    <p style="color: var(--text-muted); font-size: 1.2rem; margin-bottom: 2.5rem;">You don't have permission to access this resource.</p>
    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Go back home</a>
</div>

<%@ include file="../common/footer.jsp" %>
