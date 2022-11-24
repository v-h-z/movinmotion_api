class MovinmotionApi::Configuration

  attr_accessor :cookie

  def self.default
    @@default ||= new
  end

  def self.reset
    @@default = nil
  end

  def use_classes=(boolean)
    if boolean
      MmJob.setup{MovinmotionApi.list_positions.data.dig('content', 'positions')}
      # MmCcn.setup
    end
  end
end
