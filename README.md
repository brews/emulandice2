# emulandice2


```shell
docker run --rm \
  -v ./data:/data \
  emulandice2:dev \
  --pipeline-id=1234 \
  --ice-source=GIS \
  --emu-file="/data/input/emu_file/GIS_ALL_CISM_pow_exp_01_EMULATOR.RData" \
  --scenario="ssp585" \
  --climate-data-file="/data/input/emulandice2.ssp585.GrIS2300.temperature.fair.temperature_climate.nc" \
  --pyear-start=2020 \
  --pyear-end=2300 \
  --debug --output-gslr-file="/data/output/gslr.nc"
```

```shell
docker build -t emulandice2:dev . --no-cache --platform="linux/amd64"
```
