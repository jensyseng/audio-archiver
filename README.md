# Audio Archiver

This tool is primarily used for converting to/from the WAV and FLAC file formats.  FLAC is a commonly used lossles format for digital archival purposes[^1].

[^1]: [NARA Federal Records Management Records Management Regulations, Policy, and Guidance > Appendix A: Tables of File Formats - Digital Audio](https://www.archives.gov/records-mgmt/policy/transfer-guidance-tables.html#digitalaudio)

## Usage

Archive all WAV files in the `samples` directory to FLAC and retain and metadata (including [GUANO metadata](https://github.com/riggsd/guano-spec)):

```shell
docker run --volume ./samples:/samples -it docker.io/ccgc/audio-archiver:747ba746 flac /samples/*.wav --keep-foreign-metadata-if-present
```

As above but archive all files with a modified date older than 90 days:

```shell
docker run --volume ./samples:/samples -it docker.io/ccgc/audio-archiver:747ba746 find /samples -name "*.wav" -mtime +90 -exec flac --keep-foreign-metadata-if-present {} \;
```
