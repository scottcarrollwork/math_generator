class PdfGeneratorController < ApplicationController
  
  def multiplication_game
    multiplication_pairs = (1..12).to_a.product((1..12).to_a)

    multiplication_pairs.shuffle!

    render json: multiplication_pairs
  end

  def generate_multiplication_table
    pdf = Prawn::Document.new

    pdf.font_families.update(
      'IHateComicSans' => {
        normal: Rails.root.join('app/assets/fonts/IHATECS.TTF')
      }
    )
    pdf.font('IHateComicSans')

    pdf.text "Multiplication Tables (1x1 to 12x12)", size: 24, align: :center
    pdf.move_down 20

    multiplication_pairs = (1..12).to_a.product((1..12).to_a)

    multiplication_pairs.shuffle!

    multiplication_pairs.each do |i, j|
      pdf.text "#{i} x #{j} = #{i * j}", size: 18, inline_format: true
    end

    send_data pdf.render, filename: 'multiplication_table.pdf', type: 'application/pdf', disposition: 'inline'
  end
end