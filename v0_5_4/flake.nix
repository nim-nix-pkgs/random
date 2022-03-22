{
  description = ''Pseudo-random number generation library inspired by Python'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-random-v0_5_4.flake = false;
  inputs.src-random-v0_5_4.ref   = "refs/tags/v0.5.4";
  inputs.src-random-v0_5_4.owner = "oprypin";
  inputs.src-random-v0_5_4.repo  = "nim-random";
  inputs.src-random-v0_5_4.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-random-v0_5_4"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-random-v0_5_4";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}