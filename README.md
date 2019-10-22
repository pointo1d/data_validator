# OVERVIEW

This repo contains all elements of the (currently only) VW API GW project test environment that are common to 2, or more, of the APIs under test (including the test environment itself :-) - each of which has its' own specific repo and all of which follow the designated standard.

In order to directly facilitate the reasoning about APIs individually (coincidentally reflecting the manner in which the APIs under consideration are deployed, thus directly supporting per-API deployment testing in the realm of CI),  the API QA Git repo structure comprises a master repo in conjunction with a number of API specific repos on a per-API basis - which it (the master) references as Git sub-modules.

All of the repos are co-located under [the VWQA Stash project](https://stash.tribalddb.co.uk/projects/VWQA).

## Naming & Structure Standard

### Master Repo

#### Naming

The name of the master i.e. this, repo whilst following the repo naming standard, is immutable as *vw-api-gw-master*.

#### Structure

This repo varies from the API specific structure in as much as the following straucture applies...

```
vw-api-gw-master/
  etc/
    ruby/
  bin/
  lib/
    ruby/
    step_definitions/
    data_structs/
  vw-api-gw-<api_<a>>/
  vw-api-gw-<api_<b>>/
  .
  .
```

The above structure is explored further in the following sub-sections.

#### Files

##### /bin

As it suggests on the tin, this directory contains build, utility scripts et al - all of which are described [here](bin/README.md).

##### /etc/ruby/

This directory (currently) is the location for the run-time test environment configuration files.

##### /lib/ruby/

This directory contains ruby files that are common to 2, or more, of the API repos; Note that this also includes the run-time test environment itself.

##### /lib/step_definitions/

This directory contains the step definitions that are common to 2, or more, of the API repos - their usage et al are to be found [here](lib/step_definitions/README.md).

##### /lib/step_definitions/

This directory contains the data structure definitions that are common to 2, or more, of the APIs.

##### vw-api-gw-<api_<x\>\>

The directories are the API specific repos (also maintained under [the VWQA Stash project](https://stash.tribalddb.co.uk/projects/VWQA)) linked as Git sub-modules.

### API Repos

#### Naming

All of the repo's will be named *vw-api-gw-<api_name>** where <api_name\> is the name of the api matching the case of the posited/actual end-point name - it is from this name that the  name of the API under test is automagically determined.

#### Structure

All API specific repos will follow the standard structure and within it, file naming, as follows...

```
vw-api-gw-<api_name>/
  features/
      <api_name>_api.feature
      <complex resource_a>/
        <subresource_a>.feature
        <subresource_b>.feature
      <resource_a>.feature
    step_definitions/
      <complex resource_a>/
        <subresource_a>_steps.rb
        <subresource_b>_steps.rb
      <resource_a>_steps.rb
    data_struct/
      <complex resource_a>/
        <subresource_a>_struct.rb
        <subresource_b>_struct.rb
      <resource_a>_struct.rb
      
```

The above structure is explored further in the following sub-sections.

#### Files

There are cases where a resource is sufficiently complex &/or large enough to warrant it's division into sub-resource size elements for easier manipulation and indeed readability. These are named ain accordance with the above naming standard.

##### Features

###### <api_name\>_api.feature

This feature is responsible for ensuring that such things as the...

- Host exists and is on-air.
- API end-point exists and is on-air.
- Un/non versioned API calls are re-directed (to latest) as expected.

###### <resource_<x\>\>_api.feature

For each of the resources of the end-point, a feature will exist whose contents, when executed, are responsible for the behaviourial testing of the end-points comprising that resource. In particular, the file will contain...

- A *Background* scenario that describes all of the pre-conditions for the enclosed scenarios to be attempted.
- One, or more, scenarios per end-point that fully describe the expected behaviour of the end-point. The description for each of the scenarios &/or scenario outlines will identify the end-point(s) targetted by the scenario &/or scenario outline - each being on its' own line in the description.

##### Step Definitions

###### <resource_<x\>\>_steps.rb

For each of the resources identified in the feature file for that resource will have a partnering step definitions file in which are defined the step definitions particular to the resource - self-evidently not including the common step definitions which are to be found in the master repo (see above).

##### Expected Data Structure Definitions

