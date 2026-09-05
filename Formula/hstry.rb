# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.24/hstry-v0.5.24-x86_64-apple-darwin.tar.gz"
      sha256 "4f3ed8221e71043f9bba03c18eac6a0e387ca6951721de065fb34894cd10f9b8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.24/hstry-v0.5.24-aarch64-apple-darwin.tar.gz"
      sha256 "32bc3ed7729ac4eb7859e4c0d042349ff07f8eeb679102a32a9f3bb87e66be7d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.24/hstry-v0.5.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80bf6afd62928e9737185bfba85d651f1e0439140fd0eadcb005c5fb18bd2700"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.24/hstry-v0.5.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "008d85004ac81091934cbcc6292dff2532a29be9664341f97360b696541ec25e"
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
    system "#{bin}/hstry", "--version"
  end
end
