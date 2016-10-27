<!-- Guidance:
Logo: The logo needs have the text "Logo" inside the square bracket place holder to be recognized at the App Library.
Tool name: First single hashtag (#) will be taken as tool name.
Version: Should always go after the first hastag and before the second hastag. The line needs to respond to the regexp "^Version: (.+)" being the first group the actual version.

Fields: for the App Library, the following fields will be parsed:

# Name of the tool
Version: z.x-whatever
## Short description
## Description
## Key features
## Publications
## Screenshots
## Tool Authors 
- Author 1 and affiliation
- [Author 2](link_to_author_2) and affiliation
## Container Contributors
- Contributor 1
- [Contributor 2](link_to_contributior_2) and affiliation
## Website
## Usage Instructions

Free text with triple tick code blocks, comprising docker, ipython and galaxy usage

## Installation 

They all have to be at the second hashtag level

For screenshots, you should use the following scheme:

![screenshot](screenshots/s1.gif)
![screenshot](screenshots/s2.gif)

-->
![Logo](w4m.png)

# W4M LCMS matching
Version: 3.1.1

## Short description

<!-- 
This should only be 20 to 40 words, hopefully a single sentence.
-->

Annotation of MS peaks using matching on a spectra database.

## Description

This tool performs LC/MS matching on an input list of MZ/RT values, using either a provided in-house single file database or a connection to Peakforest database.

## Key features

- LCMS annotation.

## Functionality

- Annotation / MS / L2a Library Spectrum Match
- Post-processing

## Approaches

- Metabolomics / Untargeted
  
## Instrument Data Types

- MS / LC-MS / Orbitrap LC-MS
- MS / LC-MS / HPLC-MS
- MS / LC-MS / UPLC-MS
- MS / LC-MS / Centroid LC-MS

## Screenshots

## Tool Authors

- Pierrick Roger (CEA).

## Container Contributors

- Pierrick Roger (CEA).

## Website

- http://workflow4metabolomics.org

## Git Repository

- https://github.com/phnmnl/container-lcmsmatching.git

## Installation 

For local individual installation:

```bash
docker pull docker-registry.phenomenal-h2020.eu/phnmnl/lcmsmatching
```

## Usage Instructions

For direct docker usage:

```bash
docker run docker-registry.phenomenal-h2020.eu/phnmnl/lcmsmatching ...
```

## Publications

<!-- Guidance:
Use AMA style publications as a list (you can export AMA from PubMed, on the Formats: Citation link when looking at the entry).
-->

