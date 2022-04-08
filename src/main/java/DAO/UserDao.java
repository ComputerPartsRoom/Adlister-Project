package DAO;

import java.util.ArrayList;
import java.util.List;

public class UserDao implements Users {

    private List<username> newUsername = new ArrayList<>();

    public UserDao() {
        insert(newUsername());
    }

    public List<username> all() {
        return this.newUsername;
    }

    public void insert(User userToInsert) {
        this.newUsername.add(userToInsert);
    }
    //    User findByUsername(String username);
    //    Long insert(User user);

}
//import java.util.ArrayList;
//        import java.util.List;
//
//public class ListAdsDao implements Ads {
//
//    private List<Ad> newAd = new ArrayList<>();
//
//    public ListAdsDao() {
//        insert(new Ad("444 Board", 444.44, "San Antonio"));
//    }
//
//    @Override
//    public List<Ad> all() {
//        return this.newAd;
//    }
//
//    @Override
//    public void insert(Ad AdToInsert) {
//        this.newAd.add(AdToInsert);
//    }
//}
