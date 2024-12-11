class CountdownController < ApplicationController
  def index
    today = Date.today
    start_of_december = Date.new(today.year, 12, 1)
    christmas = Date.new(today.year, 12, 25)

    @days_until_christmas = (christmas - today).to_i

    if @days_until_christmas < 0
      christmas = Date.new(today.year + 1, 12, 25)
      @days_until_christmas = (christmas - today).to_i
    end

    @days_passed_in_december  = if today.month == 12
                                  (today - start_of_december).to_i + 1
                                else
                                  0
                                end

    @calendar = (1..25).map do |day|
      { date: Date.new(today.year, 12, day), passed: day <= today.day && today.month == 12 }
    end
  end
end
