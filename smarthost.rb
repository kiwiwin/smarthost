require 'open-uri'

class SmartHost

	def hostname
		`cat /etc/hostname`
	end

	def newhostPairs
		url = 'http://smarthosts.googlecode.com/svn/trunk/hosts'

		page = open(url)
		lines = page.readlines
		lines.unshift('127.0.0.1 ' + hostname)
	end

	def update
		hostsFile = File.new("/etc/hosts", "w+")

		hostsFile.puts newhostPairs
	end
end

SmartHost.new.update
