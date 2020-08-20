prawn_document do |pdf|
  pdf.text "Listando Assunto", :align => :center, :size =>24
  pdf.move_down 20
  pdf.table @subjects.collect{|s| [s.id, s.description]}
end