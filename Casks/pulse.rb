# https://docs.brew.sh/Cask-Cookbook
cask "pulse" do
    version "0.1.17"
    arch arm: "aarch64", intel: "x64"
    sha256 arm: "b4b4b1a31a8c2e154f34fe1072cae3fc0ad5a0f3c6cf530235768f1ca9694d49",
        intel: "7cfeb4e506d2bc596e3dda3ed33f55748fc785cb09661721db3572c092517e3e"

    url "https://github.com/YiweiShen/pulse-app/releases/download/v#{version}/Pulse_#{arch}.app.tar.gz"
    name "pulse"
    desc "A minimalist macOS menubar app for email notifications."
    homepage "https://github.com/YiweiShen/pulse-app"

    livecheck do
        url "https://github.com/YiweiShen/pulse-app"
        strategy :github_latest
    end

    # auto_updates true

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
