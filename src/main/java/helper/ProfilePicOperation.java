package helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class ProfilePicOperation {

	public boolean deleteDp(String path) {
		boolean f = false;
		File file = new File(path);
		f = file.delete();
		return f;
	}

	public boolean saveDp(InputStream is, String path) {
		boolean f = false;
		try {
			byte b[] = new byte[is.available()];
			is.read(b);
System.out.println(b);
			FileOutputStream os = new FileOutputStream(path);
			os.write(b);
			os.flush();
			os.close();
			f = true;
		} catch (IOException e) {
			System.out.println("ssssssss"+e);
		}

		return f;
	}

}
