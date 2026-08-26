# typed: false
# frozen_string_literal: true

class Scrpr < Formula
  desc "Get main text from websites in the cli"
  homepage "https://github.com/byteowlz/scrpr"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.2.0/scrpr-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "e00c34cb3a2e92246f8e0a49456e570e67cd7cfccee874550d47f4a275c004c0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.2.0/scrpr-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "8266b4d5deabfc64ec79eb17a45971704c38c0da79cfb183bc395d768e6bdd6c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.2.0/scrpr-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6478dd171805aed9c9f7a579afc0d98bd17e831b477de55adca86816058394e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.2.0/scrpr-v1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30df7bcaa1fe417302fd2dd71ccdf5ce60a367b87d1c33960b24f83927ab945a"
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
    system "#{bin}/scrpr", "--version"
  end
end
