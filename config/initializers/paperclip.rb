# XXX fix “is not recognized by the ‘identify’ command.” error
# Put the path to image magick directory in the command_path
# http://blog.jonathanhinson.com/2009/04/27/getting-paperclip-working-in-windows/

Paperclip.options[:command_path] = 'C:\\Program Files\\ImageMagick-6.5.3-Q16'
Paperclip.options[:swallow_stderr] = false