<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta name="description" content="네이버 예약, 네이버 예약이 연동된 곳 어디서나 바로 예약하고, 네이버 예약 홈(나의예약)에서 모두 관리할 수 있습니다.">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
		<title>네이버 예약</title>
		<link href="resource/css/style.css" rel="stylesheet">
	    <script src="resource/js/util.js" type="text/javascript" charset="UTF-8"></script>
	    <script src="resource/js/myreservationpage.js" type="text/javascript" charset="UTF-8"></script>
	    <script src="resource/js/jquery-3.6.0.min.js" type="text/javascript"></script>
	    <script src="resource/js/handlebars-v4.7.7.js" type="text/javascript"></script>
	</head>

	<body>
		<div id="container">
			<div class="header">
				<header class="header_tit">
					<h1 class="logo">
						<a href="/reservation" class="lnk_logo" title="네이버"> <span class="spr_bi ico_n_logo">네이버</span> </a>
						<a href="/reservation" class="lnk_logo" title="예약"> <span class="spr_bi ico_bk_logo">예약</span> </a>
					</h1>
					<a href="#"  onclick="return false;" class="btn_my"> <span title="내예약" class="viewReservation">${sessionScope.resrvEmail}</span> </a>
				</header>
			</div>
			<hr>
			<div class="ct">
				<div class="section_my">
					<!-- 예약 현황 -->
					<div class="my_summary">
						<ul class="summary_board">
							<li class="item">
								<!--[D] 선택 후 .on 추가 link_summary_board -->
								<a class="link_summary_board on"> 
									<i class="spr_book2 ico_book2"></i> 
									<em class="tit">전체</em> 
									<span id="total" class="figure">6</span> 
								</a>
							</li>
							<li class="item">
								<a class="link_summary_board"> <i class="spr_book2 ico_book_ss"></i> <em class="tit">이용예정</em> <span id="preuse"class="figure">2</span> </a>
							</li>
							<li class="item">
								<a class="link_summary_board"> <i class="spr_book2 ico_check"></i> <em class="tit">이용완료</em> <span id="completion" class="figure">2</span> </a>
							</li>
							<li class="item">
								<a class="link_summary_board"> <i class="spr_book2 ico_back"></i> <em class="tit">취소·환불</em> <span id="cancel" class="figure">2</span> </a>
							</li>
						</ul>
					</div>
					<!--// 예약 현황 -->
		
					<!-- 내 예약 리스트 -->
					<div class="wrap_mylist">
						<ul class="list_cards" ng-if="bookedLists.length > 0">
							<!-- 예약확정 -->
							<li class="card confirmed">
								<div class="link_booking_details">
									<div class="card_header">
										<div class="left"></div>
										<div class="middle">
											<i class="spr_book2 ico_check2"></i>
											<span class="tit">예약 확정</span>
										</div>
										<div class="right"></div>
									</div>
								</div>
									<!-- bindTemplate -->
							</li>
							
							<!-- 이용완료 -->
							<li class="card used">
								<div class="link_booking_details">
									<div class="card_header">
										<div class="left"></div>
										<div class="middle">
											<i class="spr_book2 ico_check2"></i>
											<span class="tit">이용 완료</span>
										</div>
										<div class="right"></div>
									</div>
								</div>
								<!-- bindTemplate -->
							</li>
							
							<!-- 취소된 예약 -->
							<li class="card used cancel">
								<div class="link_booking_details">
									<div class="card_header">
										<div class="left"></div>
										<div class="middle">
											<i class="spr_book2 ico_cancel"></i>
											<span class="tit">취소된 예약</span>
										</div>
										<div class="right"></div>
									</div>
								</div>
								<!-- bindTemplate -->
							</li>
						</ul>
					</div>
					<!--// 내 예약 리스트 -->
				</div>
			</div>
			<hr>
		</div>
		<footer>
			<div class="gototop">
				<a href="#" onclick="return false;" class="lnk_top"> <span class="lnk_top_text">TOP</span> </a>
			</div>
			<div id="footer" class="footer">
				<p class="dsc_footer">네이버(주)는 통신판매의 당사자가 아니며, 상품의정보, 거래조건, 이용 및 환불 등과 관련한 의무와 책임은 각 회원에게 있습니다.</p>
				<span class="copyright">© NAVER Corp.</span>
			</div>
		</footer>
			<div class="popup_booking_wrapper" style="display:none;">
				<div class="dimm_dark" style="display:block"></div>
				<div class="popup_booking refund">
					<h1 class="pop_tit">
						<span class="popup_tit"></span>
						<small class="sm"></small>
					</h1>
					<div class="nomember_alert">
						<p>취소하시겠습니까?</p>
					</div>
					<div class="pop_bottom_btnarea">
						<div class="btn_gray">
							<a href="#" onclick="return false;" class="btn_bottom"><span>아니오</span></a>
						</div>
						<div class="btn_green">
							<a href="#" onclick="return false;" class="btn_bottom"><span>예</span></a>
						</div>
					</div>
					<!-- 닫기 -->
					<a href="#" onclick="return false;" class="popup_btn_close" title="close">
						<i class="spr_book2 ico_cls"></i>
					</a>
					<!--// 닫기 -->
				</div>
			</div>
		<script type="template" id="reservationInfoItem">
			<article class="card_item">
				<a href="#" onclick="return false;" class="link_booking_details">
					<div class="card_body">
						<div class="left"></div>
						<div class="middle">
							<div class="card_detail">
								<em class="booking_number" value="{{reservationInfoId}}">No.{{reservationInfoId}}</em>
								<h4 class="tit" value="{{displayInfoId}}">{{displayInfo.productDescription}}</h4>
								<ul class="detail">
									<li class="item">
										<span class="item_tit">예약일</span>
										<em class="item_dsc resrv_date">
											{{reservationDate}}
										</em>
									</li>
									<li class="item">
										<span class="item_tit">내역</span>
										<em class="item_dsc">
											내역이 없습니다.
										</em>
									</li>
									<li class="item">
										<span class="item_tit">장소</span>
										<em class="item_dsc">
											{{displayInfo.placeLot}}
										</em>
									</li>
									<li class="item">
										<span class="item_tit">업체</span>
										<em class="item_dsc">
											{{displayInfo.placeName}}
										</em>
									</li>
								</ul>
								<div class="price_summary">
									<span class="price_tit">결제 예정금액</span>
									<em class="price_amount">
										<span>{{totalPrice}}</span>
										<span class="unit">원</span>
									</em>
								</div>
								<!-- [D] 예약 신청중, 예약 확정 만 취소가능, 취소 버튼 클릭 시 취소 팝업 활성화 -->
								<div class="booking_cancel">
									<button class="btn {{btnType}}"><span class="{{btnType}}">{{changeType}}</span></button>
								</div>
							</div>
						</div>
						<div class="right"></div>
					</div>
					<div class="card_footer">
						<div class="left"></div>
						<div class="middle"></div>
						<div class="right"></div>
					</div>
				</a>
				<a href="#" class="fn fn-share1 naver-splugin btn_goto_share" title="공유하기"></a>
			</article>
		</script>

		<script type="template" id="errTemplate">
				<div class="err"> 
					<i class="spr_book ico_info_nolist"></i>
					<h1 class="tit">리스트가 없습니다</h1>
				</div>
		</script>
		<script type="template" id="cancelPopUpTemplate">
			<div class="popup_booking_wrapper" style="display:none;">
				<div class="dimm_dark" style="display:block"></div>
				<div class="popup_booking refund">
					<h1 class="pop_tit">
						<span>{{displayInfo.productDescription}}</span>
						<small class="sm">{{reservationDate}}(일)</small>
					</h1>
					<div class="nomember_alert">
						<p>취소하시겠습니까?</p>
					</div>
					<div class="pop_bottom_btnarea">
						<div class="btn_gray">
							<a href="#" class="btn_bottom"><span>아니오</span></a>
						</div>
						<div class="btn_green">
							<a href="#" class="btn_bottom"><span>예</span></a>
						</div>
					</div>
					<!-- 닫기 -->
					<a href="#" class="popup_btn_close" title="close">
						<i class="spr_book2 ico_cls"></i>
					</a>
					<!--// 닫기 -->
				</div>
			</div>
		</script>
	</body>
</html>