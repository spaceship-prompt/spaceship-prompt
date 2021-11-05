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
