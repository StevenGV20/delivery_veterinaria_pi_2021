package com.veterinaria.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FunctionUtil {

	
	public static String toFechaString(Date str) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String salida = null;
		try {
			salida = sdf.format(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return salida;
	}
	
	public static String toHoraString(Date str) {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm aa");
		String salida = null;
		try {
			salida = sdf.format(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return salida;
	}
}
