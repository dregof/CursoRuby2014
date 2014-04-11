class ApiConstraints

  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || req.header['Accept'].include?
                  "application/vnd.book_shop.v#{@version}"
  end
end
