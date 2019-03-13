require 'prawn'
 
module GeneratePdf
  PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin => [40, 40]
  }
 
  def self.termo_compromisso numTermo, patrimonio, serial, configuracao, valor, servidor_nome, servidor_siape, servidor_telefone, servidor_email, dataVinculo, dataDevolucao
 
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      pdf.fill_color "000000"

      pdf.text "Termo de Compromisso", :size => 32, :style => :bold, :align => :center

      pdf.text "GUARDA E USO DE EQUIPAMENTO – #{numTermo}", :size => 12, :style => :bold, :align => :center

      pdf.move_down 30

      pdf.text "Eu, <b>#{servidor_nome}</b>, SIAPE nº <b>#{servidor_siape}</b>, telefone/celular para contato <b>#{servidor_telefone}</b>, email <b>#{servidor_email}</b>, recebi do PTCE/COMTED, do INSTITUTO FEDERAL FLUMINENSE ""(""IF Fluminense"")"" os materiais/equipamentos listados abaixo, para uso exclusivo conforme determinado em lei, comprometendo-me a mantê-los em perfeito estado de conservação, ficando ciente que:", :size => 10, :align => :justify, :inline_format => true

      pdf.move_down 10
      
      pdf.text "<b>1.</b> Se o equipamento extraviado ou desaparecido, o IF Fluminense, solicitará a abertura do Termo Circunstanciado Administrativo – TCA para ressarcimento do valor de mercado atual do bem ou reposição de um equipamento com as mesmas especificações ou superior, vide IN 004/2009, ou Sindicância nos casos de furto conforme Lei no 8.112/90 para fins de apurar quais as circunstâncias;", :size => 10, :align => :justify, :inline_format => true
      pdf.text "<b>2.</b> Em caso de roubo, dano, inutilização ou extravio do equipamento o IF Fluminense deverá ser comunicado imediatamente ao Consignatário da Unidade Gestora ou chefia imediata para as providências que o caso requer. No caso de roubo o Boletim de Ocorrência (BO) deverá ser apresentado;", :size => 10, :align => :justify, :inline_format => true
      pdf.text "<b>3.</b> Finalizando o uso/serviços, o equipamento deverá ser devolvido completo e em perfeito estado de conservação, considerando-se o tempo do uso do mesmo, ao setor competente;", :size => 10, :align => :justify, :inline_format => true
      pdf.text "<b>4.</b> Nos casos de pedido de vacância (art. 33, da Lei 8.112/90), exoneração (art. 33, da Lei 8.112/90), remoção (art. 36 da Lei 8.112/90), redistribuição (art. 37 da Lei 8.112/90), aposentadoria (art. 33, VII da Lei 8.112/90) e licença sem vencimento (art. 92 da Lei 8.112/90), o atestado de devolução do equipamento deverá ser entregue obrigatoriamente, juntamente com o requerimento do servidor, conforme Portaria nº 360/2015"" (p. 12);", :size => 10, :align => :justify, :inline_format => true
      pdf.text "<b>5.</b> Nos casos de falecimento, os bens constantes neste termo devem ser restituídos pelos familiares em até 60 dias;", :size => 10, :align => :justify, :inline_format => true
      pdf.text "<b>6.</b> Estando os equipamentos em posse do servidor, o mesmo estará sujeito a inspeções anuais ou, ainda, sempre que solicitado. O não cumprimento implicará em não autorização para capacitações, licenças e afastamentos;", :size => 10, :align => :justify, :inline_format => true
      pdf.text "<b>7.</b> Todos os dados armazenados no(s) equipamento(s) especificado (s), são de inteira responsabilidade do servidor;", :size => 10, :align => :justify, :inline_format => true
      pdf.text "<b>8.</b> A manutenção de software só se efetivará em sistema operacional e programas instalados pelo IF Fluminense.", :size => 10, :align => :justify, :inline_format => true

      pdf.move_down 10

      table_data = [
        ["<b>Nº Série</b>", "<b>Nº Patrimônio</b>", "<b>Descrição</b>", "<b>Quantidade</b>", "<b>Valor</b>", "<b>EB</b>"],
        ["#{serial}", "#{patrimonio}", "#{configuracao}", "01", '%.2f' %"#{valor}"," "],
        ["<b>Total</b>", " ", " ", "01", '%.2f' %"#{valor}", " "]
      ]
      pdf.table(table_data, :column_widths => [80, 75, 215, 70, 50, 25], :cell_style => {:size => 10, :align => :justify, :inline_format => true, :position => :center, :text_align => :center})

      pdf.move_down 10

      pdf.text "<b>EB</b> = Estado do Bem => Novo (<b>N</b>) / Bom <b>B</b>) / Regular (<b>R</b>) / Outros (<b>O</b>) - especificar no verso", :size => 10, :align => :justify, :inline_format => true

      pdf.move_down 30

      data = I18n.l(dataVinculo, format: "%d de %B de %Y").to_s

      pdf.text "Campos dos Goytacazes, #{data}", :size => 10, :align => :right, :inline_format => true

      pdf.move_down 30

      pdf.text "Ciente (Nome / Assinatura):______________________________________________________________________", :size => 10, :align => :justify, :inline_format => true

      pdf.move_down 30

      pdf.text "Cargo / Função:______________________________________________ SIAPE:___________________________", :size => 10, :align => :justify, :inline_format => true

      pdf.move_down 30

      table_data = [
        ["<b>DEVOLUÇÃO</b>", " "],
        ["Atestamos que o(s) bem(ns) devolvidos estão:\n(  ) Em perfeito estado\n\n(  ) Apresentando defeito. Qual(is)?___________________________\n\n_______________________________________________________\n\n(  ) Faltando peças/acessórios. Qual(is)? ______________________\n\n_______________________________________________________\n\n", "<b>Assinatura / Carimbo / SIAPE do Responsável pelo Recebimento"]
      ]
      pdf.table(table_data, :column_widths => [315, 200], :cell_style => {:size => 10, :align => :justify, :inline_format => true, :position => :center, :text_align => :center})

      # Muda de font para Helvetica
      pdf.font "Helvetica"
      # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
      # pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página ", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8

      pdf.number_pages "<page> de <total>", :start_count_at => 1, :page_filter => lambda{ |pg| pg != 0 }, :at => [pdf.bounds.right - 50, 0], :align => :right, :size => 10
      # Gera no nosso PDF e coloca na pasta public com o nome termo_compromisso.pdf
      pdf.render_file('public/termo_compromisso.pdf')
    end
  end
end