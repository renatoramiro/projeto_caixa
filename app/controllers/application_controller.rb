class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_file(file)
  	lines = params[:file].tempfile.readlines.map(&:chomp) #readlines from file & removes newline symbol
	  #lines.shift #remove first line 
	  info = Information.new

	  lines.each do |line|

	  	if line.match(/^EMPRESA .: (.*) CGC : (.*)/)#include? "EMPRESA .: "
#				puts "Meu nome (com partition): #{line.partition(": ")[2]}"
				#info.name = line.partition(": ")[2].to_s.gsub("\n", '')
				info.empresa = line.split(/^EMPRESA .: (.*) CGC : (.*)/)[1].rstrip
				info.cgc  = line.split(/^EMPRESA .: (.*) CGC : (.*)/)[2].rstrip
			end

			if line.match(/^MUNICIPIO: (.*) UF .: (.*)/)#.include? "MUNICIPIO: "
				info.municipio = line.split(/^MUNICIPIO: (.*) UF .: (.*)/)[1].rstrip
				info.estado    = line.split(/^MUNICIPIO: (.*) UF .: (.*)/)[2].rstrip
			end

			if line.match(/^TELEFONE : (.*) \/\/ (.*) FAX : (.*)/)#.include? "TELEFONE : "
				info.telefone1 = line.split(/^TELEFONE : (.*) \/\/ (.*) FAX : (.*)/)[1].rstrip
				info.telefone2 = line.split(/^TELEFONE : (.*) \/\/ (.*) FAX : (.*)/)[2].strip
				info.fax  = line.split(/^TELEFONE : (.*) \/\/ (.*) FAX : (.*)/)[3].rstrip
			end

			if line.match(/^EMAIL ...: (.*)/)#include? "EMAIL ...: "
				info.email = line.split(/^EMAIL ...: (.*)/)[1].rstrip
			end

			if line.match(/^A\/C .....: (.*)/)#.include? "A/C .....: "
				info.ac = line.split(/^A\/C .....: (.*)/)[1].rstrip
			end

			if line.match(/^ASSUNTO .: (.*)/)#include? "ASSUNTO .: "
				info.assunto = line.split(/^ASSUNTO .: (.*)/)[1].rstrip
			end

			if line.match(/^ATIVIDADE: (.*)/)#.include? "ATIVIDADE: "
				info.atividade = line.split(/^ATIVIDADE: (.*)/)[1].rstrip
			end

			if line.match(/^PRODUTO .: (.*)/)#.include? "PRODUTO .: "
				info.produto = line.split(/^PRODUTO .: (.*)/)[1].rstrip
			end

			if line.match(/^LINHA ...: (.*)/)#.include? "LINHA ...: "
				info.linha = line.split(/^LINHA ...: (.*)/)[1].rstrip
			end

			if line.match(/^FONTE ...: (.*)/)#.include? "FONTE ...: "
				info.fonte = line.split(/^FONTE ...: (.*)/)[1].rstrip
			end
  	end

  	info
  end

private

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    information_index_path
  end

  def after_sign_up_path_for(resource_or_scope)
    information_index_path
  end
end
