package DAO;

public class DaoFactory {
    private static Posts PostsDao;
    private static Config config = new Config();
    private static Users usersDao;
    private static Categories categoriesDao;


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
}
