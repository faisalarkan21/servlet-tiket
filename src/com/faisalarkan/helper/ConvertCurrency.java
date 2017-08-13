package com.faisalarkan.helper;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;

public class ConvertCurrency {


	public String toRp (double uang) {

		DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
		DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

		formatRp.setCurrencySymbol("Rp. ");
		formatRp.setMonetaryDecimalSeparator(',');
		formatRp.setGroupingSeparator('.');

		kursIndonesia.setDecimalFormatSymbols(formatRp);
		String uangConvert = kursIndonesia.format(uang);

		return uangConvert;


	}

	public double UnformatRp (String uang) throws ParseException {

		DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
		DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

		formatRp.setCurrencySymbol("Rp. ");
		formatRp.setMonetaryDecimalSeparator(',');
		formatRp.setGroupingSeparator('.');

		kursIndonesia.setDecimalFormatSymbols(formatRp);


		Number angka = kursIndonesia.parse(uang);
		double uangConvert = angka.doubleValue();

		return uangConvert;


	}



}
