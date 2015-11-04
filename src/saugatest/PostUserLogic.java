package saugatest;




public class PostUserLogic {
	public void execute(User user){
		User_RegistrationDAO dao = new User_RegistrationDAO();
		dao.create(user);

	}

}
