_default:
    @just --list

[working-directory('demo')]
start-web model="T2V-1.3B":
    CUDA_VISIBLE_DEVICES=0 uv run python main.py --port 7860 --host 0.0.0.0 --num_gpus 1 --step 1 \
    --model_type {{ model }} \
    --enable-metrics
