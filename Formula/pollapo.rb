class Pollapo < Formula
  desc "Protobuf dependency management tool"
  homepage "https://github.com/riiid/pbkit/tree/main/cli/pollapo"
  url "https://github.com/riiid/pbkit/archive/v0.0.7.tar.gz"
  sha256 "e0f68953dbe29ab48cc7190cc606cf6899c0c1063fcf2f3c58757a530260292a"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  bottle :unneeded
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "pollapo", "-A", "--unstable", libexec/"cli/pollapo/entrypoint.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
