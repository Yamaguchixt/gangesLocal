package model;

public class User {
		private String userId; //主キーだからuserつける
		private String name;
		private String pass;
		private String postNumber;
		private String prefecture;
		private String district;
		private String addressBuilding;
		private String tell;

		private int is_alive =0;



		public int getIs_alive() {
      return is_alive;
    }

    public void setIs_alive(int is_alive) {
      this.is_alive = is_alive;
    }

    public String toString() {



		  return   "  name : " + this.name
		        +  "  pass : " + this.pass
		        +  "  postNumber : " + this.postNumber
		        +  "  prefecture : " + this.prefecture;
		}

		public String getUserId() {
      return userId;
    }
    public void setUserId(String userId) {
      this.userId = userId;
    }
    public String getName() {
      return name;
    }
    public void setName(String name) {
      this.name = name;
    }
    public String getPass() {
      return pass;
    }
    public void setPass(String pass) {
      this.pass = pass;
    }
    public String getPostNumber() {
      return postNumber;
    }
    public void setPostNumber(String postNumber) {
      this.postNumber = postNumber;
    }
    public String getPrefecture() {
      return prefecture;
    }
    public void setPrefecture(String prefecture) {
      this.prefecture = prefecture;
    }
    public String getDistrict() {
      return district;
    }
    public void setDistrict(String district) {
      this.district = district;
    }
    public String getAddressBuilding() {
      return addressBuilding;
    }
    public void setAddressBuilding(String addressBuilding) {
      this.addressBuilding = addressBuilding;
    }
    public String getTell() {
      return tell;
    }
    public void setTell(String tell) {
      this.tell = tell;
    }

    public User(String user_id,String user_name,String user_pass,String yubinbango,String todouhuken,String sikutyouson,String bantitatemono,String user_tell,int is_alive){

			this.name = user_name;
			this.pass = user_pass;
			this.postNumber = yubinbango;
			this.prefecture = todouhuken;
			this.district = sikutyouson;
			this.addressBuilding = bantitatemono;
			this.tell = user_tell;

			this.is_alive = is_alive;

		}


	}




