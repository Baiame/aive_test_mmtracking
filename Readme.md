# Human Tracking

Human tracking implementation in python using QDTrack.
Example video here: [miss_dior_hd_output](https://drive.google.com/file/d/1Y_vn_jreoxi5QjL2Ct7oOOOPN1IBC4Nm/view?usp=sharing)

## Install

### Clone

```bash
git clone git@github.com:Baiame/aive_test_mmtracking.git
cd aive_test_mmtracking
```

### Python

Have Python `>=3.9` installed with  `conda`.
Have `make` installed. For example using `brew`:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
)
brew install make
```

Install requirements:
Follow the tutorial here: [MMTRACKING installation](https://github.com/Baiame/mmtracking/blob/master/docs/en/install.md)
The folder architecture should be:
```
.
├── Makefile
├── Readme.md
├── demo
├── input_videos
├── mmcv
├── mmtracking
└── output_videos
```

### Models

Download [QDTrack Faster R-CNN](https://download.openmmlab.com/mmtracking/mot/qdtrack/mot_dataset/qdtrack_faster-rcnn_r50_fpn_4e_crowdhuman_mot17_20220315_163453-68899b0a.pth) and place it in the `./demo/checkpoints` folder.

## Run

To run the test with the default video and default mode, run:

```bash
make run-hd
```

Otherwise, you can use the following command:

```bash
python ./demo/demo_vid.py \
    <MODEL_CONFIG>  \
    --input <INPUT_VIDEO> \
    --checkpoint <MODEL>  \
    --output <OUTPUT_VIDEO> \
    --show --device <DEVICE>
```


For the device, you can choose:
- cpu
- cuda (if you have a cuda compatible gpu)

Known errors:
```
ImportError: numpy.core.multiarray failed to import
```

Just update numpy:
```
pip install -U numpy 
```

## Development

For code formatting, install `black` and run the formatting with `make`:

```bash
brew install black
make format
```
