Feature: Login Test
  As a user I want login in to nop commerce website

  @smoke @regression
  Scenario: User should navigate to login page successfully
    Given   I am on homepage
    When    I click on login link
    Then    I should navigate to login page successfully

  @sanity @regression
  Scenario Outline: Verify the error message with invalid credentials
    Given I am on homepage
    When  I click on login link
    And   I enter email "<email>"
    And   I enter password "<password>"
    And   I click on login button
    Then  I should see the error message "<errorMessage>"
    Examples:
      | email              | password | errorMessage                                                                                |
      | abcd123@gmail.com  | xyz123   | Login was unsuccessful. Please correct the errors and try again.\nNo customer account found |
      | xyz123@gmail.com   | abc123   | Login was unsuccessful. Please correct the errors and try again.\nNo customer account found |
      | adfafasd@gmail.com | xyz123   | Login was unsuccessful. Please correct the errors and try again.\nNo customer account found |

  @sanity @regression
  Scenario: User should login successfully with valid credentials
    Given   I am on homepage
    When    I click on login link
    And     I enter email "abc123@gmail.com"
    And     I enter password "Abcd1234"
    And     I click on login button
    Then    I should see logout link is display

  @regression
  Scenario: User should logout successfully
    Given   I am on homepage
    When    I click on login link
    And     I enter email "abc123@gmail.com"
    And     I enter password "Abcd1234"
    And     I click on login button
    And     I click on logout link
    Then    I should see login link is display
