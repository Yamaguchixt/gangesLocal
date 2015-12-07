package chat;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.apache.catalina.websocket.WsOutbound;

/**
 * Servlet implementation class WsChatServlet
 */
@WebServlet("/WsChatServlet")
public class WsChatServlet extends WebSocketServlet {
	private static final long serialVersionUID = 1L;
	private static List<MyMessageInbound> mmlist = new ArrayList<MyMessageInbound>();

	@Override
  protected StreamInbound createWebSocketInbound(String arg0, HttpServletRequest arg1) {
    return new MyMessageInbound();
  }


	private class MyMessageInbound extends MessageInbound {
	  WsOutbound myoutbound;

	  @Override
	  public void onOpen(WsOutbound outbound){
	    try {
	      this.myoutbound = outbound;
	      mmlist.add(this);
	      outbound.writeTextMessage(CharBuffer.wrap("Hello"));
	    } catch(IOException e) {
	      e.printStackTrace();
	    }
	  }

	  @Override
	  public void onClose(int status) {
	    mmlist.remove(this);
	  }

	  @Override
	  public void onTextMessage(CharBuffer cb) throws IOException {
	    System.out.println(cb);
	    for(MyMessageInbound mmib: mmlist) {
	      CharBuffer buffer = CharBuffer.wrap(cb);
	      mmib.myoutbound.writeTextMessage(buffer);
	      mmib.getWsOutbound();  //上とどう違う?
	      mmib.myoutbound.flush();
	    }
	  }
	  @Override
	  public void onBinaryMessage(ByteBuffer bb) throws IOException {
	  }
	}
}
