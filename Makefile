# Recursive GNU Make wildcard implementation
# https://stackoverflow.com/questions/2483182/recursive-wildcards-in-gnu-make/18258352#18258352
rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))


run:  ## [Local development] Run human tracking on the full video
	python src/main.py -i input_videos/miss_dior.mp4 -m yolo -s flash

run-small: ## [Local development] Run human tracking on the small video
	python src/main.py -i input_videos/miss_dior_small.mp4 -m yolo -s flash

run-hd: ## [Local development] Run human tracking on the full HD video
	mkdir output_videos
	python ./demo/demo_vid.py \
    ./mmtracking/configs/mot/qdtrack/qdtrack_faster-rcnn_r50_fpn_4e_crowdhuman_mot17-private-half.py  \
    --input ./input_videos/miss_dior_hd.mp4 \
    --checkpoint ./demo/checkpoints/qdtrack_faster-rcnn_r50_fpn_4e_crowdhuman_mot17_20220315_163453-68899b0a.pth  \
    --output ./output_videos/miss_dior_hd_output_tqdtrack_faster-rcnn_r50_fpn_4e_crowdhuman_mot17.mp4 \
    --show --device cpu

format: ## [Local development] Auto-format python code using black
	black src