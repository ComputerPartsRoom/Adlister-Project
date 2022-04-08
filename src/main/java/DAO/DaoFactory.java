package DAO;

public class DaoFactory {
    private static Posts PostsDao;
    private static Config config = new Config();

    public static Posts getPostsDao() {
        if (PostsDao == null) {
            PostsDao = new MySQLPostsDao(config);
        }
        return PostsDao;
    }
}
