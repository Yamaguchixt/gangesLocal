package controller.manage;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import DAO.ItemsDAO;
import model.Item;
import util.Router;
import util.Util;


/**
 * Servlet implementation class ItemManageController
 */
@WebServlet("/ItemManageController")
public class ItemManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemManageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//String item_image_id       = Util.getUUID();
	  String shop_id = "9e64ca309b2743fd83d3c7aff2f5a55f";
    String item_id             = Util.getUUID();
    String category_id         = "";
    String name                = "";
    String strprice            = "";
    String strsize             = "";
    String info                = "";
    String strstock            = "";
    String exterior_image_path = "";
    String view_image_path     = "";
    String date                = Util.getCurrentDateString();
    int is_alive               = 1;
    int price                  = 0;
    int itemsize               = 0;
    int stock                  = 0;
    String nextJsp             = "";
    boolean isError            = false;

    System.out.println(date);

	// (2) アップロードファイルを受け取る準備
    // ディスク領域を利用するアイテムファクトリーを作成
    DiskFileItemFactory factory = new DiskFileItemFactory();

    // tempディレクトリをアイテムファクトリーの一次領域に設定
    ServletContext servletContext = this.getServletConfig().getServletContext();
    factory.setRepository((File) servletContext.getAttribute("javax.servlet.context.tempdir"));

    // ServletFileUploadを作成
    ServletFileUpload upload = new ServletFileUpload(factory);

    try {
      // (3) リクエストをファイルアイテムのリストに変換
      List<FileItem> items = upload.parseRequest(request);
      // アップロードパス取得
      String upPath = servletContext.getRealPath("/") + "public"+File.separator +"images"+File.separator +"items"+File.separator;
      byte[] buff = new byte[1024];
      int size = 0;
      System.out.println("５");
      for (FileItem fitem : items) {
        // (4) アップロードファイルの処理
        if (!fitem.isFormField()) {
          // ファイルをuploadディレクトリに保存
          BufferedInputStream in = new BufferedInputStream(fitem.getInputStream());
          File f = new File(upPath + fitem.getName());
          BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(f));
          while ((size = in.read(buff)) > 0) {
            out.write(buff, 0, size);
          }
          System.out.println(getServletContext().getContextPath() +File.separator +"public"+File.separator +"images"+File.separator +"items"+File.separator+ fitem.getName());
          view_image_path =getServletContext().getContextPath() +File.separator +"public"+File.separator +"images"+File.separator +"items"+File.separator+ fitem.getName();
          out.close();
          in.close();
          // (5) フォームフィールド（ファイル以外）の処理
        } else {
          //inputtype="text"のデータ処理
          String fieldName = fitem.getFieldName();                 //これがname=""の部分
          String value = fitem.getString();                        //これがvalue=""ユーザが入力したtextデータ
          value = new String(value.getBytes("iso-8859-1"),"utf-8");//Unicodeで取得されるのでバイト配列に入れてからutf-8に復号
          System.out.println(fieldName);
          System.out.println(value);
          //どのfieldのtextデータか判断してそれぞれに代入する。
          if(fieldName.equals("category_id"))        {category_id= value;         System.out.println(category_id);}
          if(fieldName.equals("name"))               {name= value;                System.out.println(name);}
          if(fieldName.equals("price"))              {strprice= value;            System.out.println(strprice);}
          if(fieldName.equals("size"))               {strsize= value;             System.out.println(strprice);}
          if(fieldName.equals("info"))               {info= value;                System.out.println(info);}
          if(fieldName.equals("stock"))              {strstock= value;            System.out.println(strstock);}
          if(fieldName.equals("exterior_image_path")){exterior_image_path= value; System.out.println(exterior_image_path);}
        }
      }
    } catch (FileUploadException e) {
      // 例外処理
    }
     //intに変換
    try{
      price = Integer.parseInt(strprice);
      itemsize = Integer.parseInt(strsize);
      stock = Integer.parseInt(strstock);
    }catch(NumberFormatException e){
      request.setAttribute("numErr", "価格、サイズ、在庫は数値で入力してください。");
      nextJsp = "formShopData.jsp";
      isError = true;
    }

    Item item      = new Item(item_id,category_id,name,price,itemsize,info,stock,exterior_image_path,view_image_path,is_alive,date);
    Item shop_item = new Item(shop_id,item_id,date);
    ItemsDAO dao   = new ItemsDAO();
    dao.create(item);
    dao.createShopItem(shop_item);
    if ( isError ) { nextJsp = "formShopData.jsp";  }
    else { nextJsp = "ItemRegist.jsp";
           request.setAttribute("MS","ok。");
           request.setAttribute("img",view_image_path);
    }
    request.getRequestDispatcher( Router.getInstance().getURL( nextJsp )).forward(request, response);

	}
}
