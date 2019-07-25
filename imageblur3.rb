class Image

  def initialize (picture)
    @picture = picture
  end

  
  def blur(dist)
    dist.times do
      distance()
    end
  end

  def distance
    spacing = []
    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          spacing << [row_number, col_number]
        end
      end
    end
      
    spacing.each do |area|      
      
        @picture[area[0]][area[1] + 1] = 1 if area[1] + 1 <= @picture[area[0]].length - 1
        @picture[area[0]][area[1] - 1] = 1 if area[1] - 1 >= 0
        @picture[area[0] + 1][area[1]] = 1 if area[0] + 1 <= @picture[area[1]].length - 1
        @picture[area[0] - 1][area[1]] = 1 if area[0] - 1 >= 0
      
    end
  end         

  def output_image
    @picture.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0]
])




image.output_image
puts
image.blur(2)

image.output_image




