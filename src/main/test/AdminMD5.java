import com.njust.eds.utils.MD5Util;
import org.junit.Test;

/**
 * @author tomato
 * @create 2017-09-10 上午11:26
 */
public class AdminMD5 {
    @Test
    public void findMd5() {
        System.out.println("admin123: " + MD5Util.getMD5("admin123"));
    }
    @Test
    public void find() {
        System.out.println("admin123: " + MD5Util.getMD5("0192023A7BBD73250516F069DF18B500"));
    }
}
