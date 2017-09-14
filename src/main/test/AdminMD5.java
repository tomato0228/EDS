import com.njust.eds.utils.MD5Util;
import org.junit.Test;

import static com.njust.eds.utils.AESUtil.aesDecrypt;
import static com.njust.eds.utils.AESUtil.aesEncrypt;

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

    @Test
    public void AES()  throws Exception {
        String content = "beginTime=-1&endTime=1462032000&partner_id=10&status=1,2,3,4,5,50";

        String key = "d5e774de46f53ffeae8623ac47ca3334";
        //System.out.println("加密密钥和解密密钥：" + key);

        String encrypt = aesEncrypt(content, key);
        encrypt = encrypt.replaceAll("\\s|\\r|\\n|\\t", "");
        System.out.println("加密后：" + encrypt);

        String decrypt = aesDecrypt(encrypt, key);
        System.out.println("解密后：" + decrypt);
        System.out.println(System.currentTimeMillis() / 1000);
    }

}
