@data-qld-theme
Feature: Data QLD Theme

       Scenario: Lato font is implemented on homepage
              When I go to homepage
              Then I should see an element with xpath "//link[contains(@href,'https://fonts.googleapis.com/css?family=Lato')]"

       Scenario: Organisation is in fact spelled Organisation (as opposed to Organization)
              When I go to organisation page
              Then I should not see "Organization"

       Scenario: Explore button does not exist on dataset detail page
              When I go to dataset page
              And I click the link with text that contains "A Wonderful Story"
              Then I should not see "Explore"

       Scenario: Explore button does not exist on dataset detail page
              When I go to organisation page
              Then I should see "Organisations are Queensland Government departments, other agencies or legislative entities responsible for publishing open data on this portal."
