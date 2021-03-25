class Opener < Formula
  desc "Open URL from the remote"
  homepage "https://github.com/superbrothers/opener"
  version "0.0.2"
  if Hardware::CPU.arm?
    url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-arm64.zip"
    sha256 "67cb8416bb079099d9deb578280ed8fdaced8ba75faa07f5ea69c64bf76a061a"
  else
    url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-amd64.zip"
    sha256 "086d9707794856d8416d85baa5ffab0c1fb26e95907677b4e91f62e747f80a07"
  end
  license "MIT"

  def install
    bin.install "opener"
  end

  plist_options manual: "opener"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/opener</string>
        </array>
      </dict>
      </plist>
    EOS
  end
end
# vim: set fenc=utf-8 :
