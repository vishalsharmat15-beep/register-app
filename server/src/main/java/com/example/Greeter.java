package com.example;

/**
 * This is a class.
 */
public class Greeter {

  /**
   * Returns a greeting for the supplied name.
   *
   * @param someone name to greet
   * @return greeting message
   */
  public String greet(String someone) {
    return String.format("Hello, %s!", someone);
  }
}
