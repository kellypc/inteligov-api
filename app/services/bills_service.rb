require "mechanize"

class BillsService
  BASE_URL = "https://sapl.al.ac.leg.br/materia"

  attr_accessor :agent, :url, :project_id

  def initialize(project_id)
    @agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }
    @url = "#{BASE_URL}/#{project_id}"
  end

  def get_new_project
    fp = File.new("wikilinks.txt", "w")

    html = agent.get(url).body

    result = {
      "ext_id": project_id,
      "author": get_author,
      "kind": get_kind,
      "number": "201",
      "year": "2013",
      "status": "APROVADO",
      "description": "DISPÕE SOBRE A DOAÇÃO E A VENDA DE ÁREAS DE DOMÍNIO DA ADMINISTRAÇÃO PÚBLICA DIRETA E INDIRETA, PARA EFEITO DE REGULARIZAÇÃO FUNDIÁRIA DE INTERESSE SOCIAL.",
      "steps": [
        ["19/12/2013", "SAL", "Enviado para PE: Aprovado"],
        [
          "17/12/2013",
          "SAL",
          "Enviado para SAL: Distribuição às Comissões Tematicas"
        ]
      ],
      "link": "https://sapl.al.ac.leg.br/media/sapl/public/materialegislativa/2013/4059/4059_texto_integral.pdf",
      "introduction_date": "2013-12-17"
    }

    result

    # html_doc = Nokogiri::HTML(html)
    #
    # fp.write("References\n\n")
    #
    # list = html_doc.xpath("//ol[@class='references']")
    # list.each { |i| fp.write(i.text + "\n") }
    #
    # fp.write("Further Reading\n\n")
    #
    # list = html_doc.xpath("//span[@class='citation']")
    # list.each { |i| fp.write(i.text + "\n") }
  end

  private
  def get_author
    page = agent.get("#{url}/autoria")
    page.at('table tr td').text.strip
  end

  def get_kind
  end
end
