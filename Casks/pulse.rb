# https://docs.brew.sh/Cask-Cookbook
cask "pulse" do
    version "0.1.16"
    arch arm: "aarch64", intel: "x64"
    sha256 arm: "db1d6f4431b00d69b41a0a94284c91bf6a418db8399147b97ffd48fb397b102f",
        intel: "091c5def75bcea7efe2d13b96b2103f131f16081debdf83496b1054d246a7063"

    url "https://github.com/YiweiShen/pulse-app/releases/download/v#{version}/Pulse_#{arch}.app.tar.gz"
    name "pulse"
    desc "A minimalist macOS menubar app for email notifications."
    homepage "https://github.com/YiweiShen/pulse-app"

    livecheck do
        url "https://github.com/YiweiShen/pulse-app"
        strategy :github_latest
    end

    # auto_updates true
    depends_on macos: ">= :high_sierra"

    app "Pulse.app"

    postflight do
        system_command "/bin/chmod", args: ["+x", "/Applications/Pulse.app"], sudo: true
        system_command "/usr/bin/xattr", args: ["-cr", "/Applications/Pulse.app"], sudo: true
        system_command "/usr/bin/codesign", args: ["--force", "--deep", "--sign", "-", "/Applications/Pulse.app"], sudo: true
    end

    zap trash: [
        "~/Library/Application Support/com.yiweishen.pulse.app",
        "~/Library/Caches/com.yiweishen.pulse.app",
        "~/Library/Preferences/com.yiweishen.pulse.app.plist",
        "~/Library/WebKit/com.yiweishen.pulse.app",
    ]
end
