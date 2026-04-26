# typed: false
# frozen_string_literal: true

class Hira < Formula
  desc "Hira CLI — local agent runtime and management tool for the Hira platform"
  homepage "https://github.com/hira-vn/hira"
  url "https://github.com/hira-vn/hira/archive/refs/tags/latest.tar.gz"
  sha256 "795ca781b858a7dbebaf4c50e82d6725708a642ab55b4625f35b477cb820feae"
  version "1.0.1"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    cd "server" do
      system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/hira"
    end
  end

  test do
    system "#{bin}/hira", "version"
  end
end
