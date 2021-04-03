<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

 <div class="container-fluid item_mt-18">
        <!---carousel-->
            <div class="col-lg text_center_sort item_mt-05" >
               <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                   <ol class="carousel-indicators">
                     <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                     <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                     <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                   </ol>
                   <div class="carousel-inner">
                     <div class="carousel-item active">
                       <img class="item_height_350r item_width_100" src="<%=application.getContextPath()%>/resources/image/slide/slide1.jpg" alt="First slide">
                     </div>
                     <div class="carousel-item">
                       <img class="item_height_350r item_width_100" src="<%=application.getContextPath()%>/resources/image/slide/slide2.jpg" alt="Second slide">
                     </div>
                     <div class="carousel-item">
                       <img class="item_height_350r item_width_100" src="<%=application.getContextPath()%>/resources/image/slide/slide3.jpg" alt="Third slide">
                     </div>
                   </div>
                   <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                     <span class="sr-only">Previous</span>
                   </a>
                   <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                     <span class="carousel-control-next-icon" aria-hidden="true"></span>
                     <span class="sr-only">Next</span>
                   </a>
                 </div>
             </div>
              <!-----category image-->
              <div class="col" >
                  <div class="row  justify-content-center p-10 item_mt-10">
                      <div class="col text_center_sort">
                           <a href="<%=application.getContextPath()%>/product/product_list_user?pageNo=1&pcategory=1&pcategoryname=인테리어조명&sort=0"><img class="item_width_90 item_height_180r" src="<%=application.getContextPath()%>/resources/image/button/lamp1.jpg" alt=""></a>
                           <div onclick="move_page('<%=application.getContextPath()%>/product/product_list_user?pageNo=1&pcategory=1&pcategoryname=인테리어조명&sort=0')" class="pointer" style="position: absolute; top:45%; left: 28%; color: white;"><h3>인테리어 조명</h3></div>
                      </div>
                      <div class="col text_center_sort">
                           <a href="<%=application.getContextPath()%>/product/product_list_user?pageNo=1&pcategory=2&pcategoryname=디퓨저/캔들&sort=0"><img class="item_width_90 item_height_180r" src="<%=application.getContextPath()%>/resources/image/button/candle1.jpg" alt=""></a>
                           <div onclick="move_page('<%=application.getContextPath()%>/product/product_list_user?pcategory=2&pcategoryname=디퓨저/캔들&sort=0')" class="pointer" style="position: absolute; top:45%; left: 32%; color: white;"><h3>디퓨저/캔들</h3></div>
                      </div>
                      <div class="col text_center_sort">
                            <a href="<%=application.getContextPath()%>/product/product_list_user?pageNo=1&pcategory=3&pcategoryname=액자&sort=0"><img class="item_width_90 item_height_180r" src="<%=application.getContextPath()%>/resources/image/button/photo1.jpg" alt=""></a>   
                            <div onclick="move_page('<%=application.getContextPath()%>/product/product_list_user?pageNo=1&pcategory=3&pcategoryname=액자&sort=0')" class="pointer" style="position: absolute; top:45%; left: 45%; color: white;"><h3>액자</h3></div>
                      </div>
                      <div class="col text_center_sort">
                            <a href="<%=application.getContextPath()%>/product/product_list_user?pageNo=1&pcategory=4&pcategoryname=조화/화병&sort=0"><img class="item_width_90 item_height_180r" src="<%=application.getContextPath()%>/resources/image/button/plant.jpg" alt=""></a>
                            <div onclick="move_page('<%=application.getContextPath()%>/product/product_list_user?pageNo=1&pcategory=4&pcategoryname=조화/화병&sort=0')" class="pointer" style="position: absolute; top:45%; left: 33%; color: white;"><h3>조화/화병</h3></div>
                      </div>
                  </div>
              </div>
              <!---- about us-->
                      <div class="col-lg item_mt-10 text_center_sort" >
                           <a href="<%=application.getContextPath()%>/company/about_us"><img class="item_width_100 item_height_350r item_mt-1" src="<%=application.getContextPath()%>/resources/image/slide/aboutus.png"alt=""></a>
                     </div>
              <!------best item-->
              
              <div class="col item_mt-10" >
                   <div class="row" style="cursor: pointer;" onclick="move_page('<%=application.getContextPath()%>/product/product_list_user?pageNo=1&pcategory=0&pcategoryname=Best&sort=5')">
                       <h3 class="aft col-2 text_end_sort">Best</h3>    
                   </div>
                   <div class="row justify-content-center">
                        <c:forEach var="best" items="${best}">
                         <div class="col-2 align-self-start text_center_sort pointer" onclick="move_page('<%=application.getContextPath()%>/product/product_view_user?productno=${best.productno}')">
                             <div class="card item_width_13r" >
                               <img class="card-img-top item_width_100 item_height_110r"  src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${best.isavename}&type=${best.imgtype}" alt="Card image cap">
                               <div class="row align-self-center item_width_100 item_pb-1">
                                   <div class="col-lg" >
                                       <div class="item_list fontsize-sm"><span>${best.pname}</span></div>
                                       <div class="fontsize-xsm text_start_sort"><span>${best.pprice}</span></div>
                                       <div class="fontsize-xsm text_start_sort"><span><fmt:formatDate value="${best.pregisterdate}" pattern="yyyy-MM-dd"/></span></div>
                                       <div class="fontsize-xsm text_start_sort"><span class="badge badge-secondary">Best</span></div>
                                   </div>
                                   
                               </div>
                             </div>
                         </div>
                     </c:forEach>    
                         
                         
                     </div>
                </div>
                <!------ new item-->
                <div class="col item_mt-4">
                   <div class="row" style="cursor: pointer;"onclick="move_page('<%=application.getContextPath()%>/product/product_list_user?pageNo=1&pcategory=0&pcategoryname=New&sort=6')" >
                       <h3 class="aft col-2 text_end_sort">NEW</h3>
                   </div>
                   <div class="row justify-content-center" >
                   <c:forEach var="newitem" items="${newitem}">
                        <div class="col-2 align-self-start text_center_sort pointer" onclick="move_page('<%=application.getContextPath()%>/product/product_view_user?productno=${newitem.productno}')">
                            <div class="card item_width_13r" >
                            <img class="card-img-top item_width_100 item_height_110r"  src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${newitem.isavename}&type=${newitem.imgtype}" alt="Card image cap">
                            <div class="row align-self-center item_width_100 item_pb-1">
                                <div class="col-lg" >
                                    <div class="item_list fontsize-sm"><span>${newitem.pname}</span></div>
                                    <div class="fontsize-xsm text_start_sort"><span>${newitem.pprice}</span></div>
                                    <div class="fontsize-xsm text_start_sort"><span><fmt:formatDate value="${newitem.pregisterdate}" pattern="yyyy-MM-dd"/></span></div>
                                    <div class="fontsize-xsm text_start_sort"><span class="badge badge-secondary">New</span></div>
                                </div>
                                
                            </div>
                            </div>
                        </div>
                      </c:forEach>   
                   </div>
                  
                </div>
                <!----newitem-->
                <!----video-->
                <div class="row justify-content-center item_mt-2" >
                    <div class="col-12 text_center_sort" style="background-color: white; ">
                       <img src="<%=application.getContextPath()%>/resources/image/youtubelogo_sihyun.png" alt="" width="100">
                    </div>
                    <div class="col-12 text_center_sort" >
                       <video width="400" controls>
                           <source src="#" type="video/mp4">
                           Your browser does not support HTML video.
                         </video>
                    </div>
                </div>   
              </div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
       	
             