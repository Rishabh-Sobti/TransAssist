package com.experts.TransAssist.extraClasses;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Photo implements Serializable {
	public String photoId;
	public String caption;
	public Photo(String photoId, String caption) {
		this.photoId = photoId;
		this.caption = caption;
	}
	public Photo() {
	}
	
}
