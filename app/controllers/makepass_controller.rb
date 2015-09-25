class MakepassController < ApplicationController

  ENABLE_KEYS = %w(number uppercase lowercase symbol length)
  LENGTH_KEY = ''
  before_action :initial_data

  # initial process
  def initial_data
    if @make_data.nil?
      @make_data = {}
    end
  end

  # display main
  def show
    update
    @output ="output"
  end

  # ajax event receive => should fix input check
  def update
    flg = true
    # update status
    ENABLE_KEYS.each do |key|
      @make_data[key] = params[key] if params.key?(key)
      flg = false if params[key] == "true"
    end
    @err_text = "check the type of something"  if flg
    @err_text = "text length err"  if params['length'].blank?

    prop = {
      length: params['length'] || 6,
      use_upper: params['uppercase'] || false,
      use_lower: params['lowercase'] || false,
      use_number: params['number'] || false,
      use_symbol: params['symbol'] || false
    }

    @passwords = view_context.get_password(6, prop)
  end
end
