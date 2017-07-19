class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    load_csv
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    write_csv
  end

  def find(id)
    @elements.find { |element| element.id == id.to_i }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << build_element(row)
    end
    set_next_id
  end

  def write_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << @elements.first.class.csv_headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end

  def set_next_id
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end
