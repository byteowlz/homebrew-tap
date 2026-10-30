# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.11.0/eavs-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "21529e6124be820f1ded9a3468caddd2585b99202c706dcad529575efa33b15f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.11.0/eavs-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "3bfc46d96b1c08897b90131b324fe9ff5be121a6bf9e9bb4f5161e3b6814a746"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.11.0/eavs-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b11e0b6671a2ce611fdb50da1681008cde517449b8720a985a1488ed75e0a93"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.11.0/eavs-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e180337507cf565232a4a9f60186be2786fd22331c366b1c78a3d8fde84c1fdb"
    end
  end

  def install
    # byt-packaged tarballs stage executables under bin/; older flat
    # tarballs keep them at the archive root. Support both.
    if Dir.exist?("bin")
      bin.install Dir["bin/*"]
    else
      Dir.glob("*").each do |file|
        next if File.directory?(file)
        next unless File.executable?(file)
        bin.install file
      end
    end
  end

  test do
    system "#{bin}/eavs", "--version"
  end
end
