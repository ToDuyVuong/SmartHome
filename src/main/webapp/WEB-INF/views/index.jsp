<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="listTopHotArt" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<jsp:useBean id="listArtByView" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<jsp:useBean id="listNewArt" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<jsp:useBean id="listTopByCat" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<t:main>
    <jsp:body>
        <div class="noibat">
            <div class="largeTitle">Tin nổi bật</div>
            <div class="groupCard">
                <c:forEach items="${listTopHotArt}" var="lh">
                    <div class="cardInfo">
                        <img class="cardImg" src="${pageContext.request.contextPath}/public/HinhAnh/${lh.id_article}/tieude.png" alt="Card image cap">
                        <div class="card-body">
                            <h5 >
                                <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${lh.id_article}">${lh.title}</a>
                            </h5>
                            <c:choose>
                                <c:when test="${lh.parent_id eq 0}">
                                    <span class="cardCategory">${lh.cat_name}</span>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${listCat}" var="c">
                                        <c:if test="${c.id eq lh.parent_id}">
                                            <span class="cardCategory">${c.name}</span>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                            <p class="card-text"><small class="text-muted">Ngày đăng: ${lh.publish_date}</small></p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="new-views">
            <div class="left">
                <div class="newPost">
                    <div class="largeTitle">Tin mới</div>
                    <c:forEach items="${listNewArt}" var="ln">
                        <div class="horizontalCard">
                            <img src="${pageContext.request.contextPath}/public/HinhAnh/${ln.id_article}/tieude.png" alt="" class="cardHorizontalImg">
                            <div class="cardHorizontal-Body">
                                <h5 >
                                    <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${ln.id_article}">${ln.title}</a>
                                </h5>
                                <c:choose>
                                    <c:when test="${ln.parent_id eq 0}">
                                        <span class="cardCategory">${ln.cat_name}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${listCat}" var="c">
                                            <c:if test="${c.id eq ln.parent_id}">
                                                <span class="cardCategory">${c.name}</span>
                                            </c:if>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>

                                <p class="card-text"><small class="text-muted">Ngày đăng: ${ln.publish_date }</small></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="top10">
                    <div class="largeTitle">Top 10 chuyên mục</div>
                    <c:forEach items="${listTopByCat}" var="ltc">
                        <div class="horizontalCard">
                            <img src="${pageContext.request.contextPath}/public/HinhAnh/${ltc.id_article}/tieude.png" alt="" class="cardHorizontalImg">
                            <div class="cardHorizontal-Body">
                                <h5 >
                                    <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${ltc.id_article}">${ltc.title}</a>
                                </h5>
                                <c:choose>
                                    <c:when test="${ltc.parent_id eq 0}">
                                        <span class="cardCategory">${ltc.cat_name}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${listCat}" var="c">
                                            <c:if test="${c.id eq ltc.parent_id}">
                                                <span class="cardCategory">${c.name}</span>
                                            </c:if>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                <p class="card-text"><small class="text-muted">Ngày đăng: ${ltc.publish_date }</small></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>

            <div class="topViews">
                <img class="topViewBg" src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="Card image cap">

                <div class="largeTitle smallTitle">Tin xem nhiều nhất</div>
                <c:forEach items="${listArtByView}" var="la">
                    <div class="horizontalCard smallCard">
                        <img src="${pageContext.request.contextPath}/public/HinhAnh/${la.id_article}/tieude.png" alt="" class="cardHorizontalImg">
                        <div class="cardHorizontal-Body">
                            <h5 >
                                <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${la.id_article}">${la.title}</a>
                            </h5>
                            <c:choose>
                                <c:when test="${la.parent_id eq 0}">
                                    <span class="cardCategory">${la.cat_name}</span>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${listCat}" var="c">
                                        <c:if test="${c.id eq la.parent_id}">
                                            <span class="cardCategory">${c.name}</span>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                            <p class="card-text"><small class="text-muted">Ngày đăng: ${la.publish_date }</small></p>
                        </div>
                    </div>
                </c:forEach>


            </div>

        </div>
    </jsp:body>
</t:main>

