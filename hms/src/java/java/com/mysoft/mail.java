/*
 * mail.java
 *
 * Created on May 13, 2007, 12:03 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mysoft;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author djorj
 */
public class mail {
    
    /** Creates a new instance of mail */
    public mail() {
    }
    
    /*
     *  0 - username
     *  1 - password
     *  2 - from
     *  3 - to
     *  4 - smtpHost
     *  5 - smtpPort
     *  6 - subject
     *  7 - content
     *  8 - fileAttachment
     *  9 - fname
     */
    public static void main(String[] a)
    {
    try{

        tryMail(120,4,a[4], a[5], a[0], a[1], a[2], a[3], a[6], a[7], a[8], a[9]);
      }catch(Exception e){e.printStackTrace();}
    }

    public static class SmtpAuthenticator extends javax.mail.Authenticator {
        private String username;
        private String password;
        public SmtpAuthenticator(String username,String password) {
            this.username = username;
            this.password = password;
        }
        public javax.mail.PasswordAuthentication getPasswordAuthentication() {
            return new javax.mail.PasswordAuthentication(username,password);
        }
    }
    
    public static boolean sendMail(String smtp, String port, String uname, String pass, String from, String to, String subject, String content, String fileAttachment, String fname) {
        boolean bret = true;
        try{
            java.util.Properties props = new java.util.Properties();
            props.put("mail.smtp.host", smtp);
            props.put("mail.smtp.port", port);
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.socketFactory.port", port);
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.socketFactory.fallback", "false");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.ssl","true");
            props.put("mail.smtp.auth","true");
            props.put("mail.smtps.debug","true");
            props.put("mail.mime.charset","UTF-8");


            javax.mail.Authenticator auth = new SmtpAuthenticator(uname,pass);
            SecurityManager security = System.getSecurityManager();
            Session ses = null;
            if(security == null)    ses = Session.getInstance(props,auth);
            else                    ses = Session.getDefaultInstance(props, auth);
            Message msg = new MimeMessage(ses);
            msg.setHeader("Content-Type",  "text/plain; charset=\"UTF-8\"");
            msg.setHeader("X-Mailer", "MySoft Ltd.");
//            msg.setHeader("Content-Transfer-Encoding", "base64");
//            msg.setHeader("Content-Disposition", "inline");
            msg.setFrom(new InternetAddress(from));
            
            String[] tos = to.split(";");
            InternetAddress[] addresses = new InternetAddress[tos.length];
            for(int i=0;i<addresses.length;i++)
                addresses[i] = new InternetAddress(tos[i].trim());
            
            msg.setRecipients(Message.RecipientType.TO, addresses);
            msg.setSubject(subject);

            msg.addHeader("Content-Type",  "text/plain; charset=\"UTF-8\"");
            if(fileAttachment != null && fname != null) {
                MimeBodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setText(content);
                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(messageBodyPart);
                messageBodyPart = new MimeBodyPart();
                DataSource source = new FileDataSource(fileAttachment);
                messageBodyPart.setDataHandler(new DataHandler(source));
                messageBodyPart.setFileName(fname);
                multipart.addBodyPart(messageBodyPart);
                msg.setContent(multipart);
            }
            else
                msg.setContent(content,"text/plain; charset=\"UTF-8\"");
//                msg.setText(content);
            Transport.send(msg);
        }catch(Exception e){e.printStackTrace();bret=false;}
        return bret;
    }
    
    public static boolean sendMail(String smtp, String port, String from, String to, String subject, String content, String fileAttachment, String fname) {
        boolean bret = true;
        try{
            java.util.Properties props = new java.util.Properties();
            props.put("mail.smtp.host", smtp);
            props.put("mail.smtp.port", port);
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.socketFactory.port", port);
            props.put("mail.smtp.socketFactory.fallback", "false");
            props.put("mail.smtps.debug","true");
            props.put("mail.mime.charset","UTF-8");


            Session ses = Session.getDefaultInstance(props);
            Message msg = new MimeMessage(ses);
            msg.setHeader("Content-Type",  "text/plain; charset=\"UTF-8\"");
            msg.setHeader("X-Mailer", "MySoft Ltd.");
//            msg.setHeader("Content-Transfer-Encoding", "base64");
//            msg.setHeader("Content-Disposition", "inline");
            msg.setFrom(new InternetAddress(from));
            
            String[] tos = to.split(";");
            InternetAddress[] addresses = new InternetAddress[tos.length];
            for(int i=0;i<addresses.length;i++)
                addresses[i] = new InternetAddress(tos[i].trim());
            
            msg.setRecipients(Message.RecipientType.TO, addresses);
            msg.setSubject(subject);

            msg.addHeader("Content-Type",  "text/plain; charset=\"UTF-8\"");
            if(fileAttachment != null && fname != null) {
                MimeBodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setText(content);
                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(messageBodyPart);
                messageBodyPart = new MimeBodyPart();
                DataSource source = new FileDataSource(fileAttachment);
                messageBodyPart.setDataHandler(new DataHandler(source));
                messageBodyPart.setFileName(fname);
                multipart.addBodyPart(messageBodyPart);
                msg.setContent(multipart);
            }
            else
                msg.setContent(content,"text/plain; charset=\"UTF-8\"");
//                msg.setText(content);
            Transport.send(msg);
        }catch(Exception e){e.printStackTrace();bret=false;}
        return bret;
    }
    
    public static void tryMail(int interval,int cnt,String smtp, String port, String uname, String pass, String from, String to, String subject, String content, String fileAttachment, String fname) {
        sMail smail = new sMail(interval, cnt, smtp, port, uname, pass, from, to, subject, content, fileAttachment, fname);
        smail.start();
    }
    
    public static class sMail extends Thread {
        private String smtp;
        private String port;
        private String uname;
        private String pass;
        private String from;
        private String to;
        private String subject;
        private String content;
        private String fileAttachment;
        private String fname;
        private int interval;
        private int cnt;
        
        public boolean sent = false;
        
        public sMail(int interval,int cnt, String smtp, String port, String uname, String pass, String from, String to, String subject, String content, String fileAttachment, String fname) {
            this.smtp = smtp;
            this.port = port;
            this.uname = uname;
            this.pass = pass;
            this.from = from;
            this.to = to;
            this.subject = subject;
            this.content = content;
            this.fileAttachment = fileAttachment;
            this.fname = fname;
            this.interval = interval;
            this.cnt = cnt;
        }
        
        public void run() {
            for(int i=0;i<cnt;i++) {
                sent = mail.sendMail(smtp, port, uname, pass, from, to, subject, content, fileAttachment, fname);
                if(sent)  break;
                try{
                    Thread.sleep(interval*1000*60);
                }catch(Exception e){e.printStackTrace();}
            }
        }
    }
}


