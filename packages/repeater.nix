{
  lib,
  fetchFromGitHub,
  rustPlatform
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "repeater";
  version = "0.0.26";

  src = fetchFromGitHub {
    owner = "shaankhosla";
    repo = "repeater";
    tag = "v${finalAttrs.version}";
    hash = "sha256-QjT2hljxvRe9XczFNMWV9DKteF6Lob+ix7EnGQ++TyM=";
  };

  cargoHash = "sha256-FlXhiKzDFxvSFTRPtgG93xRpljO/w8jOnZK3wEz1Rjw=";

  meta = {
    description = "A command-line flashcard program that uses spaced repetition to boost your memory retention.";
    homepage = "https://github.com/shaankhosla/repeater";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
