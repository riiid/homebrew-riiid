class Pollapo < Formula
  desc "Protobuf dependency management tool"
  homepage "https://github.com/riiid/pbkit/tree/main/cli/pollapo"
  url "https://github.com/riiid/pbkit/archive/v0.0.2.tar.gz"
  sha256 "4749193a9cb76b1a6b34d43c7cdd082fc12983223ad6410f79525ebfa01fd4ad"
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
