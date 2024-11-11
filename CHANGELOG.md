# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Removed

- Remove Turbolinks as it is no longer supported ([PR 838](https://github.com/Crown-Commercial-Service/pmp-idam/pull/838))

### Changed

- Update Node to LTS Jod (v22.11.0) ([PR 931](https://github.com/Crown-Commercial-Service/pmp-idam/pull/931))
- Update alpine to v3.20 ([PR 841](https://github.com/Crown-Commercial-Service/pmp-idam/pull/841))
- Update ruby to v3.3.5 ([PR 839](https://github.com/Crown-Commercial-Service/pmp-idam/pull/839))
- Update ruby to v3.3.4 ([PR 837](https://github.com/Crown-Commercial-Service/pmp-idam/pull/837))

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
