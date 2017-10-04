{ pkgs, ... }:

{
  users.extraUsers.endertux = {
    password = "dummy"; # first boot only!
    uid = 1000;
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ 
      "adbusers"
      "networkmanager"
      "wheel"
    ];
  };
}
