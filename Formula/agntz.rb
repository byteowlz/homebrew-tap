# typed: false
# frozen_string_literal: true

class Agntz < Formula
  desc "unified toolbox for agents"
  homepage "https://github.com/byteowlz/agntz"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.0/agntz-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "42ff2eb0e689832ce8916391a568837e127b36cf00366907654b51b6b70a0917"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.0/agntz-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "1b68f2b3329a18845d8f81e2a34137ab9ecb13b0821c9dbd3a19c1a7826bbd61"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.0/agntz-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db3e9133ebc805cc17ee20c4edd746737e3cad5fd42f707f050d2b248dd484dc"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.0/agntz-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "795e9e0dee90b5b9bac9f833edf1ea5d0cc03fdcaf7e33ae8bc1400039e8fbca"
    end
  end

  def install
    # Install all binaries found in the archive
    Dir.glob("*").each do |file|
      next if File.directory?(file)
      next unless File.executable?(file)
      bin.install file
    end
  end

  test do
    system "#{bin}/agntz", "--version"
  end
end
