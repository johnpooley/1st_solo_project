class Greeting

  def initialize(options)
    @t = t
  end



  def self.hm()
    t = Time.now

    if t.strftime('%P') == 'pm'
      'Good afternoon'
    else
      'Good morning'
    end
  end
end
