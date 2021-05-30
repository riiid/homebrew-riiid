class Pollapo < Formula
  desc "Protobuf dependency management tool"
  homepage "https://github.com/riiid/pbkit/tree/main/cli/pollapo"
  url "https://github.com/riiid/pbkit/archive/v0.0.8.tar.gz"
  sha256 "8a19b7da4caa5c6c2179392ab7a0eb779b03245ced2ae3e65df3949802588aba"
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
