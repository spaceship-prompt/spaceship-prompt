## [4.3.2](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.3.1...v4.3.2) (2022-09-20)


### Bug Fixes

* mark spaceship libs as global ([e0a0926](https://github.com/spaceship-prompt/spaceship-prompt/commit/e0a09267dc61119738da42862f0828f869e248f5))

## [4.3.1](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.3.0...v4.3.1) (2022-09-19)


### Bug Fixes

* Delete the redundant space for kubectl symbol (iTerm2) ([#1205](https://github.com/spaceship-prompt/spaceship-prompt/issues/1205)) ([8ddbc81](https://github.com/spaceship-prompt/spaceship-prompt/commit/8ddbc8115c714ee82c49101690f5effd45f3a01a))

# [4.3.0](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.2.6...v4.3.0) (2022-09-16)


### Features

* fix package section file path ([71f527b](https://github.com/spaceship-prompt/spaceship-prompt/commit/71f527b68c5464f1283dd878d6481358d67c9741))

## [4.2.6](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.2.5...v4.2.6) (2022-09-08)


### Bug Fixes

* **documentation:** use home variable instead of tilde ([#1189](https://github.com/spaceship-prompt/spaceship-prompt/issues/1189)) ([01e153e](https://github.com/spaceship-prompt/spaceship-prompt/commit/01e153efa56bc7c599fa1711d0291397411a002a))

## [4.2.5](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.2.4...v4.2.5) (2022-09-05)


### Bug Fixes

* **npm:** Include async into npm package ([e9ff5af](https://github.com/spaceship-prompt/spaceship-prompt/commit/e9ff5af40f7ef4e813677a4d8ce83e3647bde159))

## [4.2.4](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.2.3...v4.2.4) (2022-09-05)


### Bug Fixes

* **config:** fix wrong path for spaceship config ([cf4b55e](https://github.com/spaceship-prompt/spaceship-prompt/commit/cf4b55e34f2140f83983cc112a175f03cb0e2507)), closes [#1184](https://github.com/spaceship-prompt/spaceship-prompt/issues/1184)

## [4.2.3](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.2.2...v4.2.3) (2022-09-05)


### Bug Fixes

* exec_time doc regarding time threshold trigger ([#1183](https://github.com/spaceship-prompt/spaceship-prompt/issues/1183)) ([ffd027b](https://github.com/spaceship-prompt/spaceship-prompt/commit/ffd027b1e6a697c532b40ff8da1b429a371f306a))

## [4.2.2](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.2.1...v4.2.2) (2022-09-05)


### Bug Fixes

* **julia:** Better detection for Julia projects ([b91ae3d](https://github.com/spaceship-prompt/spaceship-prompt/commit/b91ae3d0e5006260445c8a62706a3d79f453660d)), closes [#678](https://github.com/spaceship-prompt/spaceship-prompt/issues/678)

## [4.2.1](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.2.0...v4.2.1) (2022-09-05)


### Bug Fixes

* change the declaration of readonly variable to typeset ([f80bc28](https://github.com/spaceship-prompt/spaceship-prompt/commit/f80bc2813977f183d8c39ac1694bc1675d808589)), closes [#1175](https://github.com/spaceship-prompt/spaceship-prompt/issues/1175)

# [4.2.0](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.1.0...v4.2.0) (2022-09-02)


### Features

* Add ruby interpreter in datafile util ([005f9fa](https://github.com/spaceship-prompt/spaceship-prompt/commit/005f9fa6191dc94d29cb6db3bd860b6b05b59ef9))

# [4.1.0](https://github.com/spaceship-prompt/spaceship-prompt/compare/v4.0.0...v4.1.0) (2022-09-02)


### Features

* **bun:** Add Bun section ([83ce0ee](https://github.com/spaceship-prompt/spaceship-prompt/commit/83ce0ee893757aee1c41b11c5433849a4c9de61d))

# [4.0.0](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.16.7...v4.0.0) (2022-09-01)


### Bug Fixes

* add permissions to scripts ([7c3e427](https://github.com/spaceship-prompt/spaceship-prompt/commit/7c3e42727531ff612588722c509da643566f57fd))
* add x permissions to files ([9a34149](https://github.com/spaceship-prompt/spaceship-prompt/commit/9a341498bb6d31bf6d179121adbe781972fcde26))
* **async:** remove obsolete runtime variables ([2128ab0](https://github.com/spaceship-prompt/spaceship-prompt/commit/2128ab0046080d633c29a69f86322ca4ca9bed90))
* cherry pick [#1089](https://github.com/spaceship-prompt/spaceship-prompt/issues/1089) ([52448c1](https://github.com/spaceship-prompt/spaceship-prompt/commit/52448c121f7d3602e2e046ae674b70c5a8bbdafa))
* **cli:** Add missing commands in help message ([c2eb3e3](https://github.com/spaceship-prompt/spaceship-prompt/commit/c2eb3e35e8088c014cc0ed04aaab8133afaa3dd6))
* compdef only when compdef is available ([c309af6](https://github.com/spaceship-prompt/spaceship-prompt/commit/c309af62cbb8411583228a179ccb37d8329d2af6))
* **docker:** add additional utils inside docker image ([8813eb0](https://github.com/spaceship-prompt/spaceship-prompt/commit/8813eb0b691d1ccab1042c93edffc1c43764a0b5))
* fix command-line completion leving one letter on the beginning of prompt ([6a4abd5](https://github.com/spaceship-prompt/spaceship-prompt/commit/6a4abd5c3489ef3a1f1387673bafdb2ab0298887)), closes [#1064](https://github.com/spaceship-prompt/spaceship-prompt/issues/1064)
* **git:** Add explicit variable for async rendering ([cfa95e6](https://github.com/spaceship-prompt/spaceship-prompt/commit/cfa95e6c80ee9d5d9dfa486daf892c1021278140))
* **git:** fix ahead/behind indicators ([a067c4d](https://github.com/spaceship-prompt/spaceship-prompt/commit/a067c4df0b663410f7e617e9a2240393f9219095))
* **git:** Fix typo in a section signature ([f8ed612](https://github.com/spaceship-prompt/spaceship-prompt/commit/f8ed612d8b5328d934a86c5664a745e9fbc0628d))
* **hg:** Add options for async rendering ([d5bdfa4](https://github.com/spaceship-prompt/spaceship-prompt/commit/d5bdfa42dc969fe9098792a305b34352d1ba4048))
* **kubectl:** fix kubectl section ([1b71e09](https://github.com/spaceship-prompt/spaceship-prompt/commit/1b71e096dd68be80672173686ea1974d8095ea45))
* make core variables readonly ([1cd4756](https://github.com/spaceship-prompt/spaceship-prompt/commit/1cd4756caf2080f8a13bd5aab15d927660f3d836))
* NEWLINE variable doesn't work ([28b37f5](https://github.com/spaceship-prompt/spaceship-prompt/commit/28b37f566ebc141c93395d003601e1447f6bf91f))
* **ps2:** print PS2 properly ([0d9766c](https://github.com/spaceship-prompt/spaceship-prompt/commit/0d9766c8b65707cb3e7eef19f78bb080cdda3e1b))
* put user config loading in a proper place ([5c68702](https://github.com/spaceship-prompt/spaceship-prompt/commit/5c68702d6e695b517ca89593777651d665c8719e))
* **python:** use python3 command ([0466bb8](https://github.com/spaceship-prompt/spaceship-prompt/commit/0466bb8a9c443e930d9ba11318b5fe6b0f8a6cca))
* **renderer:** fix missing options for globes ([107429c](https://github.com/spaceship-prompt/spaceship-prompt/commit/107429ce5ea936d25fc8cbf813fcf256be75c683))
* rendering docker context ([b6a49f8](https://github.com/spaceship-prompt/spaceship-prompt/commit/b6a49f8e00f28f265c13340183d102a1bbe5252f))
* Resolve newline issue with command expansion ([bcfce70](https://github.com/spaceship-prompt/spaceship-prompt/commit/bcfce70c8552d4b8e378e7b542754da4115ce7b8))
* **scripts:** Stop on errors ([ccee8e9](https://github.com/spaceship-prompt/spaceship-prompt/commit/ccee8e994d5bd1ddda8c3ed89e9d6767792a7b67))
* set proper message if no account ([#1099](https://github.com/spaceship-prompt/spaceship-prompt/issues/1099)) ([69f906c](https://github.com/spaceship-prompt/spaceship-prompt/commit/69f906caa21af14b7ae199f2252629331485b8cd))
* support CLOUDSDK_CONFIG env ([#1122](https://github.com/spaceship-prompt/spaceship-prompt/issues/1122)) ([ae348f9](https://github.com/spaceship-prompt/spaceship-prompt/commit/ae348f9a3df50b13134f1dc7f5eaa574f215cf74)), closes [#1117](https://github.com/spaceship-prompt/spaceship-prompt/issues/1117)
* **tests:** render prefixes and suffixes only when they are not empty ([73c2c71](https://github.com/spaceship-prompt/spaceship-prompt/commit/73c2c7135edfeadb92b285c7db70af63566f7852))
* **upsearch:** Check repo properly ([4764ed9](https://github.com/spaceship-prompt/spaceship-prompt/commit/4764ed921d2b6a78c2ea72641ba91ed072e7b3b5))


### Code Refactoring

* **ember:** remove ember from built-in sections ([05beb8b](https://github.com/spaceship-prompt/spaceship-prompt/commit/05beb8b56f6203d215c50c0b26ff27174b9104ab))
* **gradle:** migrate Gradle to a separate repo ([984bc01](https://github.com/spaceship-prompt/spaceship-prompt/commit/984bc01c073c399dfb7484c5ecdff672062a213f))
* **install:** simplify the installation process ([824f876](https://github.com/spaceship-prompt/spaceship-prompt/commit/824f87657309b1f2579173252667a3cfb88c881e))
* **maven:** migrate Maven to a separate repo ([3efd48b](https://github.com/spaceship-prompt/spaceship-prompt/commit/3efd48b55029ae2c68bbf4e3a43fb922c8b3e942))
* **vi_mode:** move vi_mode to external section ([9ce611b](https://github.com/spaceship-prompt/spaceship-prompt/commit/9ce611b10ba3766f149abe8a1c1d27f488845b6e)), closes [#586](https://github.com/spaceship-prompt/spaceship-prompt/issues/586)


### Features

* add ability to forcefully render a section synchronously ([216f0f2](https://github.com/spaceship-prompt/spaceship-prompt/commit/216f0f2c710191b1f3436c744c52b7de21129b4b))
* add IBM Cloud CLI section ([#912](https://github.com/spaceship-prompt/spaceship-prompt/issues/912)) ([30b4b60](https://github.com/spaceship-prompt/spaceship-prompt/commit/30b4b60176e727cbf7b1fc7d1bccadcd61139c0b))
* Add is_async util ([d539ee5](https://github.com/spaceship-prompt/spaceship-prompt/commit/d539ee5d61714addb80ba2d531a36d1029cc3d18))
* Add java section ([713f406](https://github.com/spaceship-prompt/spaceship-prompt/commit/713f406a3f1bdbeda50bf6924dbf957230361595))
* **async:** add an option to globaly disable/enable async rendering ([0ca1463](https://github.com/spaceship-prompt/spaceship-prompt/commit/0ca1463b1891edfcad0d25897a0c733dfdd19d73))
* **async:** introduce async jobs indicator ([f0a75ce](https://github.com/spaceship-prompt/spaceship-prompt/commit/f0a75cece5361963b4c9a39fbd9151093ec3502d))
* **cli:** add a print command for CLI ([6843105](https://github.com/spaceship-prompt/spaceship-prompt/commit/6843105f2a061629cc912d255f6e9ace98cc485b))
* **cli:** add CLI ([205cb16](https://github.com/spaceship-prompt/spaceship-prompt/commit/205cb16eef6783d6e37af47d2492861d5c5aba7a))
* **cli:** add command completions for cli ([2ae45a4](https://github.com/spaceship-prompt/spaceship-prompt/commit/2ae45a4ec0c4231b69c2090d3a7ed2211051945a))
* **cli:** Add edit command ([b029587](https://github.com/spaceship-prompt/spaceship-prompt/commit/b029587ed9473ba9b8efc19ddaf8135636ae2d08))
* **cli:** CLI for inserting and removing sections ([5dcce40](https://github.com/spaceship-prompt/spaceship-prompt/commit/5dcce40e99e0595453133862b95720882ab07fe7)), closes [#318](https://github.com/spaceship-prompt/spaceship-prompt/issues/318)
* **config:** Add ability to store config in ~/.config/spaceship ([b5dee37](https://github.com/spaceship-prompt/spaceship-prompt/commit/b5dee377c85b54e4f70071de42bc1cff52816f82))
* **config:** introduce config file resolution ([e087459](https://github.com/spaceship-prompt/spaceship-prompt/commit/e087459d316aa445506cf41b3d58be4b0b4b854a)), closes [#508](https://github.com/spaceship-prompt/spaceship-prompt/issues/508)
* **docker:** add docker image and publishing it to ghcr.io ([77d7457](https://github.com/spaceship-prompt/spaceship-prompt/commit/77d74570b7a68c934bb4e5c5ac1a7b36e9fd96cb))
* **exec_time:** display exec time with precision ([7b04aed](https://github.com/spaceship-prompt/spaceship-prompt/commit/7b04aed499175e22ec37b9af55fb3375d5fd48b1))
* **git:** add ability to customize git and hg orders ([8a54cb3](https://github.com/spaceship-prompt/spaceship-prompt/commit/8a54cb39036b173be143b134f1ce00760813fe2d)), closes [#391](https://github.com/spaceship-prompt/spaceship-prompt/issues/391)
* **haskell:** Look for .hs files ([b2eb8a3](https://github.com/spaceship-prompt/spaceship-prompt/commit/b2eb8a35f3c41b73a7d48787a3f4f413c390407f))
* **ibmcloud:** Enable async rendering for ibmcloud ([8391054](https://github.com/spaceship-prompt/spaceship-prompt/commit/8391054c79bacd68c87032ae9011f9c8deb424c6))
* **package:** Add composer and julia support ([3f8bb1e](https://github.com/spaceship-prompt/spaceship-prompt/commit/3f8bb1e5a41ad33f55f5c078ed893a4ef7cee214))
* **perf:** Compile to zwc ([3549bbf](https://github.com/spaceship-prompt/spaceship-prompt/commit/3549bbf9050670b70f79b61c6c90755022448b7e))
* **registry:** Add custom sections registry ([86d64dd](https://github.com/spaceship-prompt/spaceship-prompt/commit/86d64ddbba4c42092a6fcb98dc06822726531a49))
* **renderer:** render sync section on every render ([4e93ae0](https://github.com/spaceship-prompt/spaceship-prompt/commit/4e93ae0ccbb7cd692995b5e78942e783bb25aa71))
* **section:** migrate default section to v4 ([0684171](https://github.com/spaceship-prompt/spaceship-prompt/commit/0684171c41783c278cfaa84fbc844a18a1b4a7ed))
* **section:** Migrate sections to new signature ([b3249fb](https://github.com/spaceship-prompt/spaceship-prompt/commit/b3249fb756a31dec21f1c11beca1a37bf961332d))
* **section:** Named arguments for section ([201496b](https://github.com/spaceship-prompt/spaceship-prompt/commit/201496b4311852e070b315b473dcfbe1d9a792cc))
* **testkit:** add a simple testkit ([1ceca85](https://github.com/spaceship-prompt/spaceship-prompt/commit/1ceca858ddfe8888418e7096e3f863df5d611d6e))
* Upsearch for project files up the tree ([08f6d70](https://github.com/spaceship-prompt/spaceship-prompt/commit/08f6d70e972fc56fa47dccb42f1e44b0bdce352b))
* **vsc:** Make git and hg async ([9ddb9be](https://github.com/spaceship-prompt/spaceship-prompt/commit/9ddb9be29df8058e06b43a4a7504b4faa87cd677))


### Performance Improvements

* **zwc:** Precompile root file and async ([ee5afc5](https://github.com/spaceship-prompt/spaceship-prompt/commit/ee5afc5caf87b22bf3467679f8a6849c04956b03))
* **zwc:** spaceship::precompile compiles sources to zwc ([58758e7](https://github.com/spaceship-prompt/spaceship-prompt/commit/58758e785d948ba3d5a1718dc5cc11321339ab81))


### BREAKING CHANGES

* **section:** spaceship::section:v4 uses flags instead of arguments order to pass section params.
* **vi_mode:** vi_mode section is not include in core anymore
* **gradle:** Gradle section is not included by default. It can be installed additionally from:
https://github.com/spaceship-prompt/spaceship-gradle
* **maven:** Maven section is no longer available by default. It can be additionally installed
from: https://github.com/spaceship-prompt/spaceship-maven
* **install:** Now users have to manually enable prompt system and choose spaceship
* **ember:** ember section is no longer available out of the box. It needs to be installed
additionally.

## [3.16.7](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.16.6...v3.16.7) (2022-05-10)


### Bug Fixes

* revert problem with publishing to brew ([d76cc7b](https://github.com/spaceship-prompt/spaceship-prompt/commit/d76cc7ba804471c78dfc1d471f688019a65934a6))

## [3.16.6](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.16.5...v3.16.6) (2022-05-09)


### Bug Fixes

* **brew:** Attempt to bump homebrew formula with main release ([5f476b1](https://github.com/spaceship-prompt/spaceship-prompt/commit/5f476b1d2942c778a9ca4d7609f4db2526c9430d))

## [3.16.5](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.16.4...v3.16.5) (2022-03-28)


### Bug Fixes

* support CLOUDSDK_CONFIG env ([#1122](https://github.com/spaceship-prompt/spaceship-prompt/issues/1122)) ([6358eaf](https://github.com/spaceship-prompt/spaceship-prompt/commit/6358eaff0a2ad954445c169335d89ef00602aee1)), closes [#1117](https://github.com/spaceship-prompt/spaceship-prompt/issues/1117)

## [3.16.4](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.16.3...v3.16.4) (2022-02-24)


### Bug Fixes

* **readme:** Add notice about Ukraine ([93f328f](https://github.com/spaceship-prompt/spaceship-prompt/commit/93f328ffc049ac0c847d697b0792487b616f4496))

## [3.16.3](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.16.2...v3.16.3) (2022-02-16)


### Bug Fixes

* set proper message if no account ([#1099](https://github.com/spaceship-prompt/spaceship-prompt/issues/1099)) ([15d2279](https://github.com/spaceship-prompt/spaceship-prompt/commit/15d227994e003a9a3ddd30596f8a675acc212f29))

## [3.16.2](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.16.1...v3.16.2) (2022-01-15)


### Bug Fixes

* don't show docker section when using colima ([#1101](https://github.com/spaceship-prompt/spaceship-prompt/issues/1101)) ([9b6e88b](https://github.com/spaceship-prompt/spaceship-prompt/commit/9b6e88b0d2c1d76961c59c1f5476830a2ce44293))

## [3.16.1](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.16.0...v3.16.1) (2021-11-05)


### Bug Fixes

* fix aws section bug ([#1089](https://github.com/spaceship-prompt/spaceship-prompt/issues/1089)) ([642f645](https://github.com/spaceship-prompt/spaceship-prompt/commit/642f645d5f3d73504bd4c3045077c0354315c113))

# [3.16.0](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.15.0...v3.16.0) (2021-10-25)


### Features

* **aws:** Add support to aws-vault ([#1078](https://github.com/spaceship-prompt/spaceship-prompt/issues/1078)) ([ca8e8f0](https://github.com/spaceship-prompt/spaceship-prompt/commit/ca8e8f0a7da7b84c0cdeca98aa8351a6cc1f48d2))

# [3.15.0](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.14.1...v3.15.0) (2021-10-11)


### Features

* add IBM Cloud CLI section ([#912](https://github.com/spaceship-prompt/spaceship-prompt/issues/912)) ([6433544](https://github.com/spaceship-prompt/spaceship-prompt/commit/64335447e0b2f250ca6d145a3343a3613853c00a))

## [3.14.1](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.14.0...v3.14.1) (2021-08-30)


### Bug Fixes

* **docs:** fix discord announcement color ([91af763](https://github.com/spaceship-prompt/spaceship-prompt/commit/91af7638aadb94bb3f2ff8d924d47c4001d07709))

# [3.14.0](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.13.4...v3.14.0) (2021-07-28)


### Features

* **node:** Added support for fnm ([#1058](https://github.com/spaceship-prompt/spaceship-prompt/issues/1058)) ([b92b7d2](https://github.com/spaceship-prompt/spaceship-prompt/commit/b92b7d2ecb8ded6b1a0ff72617f0106bbe8dcc69))

## [3.13.4](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.13.3...v3.13.4) (2021-07-28)


### Bug Fixes

* Prevent unintended output when `dotnet --version` fails ([#1054](https://github.com/spaceship-prompt/spaceship-prompt/issues/1054)) ([d18449a](https://github.com/spaceship-prompt/spaceship-prompt/commit/d18449a93600b20c2b318beafcabb584b4d3c3d5))

## [3.13.3](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.13.2...v3.13.3) (2021-07-21)


### Bug Fixes

* fix maven 3.5.0 bug ([#1053](https://github.com/spaceship-prompt/spaceship-prompt/issues/1053)) ([c24ff52](https://github.com/spaceship-prompt/spaceship-prompt/commit/c24ff52e7a1256900fce9ca6750fdaa9c1958129))

## [3.13.2](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.13.1...v3.13.2) (2021-07-12)


### Bug Fixes

* get GCLOUD_ACTIVE_CONFIG from ENVIRONMENT, if set ([#1046](https://github.com/spaceship-prompt/spaceship-prompt/issues/1046)) ([349240e](https://github.com/spaceship-prompt/spaceship-prompt/commit/349240e01506672380a3c5c5a04343348329dd5b))

## [3.13.1](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.13.0...v3.13.1) (2021-07-12)


### Bug Fixes

* docker section bug and optimize package section ([#1045](https://github.com/spaceship-prompt/spaceship-prompt/issues/1045)) ([b459a1a](https://github.com/spaceship-prompt/spaceship-prompt/commit/b459a1aabd71f93bf3c3adc1b8a3527ab9da5647))

# [3.13.0](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.12.26...v3.13.0) (2021-07-09)


### Features

* **package:** add support for package version from lerna.json instead of package.json ([f09b9da](https://github.com/spaceship-prompt/spaceship-prompt/commit/f09b9da70cd6e9f072e68ed02921ee59b515bcbf))

## [3.12.26](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.12.25...v3.12.26) (2021-07-08)


### Bug Fixes

* **php:** Unalias grep for PHP version ([#1030](https://github.com/spaceship-prompt/spaceship-prompt/issues/1030)) ([354ae0f](https://github.com/spaceship-prompt/spaceship-prompt/commit/354ae0f13192f1da66ad0e21c917ae8859a7e926)), closes [#857](https://github.com/spaceship-prompt/spaceship-prompt/issues/857)

## [3.12.8-3.12.25](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.12.8...v3.12.25) (2021-07-01)


### Bug Fixes

* **ci:** Attempt to fix release for Homebrew ([a1af3f6](https://github.com/spaceship-prompt/spaceship-prompt/commit/a1af3f60c96a07927fad49ad66d4fd1fe5f73bca))
* **ci:** Move Homebrew formula to a separate job ([741bc3e](https://github.com/spaceship-prompt/spaceship-prompt/commit/741bc3e5b1118379c4c5112f2670e56b04dc5773))
* **ci:** Bump Homebrew only if new releaes is published. Pass tag-name. ([4412f68](https://github.com/spaceship-prompt/spaceship-prompt/commit/4412f68dcb838e130b388613528a6ae47dcf3620))
* **ci:** Fix syntax error in workflow file ([9119f46](https://github.com/spaceship-prompt/spaceship-prompt/commit/9119f461f3058424cf3d0cf794b30d115fa40e99))
* **ci:** Move homebrew to a separate file ([554f065](https://github.com/spaceship-prompt/spaceship-prompt/commit/554f06504138c8d6baf1ad9ba92dd0517c1b71d2))
* **ci:** Attempt to fix Homebrew ([7d17060](https://github.com/spaceship-prompt/spaceship-prompt/commit/7d17060dfd4b4ad7e4dd2214492698b0a1f8b959))
* **ci:** Attempt to fix homebrew with tags as array ([278a87d](https://github.com/spaceship-prompt/spaceship-prompt/commit/278a87d8ef5fb4fbd9699d4bbfe9faebd0941781))
* **ci:** wrap tags in quotes ([742a310](https://github.com/spaceship-prompt/spaceship-prompt/commit/742a310ea72781433d0936c6eb77951c65e46c48))
* **ci:** trigger homebrew on every tag push ([3e40ef8](https://github.com/spaceship-prompt/spaceship-prompt/commit/3e40ef83e93ab1696906b310033aed04b5843fc8))
* **ci:** move homebrew back to ci workflow ([1c90270](https://github.com/spaceship-prompt/spaceship-prompt/commit/1c902701b35d475bd8c79cae7aa3de28c24ed21d))
* **ci:** Update download url for Homebrew ([ab95d19](https://github.com/spaceship-prompt/spaceship-prompt/commit/ab95d19809dc96b76267da45f1a9830a484f5a38))
* **ci:** Update download-url for homebrew once again ([838b68e](https://github.com/spaceship-prompt/spaceship-prompt/commit/838b68eaf7ad41546a525323a5846fa2c560613c))
* **ci:** Try dawidd6/action-homebrew-bump-formula ([002b9f7](https://github.com/spaceship-prompt/spaceship-prompt/commit/002b9f70f29ce56423aebff4d7c55452913c4077))
* **ci:** Try using PAT for publishing releases ([89e52f5](https://github.com/spaceship-prompt/spaceship-prompt/commit/89e52f5d463cf0ba15f319ca27e9d8cf2f642115))
* **ci:** Provide tag-name ([5238054](https://github.com/spaceship-prompt/spaceship-prompt/commit/5238054a97f08a6e4bf41998b70f4a4b9a290194))
* **ci:** Homebrew in separate file. Trigger via PAT ([30d4f74](https://github.com/spaceship-prompt/spaceship-prompt/commit/30d4f74019bc6edaf5e739cc31abeffdfb3f703c))
* **ci:** tags trigger as array ([57e46df](https://github.com/spaceship-prompt/spaceship-prompt/commit/57e46df89bfc79816b4086b383960a08f2d94192))
* **ci:** Try using release as a trigger ([af38f82](https://github.com/spaceship-prompt/spaceship-prompt/commit/af38f82b661ca609146acd43ac5dd483405aa13b))
* **ci:** Add a comment and jobs canceling ([dbfaa0c](https://github.com/spaceship-prompt/spaceship-prompt/commit/dbfaa0cca1e74a209c8adb2805505106946c4075))

## [3.12.7](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.12.6...v3.12.7) (2021-06-30)


### Bug Fixes

* **ruby:** Update ruby asdf version finder, asdf was updated to print version second ([#864](https://github.com/spaceship-prompt/spaceship-prompt/issues/864)) ([24a75d8](https://github.com/spaceship-prompt/spaceship-prompt/commit/24a75d8a8a5b461fe47f2abc7523a62806e457e2))

## [3.12.6](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.12.5...v3.12.6) (2021-06-17)


### Bug Fixes

* Revert changes from aaf35d562118e2074d8eaff89c749e1560776e44 ([d35eb19](https://github.com/spaceship-prompt/spaceship-prompt/commit/d35eb1912559dd29ff387376aa62ea27a22c3bd9))

## [3.12.5](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.12.4...v3.12.5) (2021-06-17)


### Bug Fixes

* Do not add a newline before prompt when terminal opens ([#1016](https://github.com/spaceship-prompt/spaceship-prompt/issues/1016)) ([aaf35d5](https://github.com/spaceship-prompt/spaceship-prompt/commit/aaf35d562118e2074d8eaff89c749e1560776e44))

## [3.12.4](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.12.3...v3.12.4) (2021-06-09)


### Bug Fixes

* fix maven section bug ([#960](https://github.com/spaceship-prompt/spaceship-prompt/issues/960)) ([1c8348d](https://github.com/spaceship-prompt/spaceship-prompt/commit/1c8348d87329a746a67d9841d0b372317c09fd09))

## [3.12.3](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.12.2...v3.12.3) (2021-06-07)


### Bug Fixes

* **license:** Fix years in license ([da7984a](https://github.com/spaceship-prompt/spaceship-prompt/commit/da7984aeede599b919c5c551b8b981a12de46312))

## [3.12.2](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.12.1...v3.12.2) (2021-06-07)


### Bug Fixes

* tweak CI ([#958](https://github.com/spaceship-prompt/spaceship-prompt/issues/958)) ([e9055c2](https://github.com/spaceship-prompt/spaceship-prompt/commit/e9055c2de2ffd72f6d4e568ceb00453afb5f0598))

## [3.12.1](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.12.0...v3.12.1) (2021-06-04)


### Bug Fixes

* **ci:** Fix typo in .releaserc.json ([4f19ada](https://github.com/spaceship-prompt/spaceship-prompt/commit/4f19ada63c36a41eb144969a684b04b9aafb80d5))
* **ci:** Specify which files to commit on release ([631df26](https://github.com/spaceship-prompt/spaceship-prompt/commit/631df26c6c0e1348d2a9790477cc8e2a38e91850))

# [3.12.0](https://github.com/spaceship-prompt/spaceship-prompt/compare/v3.11.2...v3.12.0) (2021-06-04)


### Bug Fixes

* **ci:** Fix workflow syntax error ([fcdf5c2](https://github.com/spaceship-prompt/spaceship-prompt/commit/fcdf5c298b50602ed5ebbd54d8d35a09de8e9557))
* **ci:** Remove obsolete Node.js steps ([d74944f](https://github.com/spaceship-prompt/spaceship-prompt/commit/d74944fae7bba847803ea87b2d3b3829454b266f))
* change wrong env variables ([#817](https://github.com/spaceship-prompt/spaceship-prompt/issues/817)) ([1d88d3f](https://github.com/spaceship-prompt/spaceship-prompt/commit/1d88d3f56029364afdcd00f340a15ebf46765080))
* change wrong env variables ([#817](https://github.com/spaceship-prompt/spaceship-prompt/issues/817)) ([56c7e5d](https://github.com/spaceship-prompt/spaceship-prompt/commit/56c7e5d349229e643cf3dd334bd063bb35881c35))
* Fix acpi output bug ([75dd4ff](https://github.com/spaceship-prompt/spaceship-prompt/commit/75dd4ffd63d2e524839869d45b0f29246e2117b2))
* Fix battery section bug because match function is supported at gawk ([#780](https://github.com/spaceship-prompt/spaceship-prompt/issues/780)) ([1266cd9](https://github.com/spaceship-prompt/spaceship-prompt/commit/1266cd9a9544d336090f65060630be2bf78393a1))
* Hardened the Docker context checking logic ([a853780](https://github.com/spaceship-prompt/spaceship-prompt/commit/a8537807f4edd74756805ce6dfb7d1234e75fdc4))
* Hardened the Docker version checking logic ([e075f08](https://github.com/spaceship-prompt/spaceship-prompt/commit/e075f084c093ba289a6328edeb42660d28355e52))
* reformat ([51e6cf3](https://github.com/spaceship-prompt/spaceship-prompt/commit/51e6cf3d4252c635f6b4c4c4d5a18fadde1da1cc))
* typo ([dc5c4d2](https://github.com/spaceship-prompt/spaceship-prompt/commit/dc5c4d2441d982d2505367d3c9af7d5c6f461ae5))


### Features

* Add Runrioter as a maintainer ([b71f6ae](https://github.com/spaceship-prompt/spaceship-prompt/commit/b71f6ae71da4fe127c272d8824e4bc67786f5846)), closes [#747](https://github.com/spaceship-prompt/spaceship-prompt/issues/747)
* Add semantic release cycle ([#956](https://github.com/spaceship-prompt/spaceship-prompt/issues/956)) ([6220873](https://github.com/spaceship-prompt/spaceship-prompt/commit/622087366a86d0478d6b38b3edb7024c500b9b4f))
