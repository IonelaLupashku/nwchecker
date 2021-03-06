<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<spring:url value="/resources/" var="resources" />

<html>
    <div class="main-block">
        <c:forEach items="${ruleList}" var="rule" varStatus="vs">
            <dl>
                <dt>
                    ${rule.typeContest.name}
                    <security:authorize access="hasRole('ROLE_TEACHER')">
                        <button class="btn btn-sm btn-info" style="float: right"
                                data-toggle="modal" data-target="#myModal_${vs.index}"><spring:message code="rules.editButton.caption" /></button>
                    </security:authorize>
                </dt>
                <dd>
                    <p>${rule.content}</p>
                </dd>
            </dl>
            <security:authorize access="hasRole('ROLE_TEACHER')">
                <%--modal windows--%>
                <div class="modal" id="myModal_${vs.index}" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="editRule.do" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">&times;</button>
                                    <h2 class="modal-title" align="center">${rule.typeContest.name}</h2>
                                </div>
                                <div class="modal-body">
                                    <input name="id" hidden="true" value="${rule.id}"/>
                                    <p><textarea name="content" class="list-group-area" >${rule.content}</textarea></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">
                                        <spring:message code="rules.submitButton.caption" />
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <%--end modal windows--%>
            </security:authorize>
        </c:forEach>
    </div>
</html>
