module MessageSender
  extend ActiveSupport::Concern

  def sending_message
    wishLists = WishList.where('book_id = ?', @book.id)
    text = "The book #{@book.name} is available again"
    wishLists.each do |wl|
      puts "****** phone: #{User.find(wl.user_id).cellphone}, #{text}"
    end
  end

end