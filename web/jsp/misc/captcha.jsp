<%@page contentType="text/html" pageEncoding="UTF-8" autoFlush="true"%>
<%@ page import="java.io.*"%>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="java.util.*"%>

<%
try{
    int width=80;
    int height=30;
    Random rdm=new Random();
    int rl=rdm.nextInt();
    String hash1 = Integer.toHexString(rl);
    String capstr=hash1.substring(0,5);
    session.setAttribute("keycap",capstr);
    Color background = new Color(255,255,255);
    Color fbl = new Color(0,100,0);
    Font fnt=new Font("SansSerif",1,17);
    BufferedImage cpimg =new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
    Graphics g = cpimg.createGraphics();
    g.setColor(background);
    g.fillRect(0,0,width,height);
    g.setColor(fbl);
    g.setFont(fnt);
    g.drawString(capstr,15,20);
    g.setColor(background);
    g.drawLine(50,17,80,17);
    g.drawLine(50,22,80,22);
    response.setContentType("image/jpeg");
    ServletOutputStream strm = response.getOutputStream();
    ImageIO.write(cpimg,"jpeg",strm);
    cpimg.flush();
    strm.flush();
    strm.close();
}catch (Exception ex){
    out.println(ex.getMessage());
}
%>
