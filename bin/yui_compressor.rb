require "yui/compressor"

begin
  gem "main", ">= 2.8.2" # 2.8.2 has a bugfix for the default block for -1 arity arguments
  require "main"
rescue
  Gem::LoadError
  STDERR.puts "need the main gem to run ci_console. sudo gem install main"
end


Main::Softspoken.off!
CompressorConsole = Main.create do
    description <<-EOS
    compress js or css files, will rename them filename.min.(js|css)
    EOS

    examples <<-EOS
    yui_compressor file.js # => file.min.js
    
    yui_compressor file.css # => file.min.css
    
    Add the -g or --gzip flag to gzip the file
    yui_compressor file.js --gzip # => file.min.js.gz
    
    EOS
    
    argument "file" do
      description "The javascript or css file to compress"
      required true
      attribute
    end
    
    option "gzip" do
      description "gzip the compressed file"
    end
    
    run do
      # ==== Example: Compress CSS
      #   compressor = YUI::CssCompressor.new
      #   compressor.compress(<<-END_CSS)
      #     div.error {
      #       color: red;
      #     }
      #     div.warning {
      #       display: none;
      #     }
      #   END_CSS
      #   # => "div.error{color:red;}div.warning{display:none;}"
      #
      # ==== Example: Compress JavaScript
      #   compressor = YUI::JavaScriptCompressor.new
      #   compressor.compress('(function () { var foo = {}; foo["bar"] = "baz"; })()')
      #   # => "(function(){var foo={};foo.bar=\"baz\"})();"
      #
      # ==== Example: Compress and gzip a file on disk
      #   File.open("my.js", "r") do |source|
      #     Zlib::GzipWriter.open("my.js.gz", "w") do |gzip|
      #       compressor.compress(source) do |compressed|
      #         while buffer = compressed.read(4096)
      #           gzip.write(buffer)
      #         end
      #       end
      #     end
      #   end
      #
    end
end

CompressorConsole.new.run
