package practice.spartans;

import com.intuit.karate.junit5.Karate;

public class SpartanRunner {

    @Karate.Test
    Karate testUsers() {
        // you can provide the feature you want to run here
        return Karate.run("get1spartan").relativeTo(getClass());
    }

}
