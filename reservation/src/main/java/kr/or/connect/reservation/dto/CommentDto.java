package kr.or.connect.reservation.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CommentDto {
	private String comment;
	private int commentId;
	private List<CommentImageDto> commentImages; 
	private LocalDateTime createDate;
	private LocalDateTime modifyDate;
	private int productId;
	private LocalDateTime reservationDate;
	private String reservationEmail;
	private int reservationInfoId;
	private String reservationName;
	private String reservationTelephone;
	private int score;
	
	public CommentDto() {
		this.commentImages = new ArrayList<CommentImageDto>();
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public List<CommentImageDto> getCommentImages() {
		return commentImages;
	}
	public void setCommentImages(List<CommentImageDto> commentImages) {
		this.commentImages = commentImages;
	}
	public LocalDateTime getCreateDate() {
		return createDate;
	}
	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}
	public LocalDateTime getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(LocalDateTime modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public LocalDateTime getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(LocalDateTime reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getReservationEmail() {
		return reservationEmail;
	}
	public void setReservationEmail(String reservationEmail) {
		this.reservationEmail = reservationEmail;
	}
	public int getReservationInfoId() {
		return reservationInfoId;
	}
	public void setReservationInfoId(int reservationInfoId) {
		this.reservationInfoId = reservationInfoId;
	}
	public String getReservationName() {
		return reservationName;
	}
	public void setReservationName(String reservationName) {
		this.reservationName = reservationName;
	}
	public String getReservationTelephone() {
		return reservationTelephone;
	}
	public void setReservationTelephone(String reservationTelephone) {
		this.reservationTelephone = reservationTelephone;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}		
	public void pushItmes(List<CommentImageDto> items) {
		if(items == null)
			this.commentImages=null;
		else
			this.commentImages.addAll(items);
	}
	
	@Override
	public String toString() {
		return "CommentDto [comment=" + comment + ", commentId=" + commentId + ", commentImages=" + commentImages
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", productId=" + productId
				+ ", reservationDate=" + reservationDate + ", reservationEmail=" + reservationEmail
				+ ", reservationInfoId=" + reservationInfoId + ", reservationName=" + reservationName
				+ ", reservationTelephone=" + reservationTelephone + ", score=" + score + "]";
	}	
}