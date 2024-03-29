class Pbkit < Formula
  desc "Protobuf toolings"
  homepage "https://github.com/pbkit/pbkit"
  url "https://github.com/pbkit/pbkit/archive/refs/tags/v0.0.51.tar.gz"
  sha256 "7103a0a72182db8513390b47e6fa3012c59de49570ca96e32d591ca60e87c899"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  deprecate! date: "2022-07-13", because: "is moved to pbkit/tap/pbkit. Install pbkit/tap/pbkit instead."
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "pb", "-A", "--unstable", libexec/"cli/pb/entrypoint.ts"
    system "deno", "install", "--root", libexec, "-n", "pollapo", "-A", "--unstable", libexec/"cli/pollapo/entrypoint.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
