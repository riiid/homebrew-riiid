class Toolbelt < Formula
  desc "cli utilities for riiid engineering"
  homepage "https://github.com/riiid/toolbelt"
  url "https://github.com/riiid/toolbelt/archive/v0.0.6.tar.gz"
  sha256 "0e4ff153ae169691430877de23b05d5053c880fee96dfc8d87323aeb8515768c"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "riiid-extract-keycloak-groups", "-A", "--unstable", libexec/"keycloak/extract-group-mapping-from-proto-services.ts"
    system "deno", "install", "--root", libexec, "-n", "gen-ssp", "-A", "--unstable", libexec/"gen-ssp/gen/index.ts"
    system "deno", "install", "--root", libexec, "-n", "create-react-component", "-A", "--unstable", libexec/"www-snippet/create-react-component/entrypoint.ts"
    system "deno", "install", "--root", libexec, "-n", "organize-import-path", "-A", "--unstable", libexec/"www-snippet/organize-import-path/entrypoint.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
