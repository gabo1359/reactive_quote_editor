class Quote < ApplicationRecord
  belongs_to :company
  has_many :line_item_dates, dependent: :destroy

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }

  # Rails way to make it simpler
  # By default:
  #   - The target option will be equal to model_name.plural.
  #   - The partial value is equal to calling to_partial_path on an instance of the model.
  #   - The locals value is equal to { model_name.element.to_sym => self }.

  # after_create_commit -> { broadcast_prepend_to "quotes" }
  # after_update_commit -> { broadcast_replace_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  # Improve performance by making the broadcasting part asynchronous using background jobs
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }

  # The broadcast_remove_later_to method does not exist because as the quote gets deleted from the database,
  # it would be impossible for a background job to retrieve this quote in the database later to perform the job.

  # Rails way to make it simpler
  # The three callbacks are equivalent to a single line of code
  broadcasts_to ->(quote) { [quote.company, :quotes] }, inserts_by: :prepend
end
