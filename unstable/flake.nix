{
  description = ''Text template processor, handy not only for CGI'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-tmplpro-unstable.flake = false;
  inputs.src-tmplpro-unstable.owner = "mjfh";
  inputs.src-tmplpro-unstable.ref   = "unstable";
  inputs.src-tmplpro-unstable.repo  = "nim-tmplpro.git";
  inputs.src-tmplpro-unstable.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-tmplpro-unstable"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-tmplpro-unstable";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}