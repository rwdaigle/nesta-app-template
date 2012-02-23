module Nesta
  class App

    configure :production do
      require 'newrelic_rpm'
    end

  end
end