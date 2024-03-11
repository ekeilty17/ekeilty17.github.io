---
layout:     post
title:      "Tikz Plugin for Jekyll Websites Hosted on GitHub"
date:       2023-09-23
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       tikz, jekyll
---

Occasionally, I write <a href="/blog/" target="_blank">blog posts</a> about math-related concepts. For me, [Tikz](https://www.overleaf.com/learn/latex/TikZ_package) is an indispensable tool for these posts. If Tikz could not be integrated into my Jekyll website, then I would have had to switch to a different website framework. Luckily for me, I figured out a way to include Tikz (you can see examples in some of my blog posts, such as <a href="/blog/trigonometry/intuition-of-trig-functions/" target="_blank">here</a>).

In this post, I will explain how to integrate Tikz into a Jekyll website. It's a bit of a hacky solution and it's actually quite involved due to some annoyances with GitHub hosting.

<br>

## Setup

We are creating a custom Jekyll plugin. The setup requires the following steps.

1. Create a plugins folder `/_plugins/` in your project's root direction.
2. Install `texlive` and `pdf2svg` on your local machine.
3. In `_config.yml`, add the path to the `pdf2svg` binary as a variable called `pdf2svg`. Ultimately, this is going to be used to execute `pdf2svg file.pdf file.svg` on your local machine. In my case, this line is given below.

```yml
pdf2svg: 'pdf2svg'
```

<br>

## Jekyll-Tikz Custom Plugin

Create the file `/_plugins/jekyll-tikz.rb` with the following contents.

```ruby
module Jekyll
  module Tags
    class Tikz < Liquid::Block
      def initialize(tag_name, markup, tokens)
        super
        @file_name = markup.gsub(/\s+/, "")

        @header = <<-'END'
        \documentclass{standalone}
        \usepackage{tikz}
        % Add any other packages you want to include
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

        tmp_directory = File.join(Dir.pwd, "_tikz_tmp", File.basename(context["page"]["url"], ".*"))
        tex_path = File.join(tmp_directory, "#{@file_name}.tex")
        pdf_path = File.join(tmp_directory, "#{@file_name}.pdf")
        FileUtils.mkdir_p tmp_directory

        dest_directory = File.join(Dir.pwd, "svg", File.basename(context["page"]["url"], ".*"))
        dest_path = File.join(dest_directory, "#{@file_name}.svg")
        FileUtils.mkdir_p dest_directory

        pdf2svg_path = context["site"]["pdf2svg"]

        # if the file doesn't exist or the tikz code is not the same with the file, then compile the file
        if !File.exist?(tex_path) or !tikz_same?(tex_path, tikz_code) or !File.exist?(dest_path)
          File.open(tex_path, 'w') { |file| file.write("#{tikz_code}") }
          system("pdflatex -output-directory #{tmp_directory} #{tex_path}")
          system("#{pdf2svg_path} #{pdf_path} #{dest_path}")
        end

        web_dest_path = File.join("/svg", File.basename(context["page"]["url"], ".*"), "#{@file_name}.svg")
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
```

I did not create this myself (although I have modified it for my specific blog, you can see it [here](https://github.com/ekeilty17/ekeilty17.github.io/blob/main/_plugins/jekyll-tikz.rb)). The original file says it was created by [MaxFan](http://github.com/Maxfan-zone http://maxfan.org) (but this link doesn't work anymore). You'll also find it on various GitHubs ([here](https://gist.github.com/i2000s/d81aaa89101555b1965eeb514ed6bca5) and [here](https://gist.github.com/AlexBobkov/d419863e610fce7c8db5714b665b009e)).

<br>

### How To Use the Plugin

Within your markdown file, you use the following syntax, where `image-name` is the name of the corresponding Tikz files.

```HTML
<center>
{% raw %}{% tikz image-name %}
    % Tikz code
{% endtikz %}{% endraw %}
</center>
```

You don't have to include `center`, but I think it looks nicer. Also, you can put multiple images next to each other with the following syntax (so long as they can fit on one line).

```HTML
<center>
{% raw %}{% tikz image-name-1 %}
    % Tikz code
{% endtikz %}
{% tikz image-name-2 %}
    % Tikz code
{% endtikz %}{% endraw %}
</center>
```

If you want them on different lines, add `<br>` between them.

<br>

### How Does it Work?

What is this plugin doing at a high level?
1. Tikz code is given as input (provided by the above syntax).
2. Creates a standalone LaTeX document in order to render the Tikz code.
3. The standalone LaTeX document is rendered using `texlive` and the results are saved in `/_tikz_tmp/`. This contains the LaTeX code and the resulting PDF.
4. Then, the PDF is converted into an SVG file using `pdf2svg` and the results are saved in `/svg/`.
5. When the Jekyll website is compiled (results in `/_site/`), the Tikz input syntax (above) is replaced by a reference to the SVG file. Thus, the Tikz image will appear in the rendered HTML.

Apart from this workflow, there is some extra logic to increase efficiency. For example, it checks whether the Tikz image file exists or if the Tikz code has changed, and only then will it compile or re-compile the code. Otherwise, we would have to re-compile all Tikz images every time we update the website.

Test this code out locally to make sure it works before moving on to the next step (deploying on the website).

<br>

## Deploying to a GitHub-Hosted Website

If (like me) you host your Jekyll website on GitHub, then the above will not work on the deployed website. GitHub operates in **safe-mode** and only allows approved Jekyll plugins. Thus, our custom plugin will work locally, but will not work on the actual website. Urgh!

Luckily, I figured out a workaround. First, let's refresh ourselves on how exactly Jekyll works. The framework reads our project and compiles it into a _static_ website in the `/_site/` folder. There, all of the Liquid syntax has been replaced with the long-form HTML, including our Tikz drawings. The issue we are facing is that GitHub is refusing to compile the `{% raw %}{% tikz image-name %} {% endtikz %}{% endraw %}` Liquid syntax since it requires a custom plugin. 

The workaround is that we are going to compile it locally, and then simply push the website files in `/_site/` to the repository. Thus, GitHub is only reading a static HTML website and our custom plugin is not required at deployment. However, we want to do this while maintaining the benefits of using Liquid and Jekyll.

<br>

### Reconfiguring GitHub

There may be other ways of accomplishing the same thing, but this is what works best for me. In my repository, I have two branches: `main` and `gh-pages`. The `main` branch contains the Jekyll project and all of the main code files. However, `main` is not the deployment branch. Instead, the `/_site/` files from `main` are copied into the `gh-pages` branch. This branch just contains the raw HTML files to render the website. This is the repository read by the deployed website.

Here are the steps to configuring GitHub in this way.
1. Create a new branch `gh-pages`.
2. In the repository settings, go to Pages >> Build and deployment >> Branch, and set `gh-pages` as the build branch.
3. Push the contents of the `/_site/` folder in the `main` branch to the `gh-pages` branch.

Even though this seems convoluted, I actually like it. It means I can make commits to `main` without updating the website. Pushing to `gh-pages` acts as the final deployment step.

<br>

### Bash Script

In this workflow, every time you want to update the website, you have to redo step 3 from above. This can be tedious. To avoid error, I have a bash script with does this for me. The code is found below.

```bash
BUILD_FOLDER="_site";
PUSH_FOLDER="_site_ghpages"; 
COMMIT_MESSAGE=$1

#Remove all the content from the "PUSH_FOLDER".
function removeAllContentFromPushFolder(){
        echo $(rm -r $PUSH_FOLDER/*);
}

# Delete the "PUSH_FOLDER"
function deletePushFolder(){
        echo $(rm -rf $PUSH_FOLDER);
}

#Create the folder "PUSH_FOLDER".
function createFolderToPush(){
        echo "$(mkdir $PUSH_FOLDER)"
}

#Copy all the content from the folder _site to PUSH_FOLDER.
function copySiteToFolder(){
    echo "$(cp -r $BUILD_FOLDER/. $PUSH_FOLDER)"
}

#Clone only the branch "gh-pages" to the folder "PUSH_FOLDER". 
function cloneGhpages(){
    echo "$(git clone --branch gh-pages `git config remote.origin.url` $PUSH_FOLDER)"
}

function prepareThePushFolder(){
    if [[ -d ./$PUSH_FOLDER ]]
    then
        #Delete "PUSH_FOLDER".
        deletePushFolder
    else
        #Create the folder "PUSH_FOLDER" if it doesn't exist.
        createFolderToPush
    fi
    #Call the function that clone the branch "gh-pages" to the folder "PUSH_FOLDER". 
    cloneGhpages
    #Call the function that copy all the content from the folder _site to "PUSH_FOLDER".
    copySiteToFolder
}

function changeDirectoryToGhpages(){
    CHANGE_TO_SITE= cd $PUSH_FOLDER
    echo $CHANGE_TO_SITE;
}

function setMessageCommit(){
    if ! [ "$COMMIT_MESSAGE" ]
    then
      COMMIT_MESSAGE='automatic commit'
    else
      echo "$COMMIT_MESSAGE"
    fi
}

function pushBranchGhpages(){
    git add .
    git commit -m "$COMMIT_MESSAGE"
    git push
}

function changeDirectoryBack(){
    BACKFOLDER= cd ..
    echo $BACKFOLDER
}

prepareThePushFolder
changeDirectoryToGhpages
setMessageCommit
pushBranchGhpages
changeDirectoryBack
```

I think the bash file is self-explanatory, so I won't bother dissecting it.