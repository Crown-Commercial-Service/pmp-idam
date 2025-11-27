# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Upgrade ruby version to v3.4.7 ([PR 1293](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1293))
- Update CCS Frontend with the new linear CCS logo ([PR 1293](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1293))
- Update CCS Frontend with the crown on the footer ([PR 1293](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1293))

## [3.1.0] - 2025-09-22

### Changed

- Update CCS Frontend with the new CCS branding ([PR 1212](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1212))

## [3.0.1] - 2025-08-18

### Changed

- Upgrade ruby version to v3.4.3 ([PR 1178](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1178))

### Security

- Various dependency updates

## [3.0.0] - 2025-06-16

### Changed

- Upgrade Rails to v7.2.2.1 ([PR 1082](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1082))
- Use Bun to manage our assets ([PR 1082](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1082))
- Upgrade GOV.UK Frontend version to v5.10.0 ([PR 1112](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1112))
- Upgrade CCS Frontend version to v1.4.1 ([PR 1112](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1112))
- Upgrade Rails to v8.0.2.0 ([PR 1109](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1109))
- Replace Arask with Solid Queue ([PR 1109](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1109))

## [2.2.1] - 2025-03-24

### Changed

- Upgrade GOV.UK Frontend version to v5.9.0 ([PR 1057](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1057))
- Upgrade CCS Frontend version to v1.3.3 ([PR 1057](https://github.com/Crown-Commercial-Service/pmp-idam/pull/1057))

## [2.2.0] - 2025-01-23

### Changed

- Upgrade ruby version to v3.4.1 ([PR 982](https://github.com/Crown-Commercial-Service/pmp-idam/pull/982))
- Upgrade alpine version to v3.21 ([PR 982](https://github.com/Crown-Commercial-Service/pmp-idam/pull/982))
- Update ruby to v3.3.6 ([PR 932](https://github.com/Crown-Commercial-Service/pmp-idam/pull/932))
- Update Node to LTS Jod (v22.11.0) ([PR 931](https://github.com/Crown-Commercial-Service/pmp-idam/pull/931))
- Update alpine to v3.20 ([PR 841](https://github.com/Crown-Commercial-Service/pmp-idam/pull/841))
- Update ruby to v3.3.5 ([PR 839](https://github.com/Crown-Commercial-Service/pmp-idam/pull/839))
- Update ruby to v3.3.4 ([PR 837](https://github.com/Crown-Commercial-Service/pmp-idam/pull/837))

### Removed

- Remove Turbolinks as it is no longer supported ([PR 838](https://github.com/Crown-Commercial-Service/pmp-idam/pull/838))

## [2.1.1] - 2024-08-22

### Security

- Various dependency updates

## [2.1.0] - 2024-05-19

### Added

- Update how we manage assets for PMP ([PR 735](https://github.com/Crown-Commercial-Service/pmp-idam/pull/735))

### Security

- Various dependency updates

## [2.0.3] - 2024-05-16

### Fixed

- Update ruby to v3.3.1 ([PR 704](https://github.com/Crown-Commercial-Service/pmp-idam/pull/704))
- Update ruby to v3.3.0 ([PR 664](https://github.com/Crown-Commercial-Service/pmp-idam/pull/664))

### Security

- Various dependency updates

## [2.0.2] - 2023-12-13

### Fixed

- Target a specific alpine version ([PR 610](https://github.com/Crown-Commercial-Service/pmp-idam/pull/610))
- Rename cookie_preferences cookie to cookie_preferences_pmp so that it does not conflict with corporate website ([PR 606](https://github.com/Crown-Commercial-Service/pmp-idam/pull/606))
- Optimise dockerfile ([PR 604](https://github.com/Crown-Commercial-Service/pmp-idam/pull/604))

### Security

- Various dependency updates

## [2.0.1] - 2023-11-27

### Fixed

- Fix issue with checking path ([PR 591](https://github.com/Crown-Commercial-Service/pmp-idam/pull/591))
- Remove all links for when the application is unavailable ([PR 590](https://github.com/Crown-Commercial-Service/pmp-idam/pull/590))
- Make 503 status page return 200 status code so that Barracuda does not block it ([PR 589](https://github.com/Crown-Commercial-Service/pmp-idam/pull/589))

### Security

- Various dependency updates

## [2.0.0] - 2023-11-14

### Added

- Update dockerfile to use alpine image ([PR 577](https://github.com/Crown-Commercial-Service/pmp-idam/pull/577))
- Add the ability to deploy to GPaaS via GitHub actions ([PR 576](https://github.com/Crown-Commercial-Service/pmp-idam/pull/576))
- Create the service unavailable page ([PR 573](https://github.com/Crown-Commercial-Service/pmp-idam/pull/573))
- Upgrade rails to v7.1.1 ([PR 562](https://github.com/Crown-Commercial-Service/pmp-idam/pull/562))

### Security

- Various dependency updates
