package nwcserver.nwc_dummy_checker;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Random;


public class TaskChecker {
	 private static List<String> compilerErrors = Arrays.asList("NullPointerException", "Compiler error",
	            "RunTimeException", "IOException");

	    public static HashMap<String, Object> checkTask(CheckerMessage input) {
	        HashMap<String, Object> result = new HashMap<String, Object>();
	        Random rd = new Random();
	        
	        boolean passed = rd.nextBoolean();
	        if (passed) {
	            result.put("passed", true);
	            //generate result:
	            result.put("time", rd.nextInt(1000));
	            result.put("memory", rd.nextInt(1000));
	            return result;
	        } else {
	            result.put("passed", false);
	            result.put("time", 1000 + rd.nextInt(3000));
	            result.put("memory", 1000 + rd.nextInt(3000));
	            result.put("message", compilerErrors.get(rd.nextInt(compilerErrors.size())));
	            return result;
	        }
	    }

}
