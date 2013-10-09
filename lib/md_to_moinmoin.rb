require "md_to_moinmoin/version"
require 'redcarpet'

module MdToMoinmoin
  class Moinmoin < Redcarpet::Render::Base
    def header(text, level)
      prefix = "=" * level
      "\n\n#{prefix} #{text} #{prefix}\n"
    end

    def paragraph(text)
      "\n#{text}\n"
    end

    def block_code(code, language)
      "\n{{{#!#{language}\n#{code}}}}\n"
    end

    def block_quote(quote)
      quote.each_line.map {|l| "    #{l}"}.join
    end

    def list(contents, list_type)
      contents
    end

    def list_item(text, list_type)
      "\n * #{text}"
    end

    def link(link, title, content)
      "[[#{link}|#{content}]]"
    end

    def double_emphasis(text)
      "'''#{text}'''"
    end

    def emphasis(text)
      "''#{text}''"
    end
  end
end
