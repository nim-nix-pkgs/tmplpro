{
  description = ''Text template processor, basic capabilities'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-tmplpro-v0_1_2.flake = false;
  inputs.src-tmplpro-v0_1_2.owner = "mjfh";
  inputs.src-tmplpro-v0_1_2.ref   = "refs/tags/v0.1.2";
  inputs.src-tmplpro-v0_1_2.repo  = "nim-tmplpro";
  inputs.src-tmplpro-v0_1_2.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-tmplpro-v0_1_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-tmplpro-v0_1_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}