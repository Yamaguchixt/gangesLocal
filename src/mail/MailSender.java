package mail;

public interface MailSender {
  public abstract void setDestination( String destination );
  public abstract void setTitle( String title);
  public abstract void setContent( String content );
  public abstract void send();
}
