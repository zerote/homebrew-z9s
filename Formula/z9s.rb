class Z9s < Formula
  desc "Unified Kubernetes CLI with FluxCD support and metrics dashboard"
  homepage "https://github.com/zerote/z9s"
  url "https://github.com/zerote/z9s/archive/refs/tags/v0.54.3.tar.gz"
  sha256 "a5d904045781464e68b9699d11c9895ec76147e8e15294bc53622c1b0a83e372"
  license "Apache-2.0"
  
  depends_on "go" => :build
  depends_on "kubectl"

  def install
    system "go", "build", 
            "-ldflags", 
            "-X github.com/yourusername/z9s/cmd.version=#{version} " \
            "-X github.com/yourusername/z9s/cmd.commit=#{ENV.fetch('GIT_COMMIT', 'unknown')} " \
            "-X github.com/yourusername/z9s/cmd.date=#{Time.now.iso8601}",
            "-o", bin/"z9s"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/z9s version")
  end
end
