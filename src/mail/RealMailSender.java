package mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class RealMailSender extends AbstractMailSender implements MailSender {
  public RealMailSender(){}

  private final String from     = "PlayFreeMarket@hew2015.com";
  private final String username = "root";
  private final String password = "MLMPyuta2";
  private final String host     = "mail1.hew2015.com";

  @Override
  public void setDestination(String destination) {
    this.destination = destination;
  }

  @Override
  public void setTitle(String title) {
    this.title = title;
  }

  @Override
  public void setContent(String content) {
    this.content = content;
  }

  @Override
  public void send() {
    Properties prop = new Properties();
    prop.put( "mail.smtp.auth", "false" );
    prop.put( "mail.smtp.starttls.enable", "false" );
    prop.put("mail.smtp.host", this.host );
    prop.put( "mail.smtp.port", "25" );

    Session session = Session.getInstance(
      prop,
      new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication(){
          return new PasswordAuthentication( username, password );
        }
      });

    try{
      Message message = new MimeMessage( session );
      message.setFrom( new InternetAddress( from ));
      message.setRecipients( Message.RecipientType.TO, InternetAddress.parse( destination ));
      message.setSubject( title );
      message.setText( content );
      Transport.send( message );
    } catch(MessagingException e){
      e.printStackTrace();
      System.out.println("RealMailSender#sendの例外catch");
      return;
    }

  }
}
