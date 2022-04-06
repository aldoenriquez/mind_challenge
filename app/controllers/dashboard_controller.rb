# frozen_string_literal: true

class DashboardController < ApplicationController
  include ApplicationHelper
  before_action :log_in!
  before_action :is_admin?
  def index
  end
end