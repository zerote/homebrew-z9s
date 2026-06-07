class Z9s < Formula
  desc "Unified Kubernetes CLI with FluxCD support and metrics dashboard"
  homepage "https://github.com/zerote/z9s"
  url "https://github.com/zerote/z9s/archive/refs/tags/v0.54.14.tar.gz"
  sha256 "4d86f6ca7bf492e513802e6dbafbfc7c1cb440db515f1d5b16523f50e1a302a3"
  license "Apache-2.0"
  
  depends_on "go" => :build
  depends_on "kubectl"

  def install
    system "go", "build", 
            "-ldflags", 
            "-X github.com/zerote/z9s/cmd.version=#{version} " \
            "-X github.com/zerote/z9s/cmd.commit=#{ENV.fetch('GIT_COMMIT', 'unknown')} " \
            "-X github.com/zerote/z9s/cmd.date=#{Time.now.iso8601}",
            "-o", bin/"z9s"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/z9s version")
  end
end
