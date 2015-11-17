package mail;

public abstract class AbstractMailSender {
  public abstract void setDestination( String destination );
  public abstract void setTitle( String title);
  public abstract void setContent( String content );
  public abstract void send();

  protected String destination;
  protected String title;
  protected String content;

}
