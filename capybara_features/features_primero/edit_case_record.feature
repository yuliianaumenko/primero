# JIRA PRIMERO-96
# JIRA PRIMERO-148
# JIRA PRIMERO-736
@javascript @primero @search
Feature: Edit Case Record
  As a admin user, I want to be able to edit a case record

  Background:
    Given I am logged in as an admin with username "primero_cp" and password "primero"
    And the following cases exist in the system:
      | name     | created_by | age | sex    | registration_date      | status | unique_identifier                    |
      | andreas  | primero_cp | 10  | male   | 03-Feb-2004            | open   | 21c4cba8-b410-4af6-b349-68c557af3aa9 |
    When I press the "CASES" button

  Scenario: I edit a case record
    And I should see an id "7af3aa9" link on the page
    And I press the "7af3aa9" link
    And I press the "Edit" button
    And I fill in the following:
     | Name              | Tiki Thomas Taliaferro               |
    And I select "Male" from "Sex"
    And I press "Save"
    Then I should see a success message for updated Case
    And I should see "Tiki Thomas Taliaferro" on the page
    And I should see "Male" on the page

  Scenario: I should not see description text
    And I should see an id "7af3aa9" link on the page
    And I press the "7af3aa9" link
    And I should not see "Basic identity information about a separated or unaccompanied child."
