{ lib, stdenv
, libXScrnSaver
, makeWrapper
, fetchurl
, wrapGAppsHook
, glib
, gtk3
, unzip
, atomEnv
, libuuid
, at-spi2-atk
, at-spi2-core
, libdrm
, mesa
, libxkbcommon
, libappindicator-gtk3
, libxshmfence
, libglvnd
, wayland
}@args:

let
  mkElectron = import ./generic.nix args;
in
rec {

  electron-bin = electron_25-bin;

  electron_9-bin = mkElectron "9.4.4" {
    x86_64-linux = "781d6ca834d415c71078e1c2c198faba926d6fce19e31448bbf4450869135450";
    x86_64-darwin = "f41c0bf874ddbba00c3d6989d07f74155a236e2d5a3eaf3d1d19ef8d3eb2256c";
    i686-linux = "40e37f8f908a81c9fac1073fe22309cd6df2d68e685f83274c6d2f0959004187";
    armv7l-linux = "2dfe3e21d30526688cc3d3215d06dfddca597a2cb62ff0c9d0d5f33d3e464a33";
    aarch64-linux = "f1145e9a1feb5f2955e5f5565962423ac3c52ffe45ccc3b96c6ca485fa35bf27";
    headers = "0yx8mkrm15ha977hzh7g2sc5fab9sdvlk1bk3yxignhxrqqbw885";
  };

  electron_10-bin = mkElectron "10.4.7" {
    x86_64-linux = "e3ea75fcedce588c6b59cfa3a6e46ba67b789e14dc2e5b9dfe1ddf3f82b0f995";
    x86_64-darwin = "8f01e020563b7fce68dc2e3d4bbf419320d13b088e89eb64f9645e9d73ad88fb";
    i686-linux = "dd7fde9b3993538333ec701101554050b27d0b680196d0883ab563e8e696fc79";
    armv7l-linux = "56f11ed14f8a620650d31c21ebd095ce59ef4286c98276802b18f9cc85560ddd";
    aarch64-linux = "0550584518c8e98fe1113706c10fd7456ec519f7aa6867fbff17c8913327d758";
    headers = "01x6a0r2jawjpl09ixgzap3g0z6znj34hsnnhzanavkbds0ri4k6";
  };

  electron_11-bin = mkElectron "11.5.0" {
    x86_64-linux = "613ef8ac00c5abda425dfa48778a68f58a2e9c7c1f82539bb1a41afabbd6193f";
    x86_64-darwin = "32937dca29fc397f0b15dbab720ed3edb88eee24f00f911984b307bf12dc8fd5";
    i686-linux = "cd154c56d02d7b1f16e2bcd5650bddf0de9141fdbb8248adc64f6d607e5fb725";
    armv7l-linux = "3f5a41037aaad658051d8bc8b04e8dece72b729dd1a1ed8311b365daa8deea76";
    aarch64-linux = "f698a7743962f553fe36673f1c85bccbd918efba8f6dca3a3df39d41c8e2de3e";
    aarch64-darwin = "749fb6bd676e174de66845b8ac959985f30a773dcb2c05553890bd99b94c9d60";
    headers = "1zkdgpjrh1dc9j8qyrrrh49v24960yhvwi2c530qbpf2azgqj71b";
  };

  electron_12-bin = mkElectron "12.2.3" {
    armv7l-linux = "4de83c34987ac7b3b2d0c8c84f27f9a34d9ea2764ae1e54fb609a95064e7e71a";
    aarch64-linux = "d29d234c09ba810d89ed1fba9e405b6975916ea208d001348379f89b50d1835c";
    x86_64-linux = "deae6d0941762147716b8298476080d961df2a32d0f6f57b244cbe3a2553cd24";
    i686-linux = "11b4f159cd3b89d916cc05b5231c2cde53f0c6fb5be8e881824fde00daa5e8c2";
    x86_64-darwin = "5af34f1198ce9fd17e9fa581f57a8ad2c9333187fb617fe943f30b8cde9e6231";
    aarch64-darwin = "0db2c021a047a4cd5b28eea16490e16bc82592e3f8a4b96fbdc72a292ce13f50";
    headers = "1idam1xirxqxqg4g7n33kdx2skk0r351m00g59a8yx9z82g06ah9";
  };

  electron_13-bin = mkElectron "13.6.9" {
    armv7l-linux = "e70cf80ac17850f3291c19a89235c59a7a6e0c791e7965805872ce584479c419";
    aarch64-linux = "cb570f77e46403a75b99740c41b297154f057dc3b9aa75fd235dccc5619972cf";
    x86_64-linux = "5e29701394041ba2acd8a9bb042d77967c399b8fe007d7ffbd1d3e6bfdb9eb8a";
    i686-linux = "7c31b60ee0e1d9966b8cf977528ace91e10ce25bb289a46eabbcf6087bee50e6";
    x86_64-darwin = "3393f0e87f30be325b76fb2275fe2d5614d995457de77fe00fa6eef2d60f331e";
    aarch64-darwin = "8471777eafc6fb641148a9c6acff2ea41c02a989d4d0a3a460322672d85169df";
    headers = "0vvizddmhprprbdf6bklasz6amwc254bpc9j0zlx23d1pgyxpnhc";
  };

  electron_14-bin = mkElectron "14.2.9" {
    armv7l-linux = "02ae6cd9ec9c2dcb2f550923576a0c851fff3e796a5048dd3806947c541fd564";
    aarch64-linux = "631ba0f716d0272931418de42468114360bd21ec72875605fc32d67620743d2c";
    x86_64-linux = "0a62a41e8ac4592aba347c82f9c40f3fb4c84c7d00b6bb9501d02375cd49cb7d";
    i686-linux = "55e395a209d4a90e2dcd20a78af4724355feaba86411a39e66b977ed39de4d05";
    x86_64-darwin = "1df5b4c4414ade75c6cbfe13d3024702b8ae7c77f3f07b8955b2459fde6a5842";
    aarch64-darwin = "17089e54830976c4216d26e7e2e15ad2224e3b288d94973fed7e67e9b1c213b3";
    headers = "181b2agnf4b5s81p2rdnd6wkw9c2ri4cv1x0wwf7rj60axvzvydm";
  };

  electron_15-bin = mkElectron "15.5.2" {
    armv7l-linux = "da434095fd7cc17d85ebca5eab3510ec7ff73ace4edc933fe2f27a716ca711c0";
    aarch64-linux = "bcec3f962c7acefc8690680a19df9d83721db7e5db55c7b7a8946365139457a6";
    x86_64-linux = "a4a95888c313dbe279f5f9d9dfd99f56a2a1b6b905fb6cba3b284322fe19a530";
    i686-linux = "0fd1dd9027bfdbc573fd39e163b6b3f8c07e8ac1586a554e65e7324e7fa7ea35";
    x86_64-darwin = "688cc1d501d32afa5efe1883be42446b61f404d4a5e84bd9815254b5437c869b";
    aarch64-darwin = "b43237d7612ada2f2dccaf6e13fa70ba938dc48f1e2f895558949dd372171db7";
    headers = "0jbxazkjkm8g8b8d0ini2l4q9z7885mz5vyj74lf85lqdfqzgzc0";
  };

  electron_16-bin = mkElectron "16.2.3" {
    armv7l-linux = "9b442b17349dcec08e6efadecf9d338a7f4b2955635fed2a78374af850ceee5d";
    aarch64-linux = "eec581d162b494a7bcba4b0221f3beac9f359b48fb8612c83ce6ad7ac63094cd";
    x86_64-linux = "2c032baff08b40f106dfcd86e7b63c6275f13e64d26b8c301af704563edf8600";
    i686-linux = "227e9f5670a2d92a814eeda41c7ef4efd8fc6150bee659e0f322a8d2481ecdec";
    x86_64-darwin = "3a51ad480d4085a822b0526018805e64fe82f93b954abe500eaebb3c81c80d45";
    aarch64-darwin = "38c736c336abf8747040f22542d6a0bd785b5a10f6ba01d71335cc5f77a3d0b5";
    headers = "1a9kb89iigwmahjwq14i74rr6gj21gmpc106pg0il73c50khaxpz";
  };

  electron_17-bin = mkElectron "17.4.1" {
    armv7l-linux = "d1329468cb21039fb5b503fc813381f9be4d43422383b44f859b450be0e4200c";
    aarch64-linux = "70d29bca5f884753341a11b0445ccf159c0f43dfae16eb60c53946582c3128b0";
    x86_64-linux = "f9437a86947c418d92eabea14b268dcc4a5dde74cc6927530c1e9195e4aeddf8";
    i686-linux = "436f44d778acc41a4a07cc4ee23ab861e2c4d72e4b1335e3c4ccfd4855deb594";
    x86_64-darwin = "0357bcf841bc246d01df8b838fa5de9856bd48f4fa6b2b4f3053ba3db492e54b";
    aarch64-darwin = "827f6ecb7bc4d4ed88eb22e1b02615465ad13ace918d294c873a67a34c207dcf";
    headers = "064qnwv6gqn502r1cv7vi6ahvgyxcqq7mv0rmk2bxfpkr5x6hgmh";
  };

  electron_18-bin = mkElectron "18.1.0" {
    armv7l-linux = "c2296f3f68938aab4cef07b747d2dd28973625b6717163b9c51fbcf1509fd8ff";
    aarch64-linux = "13bd4998d0d86ccf4cb87d11f9581d5a6063b4585fc4828e130054527dfb9179";
    x86_64-linux = "7f95069d58e6843e6ae2b8f02619d4dcef7db4c35bd6e90b903268d83b939fba";
    i686-linux = "e952d06b3828695636de522e3af8140543ecbe02d7351dd002b0ffb9e2a09705";
    x86_64-darwin = "24dd64a66b820c9553c5e5570907da6c98e808d33fac98072b9c2a8f1659cb14";
    aarch64-darwin = "97adf13306c9b3b304d3e9ddf68f5f7fb9b79c9a1342114e3671182f3cc9e808";
    headers = "0gl30q2igr9c8sjlhyj5w57dm5navpkas5hnz9yl7sasbx66v10v";
  };

  electron_19-bin = mkElectron "19.0.7" {
    armv7l-linux = "d6a6d2d7c0d658695783137d032a50f20843cdfe6582ef985451d741eef4dd32";
    aarch64-linux = "58685d21bb92c2667d20063ab12aabc2e5c2518f3eda84e98a0fa2306456ce57";
    x86_64-linux = "a4c20a068c54c238ae8c440ab8f46d39eda4168d6aa8cffcaae406800b539983";
    x86_64-darwin = "2709dd94e22ecfc8e7de0c7a7009160ed79e95ba91618c7307e24c26a33e978b";
    aarch64-darwin = "f9042bce83fe8446e22f6885285dd5fc2dca048d0b89cbf7f326a46102ffc440";
    headers = "09dbx4qh0rgp5mdm6srz6fgx12zq6b9jqq1k6l3gzyvwigi3wny1";
  };

  electron_20-bin = mkElectron "20.3.11" {
    armv7l-linux = "709b9eb958e9488f6375811041179556b9cd0b8fc1eab6b899ef4a89423f98b2";
    aarch64-linux = "0f488ac9eeda2baa4c4e571fd75ac8e055dac9dcdf83051164232b1005a29224";
    x86_64-linux = "7899bf391ae35e10d78a5da622e506dd4ae859cd8c18953cd2dc54f1a5e5225e";
    x86_64-darwin = "751204887aa553c2a7811d3cb04d71e85359ccce2cf21d38e43eda24575ef4db";
    aarch64-darwin = "8ea1a446b41413b97d83d2955a4800c5f7c9061662f78c3e8d96827741f8e211";
    headers = "06s4z2hs9sbri4jsjrgybq0sn7rrx7zf3iwfg8da1wb6ahwqcd7w";
  };

  electron_21-bin = mkElectron "21.4.0" {
    armv7l-linux = "20ed4fab8b2046e10c999592ea06cd6ef13bc5826bcd7e8874c6e5e3b3cdb5b7";
    aarch64-linux = "5841060f67c23371f2739e043b51f56d04125fe781cc50e298590247477eacf2";
    x86_64-linux = "1c0da48b2b9d1fb320577429298397d67d94fbf5864d6a4f3c6eeadee3114f2e";
    x86_64-darwin = "3eea42022d21b6bb0416da8da787740b908febd2552e74cbac63bf403df0745a";
    aarch64-darwin = "aee691fd7da0343e09c4574d09e0d9962d2d1071f845ae57acf1fd9c76adbd3c";
    headers = "0zvwd3gz5y3yq5jgkswnarv75j05lfaz58w37fidq5aib1hi50hn";
  };

  electron_22-bin = mkElectron "22.3.18" {
    armv7l-linux = "109cd957e64c728bd1b921385250d413c9546c7ba44d191a9e6a62ea39eb093b";
    aarch64-linux = "4857d182cffb853b0c85c96e4e99d20316f95068398b7ac5424641e1f2263465";
    x86_64-linux = "8b65f6c6b960dd6bc52acbb0fc54f232dfa8a9d6ed0e1504ee6baf346c90598b";
    x86_64-darwin = "d3ecd733a174b8fd16927285f9e9f3a5d401c29578619a6c12aec5c3845d0d51";
    aarch64-darwin = "a11c41f2b1e740e77fccc1e2e299e89f370cd8153420976c1b16628733969af4";
    headers = "0h1d2l8wq10myaxa5xjnrnyjrjm7qlj9r4g3nldcqmsy4w468v66";
  };

  electron_23-bin = mkElectron "23.3.10" {
    armv7l-linux = "dd5e4395b3851c5561058980c883c1cb5871caae521efbd53a356de7e8e58a81";
    aarch64-linux = "be0e65b0920f7d6c2d6efbcf1a5bcfde3e677e28a9f743d003b5089b48fdbe7f";
    x86_64-linux = "b8f1a743ae5e9e3cc42b00c77eb91343e289a4d2d77d922cc719963ac4629475";
    x86_64-darwin = "6a8cb24879677d7997d1cba018e9630dc561d6646d79c7f282a747c85b17df7e";
    aarch64-darwin = "f2157e56f2e94c5a6bb8a5727674fb7e3f42c6ab155f9fdc00e7dacc7df20df7";
    headers = "04118gdcbnrw5np6r74ysqwfcn1kr5xvjm25jndmnzz8cspch6zq";
  };

  electron_24-bin = mkElectron "24.6.4" {
    armv7l-linux = "60a5d3936d86d78b166f0f62fc5de5de6f3250d2ae630886da297e30d2040eb4";
    aarch64-linux = "d50662a111e72c71596f614cd022ebe928dc2eea6d5060cb8313b19862abe080";
    x86_64-linux = "c211f38a7e5e46371a358f1db67b927fe340f8478a5fff306c4acc0ffce840f8";
    x86_64-darwin = "17293a5148c511cd92a6b08872801bd90de01888251a7b99085818511770fc47";
    aarch64-darwin = "61696d191710e053a1afccb4cd5ee851ad723c90929f0058b8221d1c840a316a";
    headers = "0nwwrxsrlx6spi1nwnvi6fy451sk38zxvnwkls4c4i9f6nrfsd4f";
  };

  electron_25-bin = mkElectron "25.2.0" {
    armv7l-linux = "ec15f85ef5bf1a8cafdd5bbe5ceb229a1c6b2f91e42bd7482500921114413341";
    aarch64-linux = "e58ff2c4484e80bc6253969036e772bfed8d822d66215ff68e84846cbd14c4a0";
    x86_64-linux = "4fb341f1cbe7ef38c1eb3463919bfb515b54875f835f28ce0d8ff9119802a025";
    x86_64-darwin = "21f69f236d89dc86ca63f24fa6b7a7ef825862250ad83d6f09973615b10360b6";
    aarch64-darwin = "50060b0cf8cd2e8180a1bea2c94bc9988ee66cfe065abe2b42cb999707b1b3ba";
    headers = "0fwxypcj8wav16r0fhfm8sdly94vsl8w8yg5xy892z6b3bd9x4s3";
  };
}
