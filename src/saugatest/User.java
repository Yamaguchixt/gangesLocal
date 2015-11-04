package saugatest;

public class User {
		private String user_id;
		private String user_name;
		private String user_pass;
		private String yubinbango;
		private String todouhuken;
		private String sikutyouson;
		private String bantitatemono;
		private String user_tell;



		public User(){}

		public User(String user_id,String user_name,String user_pass,String yubinbango,String todouhuken,String sikutyouson,String bantitatemono,String user_tell){
			this.user_id = user_id;
			this.user_name = user_name;
			this.user_pass = user_pass;
			this.yubinbango = yubinbango;
			this.todouhuken = todouhuken;
			this.sikutyouson = sikutyouson;
			this.bantitatemono = bantitatemono;
			this.user_tell = user_tell;

		}

		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public String getUser_name() {
			return user_name;
		}
		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}
		public String getUser_pass() {
			return user_pass;
		}
		public void setUser_pass(String user_pass) {
			this.user_pass = user_pass;
		}
		public String getYubinbango() {
			return yubinbango;
		}
		public void setYuubinbango(String yubinbango) {
			this.yubinbango = yubinbango;
		}
		public String getTodouhuken() {
			return todouhuken;
		}
		public void setTodouhuken(String todouhuken) {
			this.todouhuken = todouhuken;
		}
		public String getSikutyouson() {
			return sikutyouson;
		}
		public void setSikutyouson(String sikutyouson) {
			this.sikutyouson = sikutyouson;
		}
		public String getBantitatemono() {
			return bantitatemono;
		}
		public void setBantitatemono(String bantitatemono) {
			this.bantitatemono = bantitatemono;
		}
		public String getTell() {
			return user_tell;
		}
		public void setTell(String tell) {
			this.user_tell = tell;
		}



	}




