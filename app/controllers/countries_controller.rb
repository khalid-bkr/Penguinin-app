class CountriesController < ApplicationController
    def index
        @countries = Country.all
        @total_death = Country.order(death_count: :desc).first(6)
        @total_cases = Country.order(case_count: :desc).first(6)
        @total_recovery = Country.order(recovery_count: :desc).first(6)
        @total_cases_sum = Country.sum(:case_count)
        @total_death_sum = Country.sum(:death_count)
        @total_recovery_sum = Country.sum(:recovery_count)
      end
end
