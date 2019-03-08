require "mechanize"

class BillsService
  BASE_URL = "https://sapl.al.ac.leg.br/materia"

  attr_accessor :agent, :url, :bill_id, :page

  def initialize(bill_id)
    @agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }
    @url = "#{BASE_URL}/#{bill_id}"
    @page = agent.get(url)
  end

  def get_new_bill
    {
      "ext_id": bill_id,
      "author": get_author,
      "kind": get_kind,
      "number": get_number,
      "year": get_year,
      "status": get_status,
      "description": get_description,
      "steps": get_steps,
      "link": get_link,
      "introduction_date": get_date
    }
  end

  private
  def get_author
    page = agent.get("#{url}/autoria")
    page.at('table tr td').text.strip
  end

  def get_status
    page = agent.get("#{url}/tramitacao")
    page.search('table tr')[1].search('td')[3].text.strip
  end

  def get_kind
    page.at('div .form-control-static').text.strip
  end

  def get_number
    page.at('div #div_id_numero .form-control-static').text.strip
  end

  def get_year
    page.at('div #div_id_ano .form-control-static').text.strip
  end

  def get_description
    desc = page.at('div #div_id_ementa .form-control-static').text.strip
    desc.gsub("\r", " ")
  end

  def get_link
    link = page.at('#div_id_texto_original a').attributes["href"].value
    "https://sapl.al.ac.leg.br#{link}"
  end

  def get_date
    page.at('div #div_id_data_apresentacao .form-control-static').children.text.strip
  end

  def get_steps
    page = agent.get("#{url}/tramitacao")
    lines = page.search('table tr')

    steps = []

    lines.each_with_index do |line, index|
      next if index == 0
      date = line.search('td').first.text.strip
      origin = line.search('td')[1].text.split("-").first.strip
      destination = line.search('td')[2].text.split("-")[1].strip
      steps << [date, origin, "#{destination}: #{get_status}"]
    end

    steps
  end
end
