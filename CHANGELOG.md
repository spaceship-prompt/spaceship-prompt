# Changelog

## [Unreleased](https://github.com/denysdovhan/spaceship-prompt/tree/HEAD)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v3.0.2...HEAD)

**Fixed bugs:**

- \(\#q\) glob qualifier doesn't work for zsh 5.0.5 [\#190](https://github.com/denysdovhan/spaceship-prompt/issues/190)

## [v3.0.2](https://github.com/denysdovhan/spaceship-prompt/tree/v3.0.2) (2018-01-18)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v3.0.1...v3.0.2)

## [v3.0.1](https://github.com/denysdovhan/spaceship-prompt/tree/v3.0.1) (2018-01-18)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v3.0.0...v3.0.1)

**Breaking changes:**

- 3.0: Roadmap [\#200](https://github.com/denysdovhan/spaceship-prompt/issues/200)

**Merged pull requests:**

- Promote @maximbaz to collaborators [\#320](https://github.com/denysdovhan/spaceship-prompt/pull/320) ([denysdovhan](https://github.com/denysdovhan))

## [v3.0.0](https://github.com/denysdovhan/spaceship-prompt/tree/v3.0.0) (2018-01-18)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.11.0...v3.0.0)

**Breaking changes:**

- 3.0 [\#148](https://github.com/denysdovhan/spaceship-prompt/pull/148) ([denysdovhan](https://github.com/denysdovhan))

**New features:**

- Make showing battery on 100% configurable [\#306](https://github.com/denysdovhan/spaceship-prompt/pull/306) ([maximbaz](https://github.com/maximbaz))

**Merged pull requests:**

- Make dir section a little faster when SPACESHIP\_DIR\_TRUNC\_REPO == false [\#312](https://github.com/denysdovhan/spaceship-prompt/pull/312) ([maximbaz](https://github.com/maximbaz))
- Add zsh framework to issue template [\#310](https://github.com/denysdovhan/spaceship-prompt/pull/310) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Revert "Show 100% charge by default" [\#308](https://github.com/denysdovhan/spaceship-prompt/pull/308) ([maximbaz](https://github.com/maximbaz))
-  Update options documentation for 3.0  [\#294](https://github.com/denysdovhan/spaceship-prompt/pull/294) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Drop LS\_COLORS variable [\#273](https://github.com/denysdovhan/spaceship-prompt/pull/273) ([maximbaz](https://github.com/maximbaz))

## [v2.11.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.11.0) (2018-01-12)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.10.4...v2.11.0)

**Breaking changes:**

- Allow to invoke custom functions [\#262](https://github.com/denysdovhan/spaceship-prompt/pull/262) ([bric3](https://github.com/bric3))

**New features:**

- Allow not showing username on SSH connection [\#286](https://github.com/denysdovhan/spaceship-prompt/pull/286) ([maximbaz](https://github.com/maximbaz))

**Fixed bugs:**

- Variables don't accept an empty string [\#250](https://github.com/denysdovhan/spaceship-prompt/issues/250)
- SPACESHIP\_BATTERY\_PREFIX never shows up [\#244](https://github.com/denysdovhan/spaceship-prompt/issues/244)
- Antibody Hangs or Closes [\#227](https://github.com/denysdovhan/spaceship-prompt/issues/227)
- Package: scripts.version is shown as package version [\#221](https://github.com/denysdovhan/spaceship-prompt/issues/221)
- Grep expression to extract package version not working as expected [\#209](https://github.com/denysdovhan/spaceship-prompt/issues/209)
- What does the '.%' in the prompt mean? [\#203](https://github.com/denysdovhan/spaceship-prompt/issues/203)
- Installer clobbers symlinked .zshrc files [\#131](https://github.com/denysdovhan/spaceship-prompt/issues/131)
- Return the space to the git symbol [\#304](https://github.com/denysdovhan/spaceship-prompt/pull/304) ([maximbaz](https://github.com/maximbaz))
- Fix RETVAL not being set [\#283](https://github.com/denysdovhan/spaceship-prompt/pull/283) ([maximbaz](https://github.com/maximbaz))
- Fix missing git branch prefix [\#278](https://github.com/denysdovhan/spaceship-prompt/pull/278) ([maximbaz](https://github.com/maximbaz))
- Fix jobs count bug when cwd changes [\#272](https://github.com/denysdovhan/spaceship-prompt/pull/272) ([maximbaz](https://github.com/maximbaz))
- Fix command not found: git\_current\_branch [\#270](https://github.com/denysdovhan/spaceship-prompt/pull/270) ([n2o](https://github.com/n2o))

**Closed issues:**

- Terminal feels pretty different than it should be [\#302](https://github.com/denysdovhan/spaceship-prompt/issues/302)
- How to hide the duplicate information present on the right side? [\#288](https://github.com/denysdovhan/spaceship-prompt/issues/288)
- More detail in exec time [\#241](https://github.com/denysdovhan/spaceship-prompt/issues/241)
- Truncate directories before git directory [\#141](https://github.com/denysdovhan/spaceship-prompt/issues/141)

**Merged pull requests:**

- Fix git\_status showing AHEAD and BEHIND instead of DIVERGED icon [\#299](https://github.com/denysdovhan/spaceship-prompt/pull/299) ([maximbaz](https://github.com/maximbaz))
- Fix missing icon in git status for deleted unstaged file [\#298](https://github.com/denysdovhan/spaceship-prompt/pull/298) ([maximbaz](https://github.com/maximbaz))
- docs: typo in README [\#290](https://github.com/denysdovhan/spaceship-prompt/pull/290) ([ggarek](https://github.com/ggarek))
- Fix minor code comment typo [\#287](https://github.com/denysdovhan/spaceship-prompt/pull/287) ([scriptdaemon](https://github.com/scriptdaemon))
- Fix prompt setup when loaded using zsh prompt function [\#275](https://github.com/denysdovhan/spaceship-prompt/pull/275) ([belak](https://github.com/belak))
- fix bug and improve spaceship\_docker [\#263](https://github.com/denysdovhan/spaceship-prompt/pull/263) ([Runrioter](https://github.com/Runrioter))
- Allow empty string in variables [\#261](https://github.com/denysdovhan/spaceship-prompt/pull/261) ([bric3](https://github.com/bric3))
- Don't display battery info if not available [\#212](https://github.com/denysdovhan/spaceship-prompt/pull/212) ([FredDeschenes](https://github.com/FredDeschenes))

## [v2.10.4](https://github.com/denysdovhan/spaceship-prompt/tree/v2.10.4) (2017-12-18)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.10.3...v2.10.4)

**Fixed bugs:**

- SPACESHIP\_EXIT\_CODE\_SYMBOl \<- the L is lowercase [\#247](https://github.com/denysdovhan/spaceship-prompt/issues/247)
- Capitalize the l in SPACESHIP\_EXIT\_CODE\_SYMBOl [\#248](https://github.com/denysdovhan/spaceship-prompt/pull/248) ([halilim](https://github.com/halilim))

## [v2.10.3](https://github.com/denysdovhan/spaceship-prompt/tree/v2.10.3) (2017-12-18)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.10.2...v2.10.3)

**Fixed bugs:**

- Typo in battery indicator prefix [\#237](https://github.com/denysdovhan/spaceship-prompt/issues/237)
- Error in spaceship\_kubecontext [\#228](https://github.com/denysdovhan/spaceship-prompt/issues/228)
- install.zsh failing due alias substitution sourced from .zshrc [\#205](https://github.com/denysdovhan/spaceship-prompt/issues/205)
- 2.10.0 npm installation issue [\#196](https://github.com/denysdovhan/spaceship-prompt/issues/196)
- Cannot replace ZSH\_THEME from npm install [\#128](https://github.com/denysdovhan/spaceship-prompt/issues/128)
- No git indicator if file is modified and renamed [\#101](https://github.com/denysdovhan/spaceship-prompt/issues/101)
- Add a space after the prompt symbol in the ps2 prompt [\#282](https://github.com/denysdovhan/spaceship-prompt/pull/282) ([segevfiner](https://github.com/segevfiner))

**Closed issues:**

- Problem with completions \(using cd\) [\#255](https://github.com/denysdovhan/spaceship-prompt/issues/255)
- Installing via yarn has strange side-effects [\#252](https://github.com/denysdovhan/spaceship-prompt/issues/252)
- Bad math expression [\#245](https://github.com/denysdovhan/spaceship-prompt/issues/245)
- Organize project tree [\#127](https://github.com/denysdovhan/spaceship-prompt/issues/127)
- Ability to change the colour of the prompt segment symbol [\#98](https://github.com/denysdovhan/spaceship-prompt/issues/98)

## [v2.10.2](https://github.com/denysdovhan/spaceship-prompt/tree/v2.10.2) (2017-10-19)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.10.1...v2.10.2)

**Breaking changes:**

- Added SPACESHIP\_RPROMPT\_ORDER option for RPS1 prompt [\#168](https://github.com/denysdovhan/spaceship-prompt/pull/168) ([ddrexl](https://github.com/ddrexl))

**New features:**

- Add kubectl context [\#197](https://github.com/denysdovhan/spaceship-prompt/pull/197) ([argais](https://github.com/argais))

**Closed issues:**

- Colors are too bright [\#242](https://github.com/denysdovhan/spaceship-prompt/issues/242)
- \[?\] next to git status status [\#234](https://github.com/denysdovhan/spaceship-prompt/issues/234)
- Can't change default prompt prefix. [\#223](https://github.com/denysdovhan/spaceship-prompt/issues/223)

**Merged pull requests:**

- Fixing issue \#228 with kubecontext [\#229](https://github.com/denysdovhan/spaceship-prompt/pull/229) ([dcluna](https://github.com/dcluna))

## [v2.10.1](https://github.com/denysdovhan/spaceship-prompt/tree/v2.10.1) (2017-09-13)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.10.0...v2.10.1)

**Breaking changes:**

- Show git repository folder when inside a git repo [\#169](https://github.com/denysdovhan/spaceship-prompt/pull/169) ([RolfKoenders](https://github.com/RolfKoenders))
- Drop Oh-My-Zsh dependency [\#147](https://github.com/denysdovhan/spaceship-prompt/pull/147) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Expose prompt character color variables [\#115](https://github.com/denysdovhan/spaceship-prompt/pull/115) ([salmanulfarzy](https://github.com/salmanulfarzy))

**Fixed bugs:**

- \[Battery\] Battery Icon won't turn off. [\#198](https://github.com/denysdovhan/spaceship-prompt/issues/198)

**Closed issues:**

- ☁️ Amazon Web Services support [\#86](https://github.com/denysdovhan/spaceship-prompt/issues/86)

**Merged pull requests:**

- Fix typo in sample configuration for `battery` [\#214](https://github.com/denysdovhan/spaceship-prompt/pull/214) ([anton-johansson](https://github.com/anton-johansson))
- Fixed grep regex to extract npm package version [\#210](https://github.com/denysdovhan/spaceship-prompt/pull/210) ([dougmaitelli](https://github.com/dougmaitelli))
- Fix typo in \_BATTERY\_SHOW option [\#201](https://github.com/denysdovhan/spaceship-prompt/pull/201) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Fix path modifier mistake [\#199](https://github.com/denysdovhan/spaceship-prompt/pull/199) ([nfischer](https://github.com/nfischer))
- Fix globbing to exclude directories [\#187](https://github.com/denysdovhan/spaceship-prompt/pull/187) ([alexcormier](https://github.com/alexcormier))

## [v2.10.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.10.0) (2017-08-22)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.9.0...v2.10.0)

**New features:**

- Show active conda virtual environment [\#185](https://github.com/denysdovhan/spaceship-prompt/pull/185) ([salmanulfarzy](https://github.com/salmanulfarzy))

**Fixed bugs:**

- Prompt breaks when package.json contains npm version script [\#171](https://github.com/denysdovhan/spaceship-prompt/issues/171)

**Closed issues:**

- Support for conda virtual environment [\#181](https://github.com/denysdovhan/spaceship-prompt/issues/181)

**Merged pull requests:**

- Docker improvements [\#191](https://github.com/denysdovhan/spaceship-prompt/pull/191) ([sarkkisjuha](https://github.com/sarkkisjuha))
- Fix \#171 - improve package regex, handle version not found [\#177](https://github.com/denysdovhan/spaceship-prompt/pull/177) ([jwhitmarsh](https://github.com/jwhitmarsh))

## [v2.9.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.9.0) (2017-08-21)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.8.0...v2.9.0)

**New features:**

- Battery informations section [\#164](https://github.com/denysdovhan/spaceship-prompt/pull/164) ([salmanulfarzy](https://github.com/salmanulfarzy))

**Fixed bugs:**

- Prompt slow to show when using Spaceship [\#161](https://github.com/denysdovhan/spaceship-prompt/issues/161)

**Closed issues:**

- Optimization potential: use zsh modifier `:t` instead of `basename` [\#173](https://github.com/denysdovhan/spaceship-prompt/issues/173)

**Merged pull requests:**

- Update example doc for exec\_time and package [\#195](https://github.com/denysdovhan/spaceship-prompt/pull/195) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Check $GOPATH without -v [\#194](https://github.com/denysdovhan/spaceship-prompt/pull/194) ([salmanulfarzy](https://github.com/salmanulfarzy))
- feat: replace basename with zsh :t modifier [\#188](https://github.com/denysdovhan/spaceship-prompt/pull/188) ([nfischer](https://github.com/nfischer))
- Show Go version when in Go workspace [\#170](https://github.com/denysdovhan/spaceship-prompt/pull/170) ([nicosullivan](https://github.com/nicosullivan))
- Speed up the prompt when using hg. Fix \#161 [\#163](https://github.com/denysdovhan/spaceship-prompt/pull/163) ([dguay](https://github.com/dguay))
- Fix the installer [\#134](https://github.com/denysdovhan/spaceship-prompt/pull/134) ([asonix](https://github.com/asonix))

## [v2.8.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.8.0) (2017-08-20)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.7.3...v2.8.0)

**New features:**

- AWS-cli support [\#165](https://github.com/denysdovhan/spaceship-prompt/pull/165) ([RolfKoenders](https://github.com/RolfKoenders))

**Fixed bugs:**

- Golang version always displayed [\#175](https://github.com/denysdovhan/spaceship-prompt/issues/175)

**Merged pull requests:**

- Fix typo in pyenv section [\#184](https://github.com/denysdovhan/spaceship-prompt/pull/184) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Add MIT LICENSE file [\#178](https://github.com/denysdovhan/spaceship-prompt/pull/178) ([salmanulfarzy](https://github.com/salmanulfarzy))

## [v2.7.3](https://github.com/denysdovhan/spaceship-prompt/tree/v2.7.3) (2017-07-19)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.7.2...v2.7.3)

**Fixed bugs:**

- \[v2.7.2\] fatal: Not a git repository \(or any of the parent directories\): .git [\#160](https://github.com/denysdovhan/spaceship-prompt/issues/160)
- Incorrect display after upgrade to v2 [\#93](https://github.com/denysdovhan/spaceship-prompt/issues/93)

**Merged pull requests:**

- Replace SPACEHIP references with SPACESHIP [\#172](https://github.com/denysdovhan/spaceship-prompt/pull/172) ([keelerm84](https://github.com/keelerm84))
- Add -f for Gopkg.lock \(fixes \#160\) [\#162](https://github.com/denysdovhan/spaceship-prompt/pull/162) ([ApacheEx](https://github.com/ApacheEx))

## [v2.7.2](https://github.com/denysdovhan/spaceship-prompt/tree/v2.7.2) (2017-06-30)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.7.1...v2.7.2)

**Fixed bugs:**

- Mercurial branch info [\#155](https://github.com/denysdovhan/spaceship-prompt/issues/155)
- Ember version takes too long \(is unusable\) [\#153](https://github.com/denysdovhan/spaceship-prompt/issues/153)

**Merged pull requests:**

- Cleanup hg branch section [\#156](https://github.com/denysdovhan/spaceship-prompt/pull/156) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Fixes Ember version speed \(fixes \#153\) [\#154](https://github.com/denysdovhan/spaceship-prompt/pull/154) ([thebluejay](https://github.com/thebluejay))
- trigger golang on Gopkg.toml or Gopkg.lock [\#152](https://github.com/denysdovhan/spaceship-prompt/pull/152) ([petermbenjamin](https://github.com/petermbenjamin))

## [v2.7.1](https://github.com/denysdovhan/spaceship-prompt/tree/v2.7.1) (2017-06-26)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.7.0...v2.7.1)

## [v2.7.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.7.0) (2017-06-26)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.6.2...v2.7.0)

**New features:**

- Add support for Ember version [\#142](https://github.com/denysdovhan/spaceship-prompt/pull/142) ([thebluejay](https://github.com/thebluejay))

**Fixed bugs:**

- pyenv has multiple entries, which wraps to next line in spaceship [\#103](https://github.com/denysdovhan/spaceship-prompt/issues/103)

**Merged pull requests:**

- Fix pyenv version/virtualenv display [\#150](https://github.com/denysdovhan/spaceship-prompt/pull/150) ([SanketDG](https://github.com/SanketDG))

## [v2.6.2](https://github.com/denysdovhan/spaceship-prompt/tree/v2.6.2) (2017-06-25)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.6.1...v2.6.2)

**Merged pull requests:**

- Removed extra space in default package symbol [\#149](https://github.com/denysdovhan/spaceship-prompt/pull/149) ([nelsonghezzi](https://github.com/nelsonghezzi))

## [v2.6.1](https://github.com/denysdovhan/spaceship-prompt/tree/v2.6.1) (2017-06-24)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.6.0...v2.6.1)

## [v2.6.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.6.0) (2017-06-24)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.5.3...v2.6.0)

**New features:**

- Add dotnet support [\#137](https://github.com/denysdovhan/spaceship-prompt/pull/137) ([nelsonghezzi](https://github.com/nelsonghezzi))
- Add Elixir support [\#133](https://github.com/denysdovhan/spaceship-prompt/pull/133) ([asonix](https://github.com/asonix))
- Add package version [\#123](https://github.com/denysdovhan/spaceship-prompt/pull/123) ([jwhitmarsh](https://github.com/jwhitmarsh))
- Show exit code if non-zero [\#77](https://github.com/denysdovhan/spaceship-prompt/pull/77) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Add background jobs status indicator [\#67](https://github.com/denysdovhan/spaceship-prompt/pull/67) ([bleys](https://github.com/bleys))

**Closed issues:**

- 💧 Elixir support [\#73](https://github.com/denysdovhan/spaceship-prompt/issues/73)
- ✘ Exit code of previous command [\#72](https://github.com/denysdovhan/spaceship-prompt/issues/72)
- ⚙ Indicate if there are background jobs [\#66](https://github.com/denysdovhan/spaceship-prompt/issues/66)

**Merged pull requests:**

- Fix typo [\#140](https://github.com/denysdovhan/spaceship-prompt/pull/140) ([anton-johansson](https://github.com/anton-johansson))
- Show required zsh version in badge and requirements [\#136](https://github.com/denysdovhan/spaceship-prompt/pull/136) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Add spaces in \_displaytime [\#135](https://github.com/denysdovhan/spaceship-prompt/pull/135) ([Arttse](https://github.com/Arttse))

## [v2.5.3](https://github.com/denysdovhan/spaceship-prompt/tree/v2.5.3) (2017-06-05)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.5.2...v2.5.3)

**Fixed bugs:**

- `command not found: add-zsh-hook`  [\#126](https://github.com/denysdovhan/spaceship-prompt/issues/126)
- Mistaken space in assignment  [\#129](https://github.com/denysdovhan/spaceship-prompt/pull/129) ([Grawl](https://github.com/Grawl))

**Closed issues:**

- REPORTTIME support [\#125](https://github.com/denysdovhan/spaceship-prompt/issues/125)
- ☿  Mercurial support [\#54](https://github.com/denysdovhan/spaceship-prompt/issues/54)

## [v2.5.2](https://github.com/denysdovhan/spaceship-prompt/tree/v2.5.2) (2017-06-04)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.5.1...v2.5.2)

## [v2.5.1](https://github.com/denysdovhan/spaceship-prompt/tree/v2.5.1) (2017-06-04)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.5.0...v2.5.1)

**New features:**

- Show execution time of the last command [\#124](https://github.com/denysdovhan/spaceship-prompt/pull/124) ([Arttse](https://github.com/Arttse))
- Add Haskell Stack version. [\#122](https://github.com/denysdovhan/spaceship-prompt/pull/122) ([kulkarnih](https://github.com/kulkarnih))

## [v2.5.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.5.0) (2017-06-04)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.4.2...v2.5.0)

## [v2.4.2](https://github.com/denysdovhan/spaceship-prompt/tree/v2.4.2) (2017-05-29)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.4.1...v2.4.2)

**Closed issues:**

- spaceship fails to run on ubuntu - parse error [\#121](https://github.com/denysdovhan/spaceship-prompt/issues/121)

## [v2.4.1](https://github.com/denysdovhan/spaceship-prompt/tree/v2.4.1) (2017-05-29)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.4.0...v2.4.1)

## [v2.4.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.4.0) (2017-05-29)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.3.1...v2.4.0)

**Merged pull requests:**

- Nodenv node version detection [\#117](https://github.com/denysdovhan/spaceship-prompt/pull/117) ([lautis](https://github.com/lautis))
- Use rbenv version-name to read the current ruby version name [\#116](https://github.com/denysdovhan/spaceship-prompt/pull/116) ([lautis](https://github.com/lautis))

## [v2.3.1](https://github.com/denysdovhan/spaceship-prompt/tree/v2.3.1) (2017-05-23)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.3.0...v2.3.1)

**Merged pull requests:**

- Faster deprecation check [\#114](https://github.com/denysdovhan/spaceship-prompt/pull/114) ([lautis](https://github.com/lautis))

## [v2.3.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.3.0) (2017-05-19)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.2.2...v2.3.0)

**New features:**

- Add Julia vesion [\#111](https://github.com/denysdovhan/spaceship-prompt/pull/111) ([JonathanPetit](https://github.com/JonathanPetit))

**Merged pull requests:**

- Fixed SPACESHIP\_HOST\_SHOW variable and meaning [\#112](https://github.com/denysdovhan/spaceship-prompt/pull/112) ([dylancarruthers](https://github.com/dylancarruthers))

## [v2.2.2](https://github.com/denysdovhan/spaceship-prompt/tree/v2.2.2) (2017-05-17)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.2.1...v2.2.2)

## [v2.2.1](https://github.com/denysdovhan/spaceship-prompt/tree/v2.2.1) (2017-05-17)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.2.0...v2.2.1)

**Fixed bugs:**

- Extra space after git branch [\#110](https://github.com/denysdovhan/spaceship-prompt/issues/110)
- Theme is renamed to spaceship.zsh-theme.zsh [\#105](https://github.com/denysdovhan/spaceship-prompt/issues/105)

**Closed issues:**

- 🐘 PHP support [\#74](https://github.com/denysdovhan/spaceship-prompt/issues/74)

## [v2.2.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.2.0) (2017-05-16)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.1.0...v2.2.0)

**New features:**

- Show php version on folders with php files [\#80](https://github.com/denysdovhan/spaceship-prompt/pull/80) ([salmanulfarzy](https://github.com/salmanulfarzy))

**Fixed bugs:**

- Can't install via npm without sudo [\#104](https://github.com/denysdovhan/spaceship-prompt/issues/104)
- Add real root detection with id command [\#107](https://github.com/denysdovhan/spaceship-prompt/pull/107) ([mikafouenski](https://github.com/mikafouenski))

## [v2.1.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.1.0) (2017-05-13)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.0.1...v2.1.0)

**New features:**

- Add Rust version [\#102](https://github.com/denysdovhan/spaceship-prompt/pull/102) ([charlesvdv](https://github.com/charlesvdv))

**Closed issues:**

- add rust support  [\#100](https://github.com/denysdovhan/spaceship-prompt/issues/100)
- Custom prompt ordering [\#71](https://github.com/denysdovhan/spaceship-prompt/issues/71)

**Merged pull requests:**

- Document Git symbol require powerline patched font [\#99](https://github.com/denysdovhan/spaceship-prompt/pull/99) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Add issue template [\#97](https://github.com/denysdovhan/spaceship-prompt/pull/97) ([salmanulfarzy](https://github.com/salmanulfarzy))

## [v2.0.1](https://github.com/denysdovhan/spaceship-prompt/tree/v2.0.1) (2017-05-07)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/v2.0.0...v2.0.1)

## [v2.0.0](https://github.com/denysdovhan/spaceship-prompt/tree/v2.0.0) (2017-05-07)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/1.0.0...v2.0.0)

**New features:**

- Pyenv support [\#44](https://github.com/denysdovhan/spaceship-prompt/issues/44)
- vi-mode notification. [\#12](https://github.com/denysdovhan/spaceship-prompt/issues/12)
- Add customization [\#7](https://github.com/denysdovhan/spaceship-prompt/issues/7)
- WIP: Breaking changes \(order, colors, suffixes\) [\#78](https://github.com/denysdovhan/spaceship-prompt/pull/78) ([denysdovhan](https://github.com/denysdovhan))
- Make docker info smarter [\#69](https://github.com/denysdovhan/spaceship-prompt/pull/69) ([bleys](https://github.com/bleys))
- add docker version and docker-machine [\#64](https://github.com/denysdovhan/spaceship-prompt/pull/64) ([jgsqware](https://github.com/jgsqware))
- Custom time formatting [\#63](https://github.com/denysdovhan/spaceship-prompt/pull/63) ([rougesheep](https://github.com/rougesheep))
- Show versions in specific folders only [\#59](https://github.com/denysdovhan/spaceship-prompt/pull/59) ([made-aryadinata](https://github.com/made-aryadinata))
- added time prompt [\#51](https://github.com/denysdovhan/spaceship-prompt/pull/51) ([salmanulfarzy](https://github.com/salmanulfarzy))
- Add golang version to prompt. [\#47](https://github.com/denysdovhan/spaceship-prompt/pull/47) ([gillchristian](https://github.com/gillchristian))
- Support for pyenv [\#46](https://github.com/denysdovhan/spaceship-prompt/pull/46) ([tienthanh8490](https://github.com/tienthanh8490))
- Remove default ruby gemset check when using rvm [\#43](https://github.com/denysdovhan/spaceship-prompt/pull/43) ([robbl](https://github.com/robbl))
- Add Swift and Xcode Version component [\#40](https://github.com/denysdovhan/spaceship-prompt/pull/40) ([PoissonBallon](https://github.com/PoissonBallon))
- Added "via" and "on" to prompt variables [\#39](https://github.com/denysdovhan/spaceship-prompt/pull/39) ([mawburn](https://github.com/mawburn))
- work on python virtualenv [\#20](https://github.com/denysdovhan/spaceship-prompt/pull/20) ([arshavindn](https://github.com/arshavindn))
- Allow configuring the truncating of the prompt. [\#11](https://github.com/denysdovhan/spaceship-prompt/pull/11) ([musically-ut](https://github.com/musically-ut))
- Add customization [\#8](https://github.com/denysdovhan/spaceship-prompt/pull/8) ([denysdovhan](https://github.com/denysdovhan))
- Promt: add rubyversion for rvm, rbenv [\#3](https://github.com/denysdovhan/spaceship-prompt/pull/3) ([Zeotyn](https://github.com/Zeotyn))

**Fixed bugs:**

- Hostname displayed out of a SSH session [\#68](https://github.com/denysdovhan/spaceship-prompt/issues/68)
- there is something wrong in function spaceship\_golang\_version [\#55](https://github.com/denysdovhan/spaceship-prompt/issues/55)
- spaceship\_git\_status:\[:20: too many arguments [\#37](https://github.com/denysdovhan/spaceship-prompt/issues/37)
- Error when starting a new session [\#35](https://github.com/denysdovhan/spaceship-prompt/issues/35)
- rvm default output [\#29](https://github.com/denysdovhan/spaceship-prompt/issues/29)
- Do not show `none` when node isn't installed [\#24](https://github.com/denysdovhan/spaceship-prompt/issues/24)
- prompt show double python virtualenv [\#19](https://github.com/denysdovhan/spaceship-prompt/issues/19)
- Documentation issue. [\#13](https://github.com/denysdovhan/spaceship-prompt/issues/13)
- Extra quotes with the symbols. [\#9](https://github.com/denysdovhan/spaceship-prompt/issues/9)
- Host and git\_status not found when just started using theme [\#2](https://github.com/denysdovhan/spaceship-prompt/issues/2)
- ".oh-my-zsh/custom/themes/spaceship.zsh-theme:1: command not found: Not" error when trying to apply theme [\#1](https://github.com/denysdovhan/spaceship-prompt/issues/1)
- Selective prepending for ruby version [\#58](https://github.com/denysdovhan/spaceship-prompt/pull/58) ([gizotti](https://github.com/gizotti))
- use NULL\_GLOB for Go-files detection [\#56](https://github.com/denysdovhan/spaceship-prompt/pull/56) ([shihanng](https://github.com/shihanng))
- fix bug in spaceship\_vi\_mode [\#38](https://github.com/denysdovhan/spaceship-prompt/pull/38) ([gurpreetatwal](https://github.com/gurpreetatwal))
- Fix \#35. Error when starting a new session. [\#36](https://github.com/denysdovhan/spaceship-prompt/pull/36) ([denysdovhan](https://github.com/denysdovhan))
- fix rvm output [\#30](https://github.com/denysdovhan/spaceship-prompt/pull/30) ([tbenett](https://github.com/tbenett))
- Fix for autocompletions breaking git symbols [\#27](https://github.com/denysdovhan/spaceship-prompt/pull/27) ([lbyte](https://github.com/lbyte))
- Add link for spaceship.zsh-theme. [\#22](https://github.com/denysdovhan/spaceship-prompt/pull/22) ([denysdovhan](https://github.com/denysdovhan))
- Add support for git status symbol options [\#18](https://github.com/denysdovhan/spaceship-prompt/pull/18) ([chrisjlebron](https://github.com/chrisjlebron))
- Fix \_ADD\_NEWLINE & \_SEPERATE\_LINE doc strings. [\#17](https://github.com/denysdovhan/spaceship-prompt/pull/17) ([katsika](https://github.com/katsika))
- Remove quotes from the default symbols. [\#10](https://github.com/denysdovhan/spaceship-prompt/pull/10) ([musically-ut](https://github.com/musically-ut))
- Bugfix \#2 [\#4](https://github.com/denysdovhan/spaceship-prompt/pull/4) ([Zeotyn](https://github.com/Zeotyn))

**Closed issues:**

- Add .editorconfig [\#85](https://github.com/denysdovhan/spaceship-prompt/issues/85)
- Moving screenshots to wiki [\#84](https://github.com/denysdovhan/spaceship-prompt/issues/84)
- ⬢ n support [\#70](https://github.com/denysdovhan/spaceship-prompt/issues/70)
- Add option to show datetime [\#53](https://github.com/denysdovhan/spaceship-prompt/issues/53)
- Is Ruby version shown everywhere? [\#50](https://github.com/denysdovhan/spaceship-prompt/issues/50)
- Logo ideas [\#42](https://github.com/denysdovhan/spaceship-prompt/issues/42)
- Show node version only when nvm/nodeenv is using an environment [\#31](https://github.com/denysdovhan/spaceship-prompt/issues/31)
- antigen wrong name in README.md [\#6](https://github.com/denysdovhan/spaceship-prompt/issues/6)
- Show Ruby only if needed. [\#5](https://github.com/denysdovhan/spaceship-prompt/issues/5)

**Merged pull requests:**

- Add vi-mode prompt info [\#32](https://github.com/denysdovhan/spaceship-prompt/pull/32) ([ghost](https://github.com/ghost))

## [1.0.0](https://github.com/denysdovhan/spaceship-prompt/tree/1.0.0) (2016-01-31)

[Full Changelog](https://github.com/denysdovhan/spaceship-prompt/compare/f8606101e1a0eb7774be2287d4341c9fea1ead95...1.0.0)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*