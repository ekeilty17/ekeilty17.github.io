# Authored my Maxfan http://github.com/Maxfan-zone http://maxfan.org
# This is used to convert tikz code into svg file and load in you jekyll site
#
# Install:
#
#   1. Copy this file in your _plugins/ directory. You can customize it, of course.
#   2. Make sure texlive and pdf2svg are installed on your computer.
#   3. Set path to pdf2svg in _config.yml in "pdf2svg" variable
#
# Input:
#   
#   {% tikz filename %}
#     \tikz code goes here 
#   {% endtikz %}
#
# This will generate a /img/post-title-from-filename/filename.svg in your jekyll directory
# 
# And then return this in your HTML output file:
#   
#   <embed src="/svg/post-title-from-filename/tikz-filename.svg" type="image/svg+xml" />
#   
# Note that it will generate a /_tikz_tmp/ directory to save tmp files.
#

module Jekyll
  module Tags
    class Tikz < Liquid::Block
      def initialize(tag_name, markup, tokens)
        super
        @file_name = markup.gsub(/\s+/, "")

        @header = <<-'END'
\documentclass{standalone}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{tikz}
\usepackage{tikz-3dplot}
\usepackage{pgfplots}
\usepackage{pst-plot}
\pgfplotsset{compat=1.18} % version number
\usepackage{physics}
\usepackage[outline]{contour} % glow around text
\begin{document}
\begin{tikzpicture}
        END

        @footer = <<-'END'
\end{tikzpicture}
\end{document}
        END
      end

      def render(context)
        tikz_code = @header + super + @footer

        # compute the path we are going to save our svg image in
        post_url = context["page"]["url"]
        post_name = File.basename(post_url, ".*")
        post_series = context["page"]["series"]
        post_series_part = context["page"]["part"]
        if post_series
          # If the post is part of a series, I want to name the file in a particular way so the posts are easier to find
          file_save_path = File.join(post_series, "#{post_series_part}:#{post_name}")
        else
          file_save_path = post_name
        end

        # I think this is just for debugging, I'm not sure why it's necessary
        tmp_directory = File.join(Dir.pwd, "_tikz_tmp", file_save_path)
        tex_path = File.join(tmp_directory, "#{@file_name}.tex")
        pdf_path = File.join(tmp_directory, "#{@file_name}.pdf")
        FileUtils.mkdir_p tmp_directory

        # This is where we save the svg file, which is loaded by the website
        dest_directory = File.join(Dir.pwd, "svg", file_save_path)
        dest_path = File.join(dest_directory, "#{@file_name}.svg")
        FileUtils.mkdir_p dest_directory

        pdf2svg_path = context["site"]["pdf2svg"]

        # if the file doesn't exist or the tikz code is not the same with the file, then compile the file
        if !File.exist?(tex_path) or !tikz_same?(tex_path, tikz_code) or !File.exist?(dest_path)
          File.open(tex_path, 'w') { |file| file.write("#{tikz_code}") }
          system("pdflatex -output-directory #{tmp_directory} #{tex_path}")
          system("#{pdf2svg_path} #{pdf_path} #{dest_path}")
        end

        # embedding the link to the svg file
        web_dest_path = File.join("/svg", file_save_path, "#{@file_name}.svg")
        "<embed src=\"#{web_dest_path}\" type=\"image/svg+xml\" />"
      end

      private

      def tikz_same?(file, code)
        File.open(file, 'r') do |file|
          file.read == code
        end
      end

    end
  end
end

Liquid::Template.register_tag('tikz', Jekyll::Tags::Tikz)