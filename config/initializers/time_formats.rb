Time::DATE_FORMATS[:my_long_ordinal] = lambda { |time| time.strftime("%A - %b #{ActiveSupport::Inflector.ordinalize(time.day)}, %Y") }

Time::DATE_FORMATS[:my_short_ordinal] = lambda { |time| time.strftime("%b #{ActiveSupport::Inflector.ordinalize(time.day)}, %Y") }