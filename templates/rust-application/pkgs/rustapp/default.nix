{ lib
, rustPlatform
}:

rustPlatform.buildRustPackage {
  pname = "rustapp";
  version = "0.1.0";
  src = ../../.;
  cargoLock.lockFile = ../../Cargo.lock;

  meta = {
    description = "A Rust application";
    homepage = "";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [];
    mainProgram = "rustapp";
    platforms = lib.platforms.unix;
  };
}
