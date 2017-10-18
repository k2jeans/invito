<%@ page import="com.google.zxing.qrcode.QRCodeWriter, com.google.zxing.common.BitMatrix, com.google.zxing.BarcodeFormat, com.google.zxing.client.j2se.MatrixToImageWriter" %>





<%
	QRCodeWriter q = new QRCodeWriter();

	String text = request.getParameter("data");

	if( text == null ) {
		text = "";
	}

	int width = 200;

	String strWidth = request.getParameter("width");

	if( strWidth != null ) {
		width = Integer.parseInt(strWidth);
	}

	int height = 200;

	String strHeight = request.getParameter("height");

	if( strHeight != null ) {
		height = Integer.parseInt(strHeight);
	}
	
	//text = new String(text.getBytes("UTF-8"), "ISO-8859-1");
	
	BitMatrix bitMatrix = q.encode(text, BarcodeFormat.QR_CODE, width, height);

	out.clear(); // clear buffer

	ServletOutputStream outputStream = response.getOutputStream();

	MatrixToImageWriter.writeToStream(bitMatrix, "png", outputStream);

	outputStream.flush();
	outputStream.close();
%>