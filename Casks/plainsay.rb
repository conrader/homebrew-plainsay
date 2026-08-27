cask "plainsay" do
  version "0.2.29"
  sha256 "80c36de5ba162d1d96f936f0921d4c6d4fb0ecd52ebcdf7fb5910d83766ca037"

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
