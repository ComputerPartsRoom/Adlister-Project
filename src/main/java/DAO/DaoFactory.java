package DAO;

public class DaoFactory {
    private static Posts PostsDao;
    private static Config config = new Config();
    private static Users usersDao;
    private static Categories categoriesDao;
    private static Messages messagesDao;


    public static Posts getPostsDao() {
        if (PostsDao == null) {
            PostsDao = new MySQLPostsDao(config);
        }
        return PostsDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }

    public static Categories getCategoriesDao() {
        if (categoriesDao == null) {
            categoriesDao = new MySQLCategoriesDao(config);
        }
        return categoriesDao;
    }

    public static Messages getMessagesDao(){
        if(messagesDao == null){
            messagesDao = new MySQLMessagesDao(config);
        }
        return messagesDao;
    }
}
