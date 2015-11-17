package mail;

import util.Config;

/*MailSender利用側はFactoryからオブジェクトを入手する。
 *Factoryはremoteとlocal判断してFakeか本物のSenderを返す。
 */
public class MailSenderFactory {
  public static AbstractMailSender getInstance(){
    Config config = Config.getInstance();
    if ( config.isRemote() ){
      return new RealMailSender();
    }
    return new FakeMailSender();
  }
}
