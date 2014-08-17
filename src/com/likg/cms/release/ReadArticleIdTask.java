package com.likg.cms.release;

import java.io.File;
import java.util.TimerTask;

import org.apache.log4j.Logger;

import com.likg.common.Constants;

public class ReadArticleIdTask extends TimerTask{
	
	private static Logger log = Logger.getLogger(ReadArticleIdTask.class);

	@Override
	public void run() {
		log.info("读取待发布的稿件ID...");
		
		File aritcleIdsDir = new File(Constants.ROOTPATH + "/data/articleids");
		for(File file : aritcleIdsDir.listFiles()) {
			ReleaseArticleHelper.addArticleId(file.getName());
		}
		
	}
}
