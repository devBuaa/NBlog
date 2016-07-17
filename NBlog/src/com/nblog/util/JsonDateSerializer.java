package com.nblog.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

/**
 * springMVC返回json时间格式化
 * 解决SpringMVC使用@ResponseBody返回json时，日期格式默认显示为时间戳的问题。
 * 需要在get方法上加上@JsonSerialize(using=JsonDateSerializer.class)
 * @author nlog 
 * Email：mmm333zzz520@163.com 
 * date：2014-2-17
 */
@Component
public class JsonDateSerializer extends JsonSerializer<Date>{
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Override
	public void serialize(Date date, JsonGenerator gen, SerializerProvider arg2)
			throws IOException, JsonProcessingException {
		// TODO Auto-generated method stub
		String formattedDate = dateFormat.format(date);
		gen.writeString(formattedDate);
	}
}
