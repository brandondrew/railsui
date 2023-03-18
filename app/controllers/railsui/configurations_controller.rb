require_dependency "railsui/application_controller"

module Railsui
  class ConfigurationsController < ApplicationController
    def create
      Railsui::Configuration.new(configuration_params).save
      Railsui.bundle
      Railsui.restart

      redirect_to root_path, notice: "App configuration updated successfully 🎉"
    end

    private

    def configuration_params
      params.require(:configuration)
        .permit(
          :application_name,
          :support_email,
          :css_framework,
          :theme,
          pages: []
        )
    end
  end
end
