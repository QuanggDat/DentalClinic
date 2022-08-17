/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.Email;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Admin
 */
public class EmailDAO {

    public static void send(final EmailDTO email) throws Exception {
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email.getFrom(), email.getFromPassword());
            }
        });

        try {
            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(email.getFrom()));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.getTo()));
            message.setSubject(email.getSubject());
            message.setText("Nội dung email");
            message.setReplyTo(message.getFrom());
            message.setContent(email.getContent(),"text/html; charset=utf-8");
            
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
}