package com.bank.dao;

public class Transaction {
	private int customerId;
	private String  password;
	private int pin;
	private String  bankingType;
	public Transaction(int customerId, String password, int pin, String bankingType) {
		super();
		this.customerId = customerId;
		this.password = password;
		this.pin = pin;
		this.bankingType = bankingType;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}
	public String getBankingType() {
		return bankingType;
	}
	public void setBankingType(String bankingType) {
		this.bankingType = bankingType;
	}

}
