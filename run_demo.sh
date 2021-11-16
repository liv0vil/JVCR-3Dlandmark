rm output/output.json

python run_demo.py \
    --gpus 7 \
    --resume_p2v2c /home/jyhong/workspace/Jyhong_JVCR-3Dlandmark/checkpoint/model_p2v2c_300wLP.pth.tar \
    --imgDir ./data/aflw2000_img_paths.json \
    --outDir ./output/