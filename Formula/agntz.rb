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
      sha256 "a7fc1008c1f2b191407fbb5642a7d7a3a583eae23f37db6a727475c3639765e5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.0/agntz-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "c420d4d12b4f8e54423389213a53e6a6674597b2c66e23c6f1563f6a91042d67"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.0/agntz-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8d6530296fb7cb3e00532fc307fdfee6949006ff53aacb173754656051c45b5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.0/agntz-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6e359a7e6f291a077f5380e4333d8bd0894043a2b7dcfc92ad58fcdda77797aa"
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
