class Pollapo < Formula
  desc "Protobuf dependency management tool"
  homepage "https://github.com/riiid/pbkit/tree/main/cli/pollapo"
  url "https://github.com/riiid/pbkit/archive/v0.0.1.tar.gz"
  sha256 "b7bb9fec6697859f8b68e5ccb6ca214a69564713049fc12fcd72359b7e12456e"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  depends_on "gh"
  bottle :unneeded
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "pollapo", "-A", "--unstable", libexec/"cli/pollapo/entrypoint.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
