cask "plainsay" do
  version "0.2.28"
  sha256 "3397a63192b7e0338c811d5733c3d0aad9af80fbf028280305e091e1acb50228"

  url "https://github.com/conrader/plainsay/releases/download/v#{version}/Plainsay-#{version}.dmg",
      verified: "github.com/conrader/plainsay/"
  name "Plainsay"
  desc "Free, open-source, on-device dictation"
  homepage "https://plainsay.app/"

  livecheck do
    url "https://api.plainsay.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Plainsay.app"

  zap trash: [
    "~/Library/Application Support/Plainsay",
    "~/Library/Caches/com.plainsay.dictation",
    "~/Library/Preferences/com.plainsay.dictation.plist",
    "~/Library/Saved Application State/com.plainsay.dictation.savedState",
  ]
end
