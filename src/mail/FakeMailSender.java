package mail;

public class FakeMailSender extends AbstractMailSender {
  public FakeMailSender(){};

  public void setDestination( String destination ){ this.destination = destination; }
  public void setTitle( String title){ this.title = title; }
  public void setContent( String content ){ this.content = content; }
  public void send(){
    System.out.println("==========================MAIL===============================");
    System.out.println("宛先: "     + this.destination);
    System.out.println("タイトル: "  + this.title);
    System.out.println("内容: "     + this.content);
    System.out.println("==========================MAIL===============================");
  }
}
