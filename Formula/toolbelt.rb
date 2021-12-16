class Toolbelt < Formula
  desc "cli utilities for riiid engineering"
  homepage "https://github.com/riiid/toolbelt"
  url "https://github.com/riiid/toolbelt/archive/v0.0.5.tar.gz"
  sha256 "3de1d47a4bdeb309e2199a4a73e294f24f5307f05e19b8b5694639c712d22944"
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
