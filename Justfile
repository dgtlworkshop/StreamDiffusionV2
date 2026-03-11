set dotenv-load := true
set windows-shell := ["powershell", "-Command"]

_default:
    @just --list

[working-directory('demo')]
start-web model="T2V-1.3B":
    uv run python main.py --port 7860 --host 0.0.0.0 --num_gpus 1 --step 1 \
    --model_type {{ model }} \
    --enable-metrics

install: build-frontend install-hf

install-hf:
    uv run hf download Wan-AI/Wan2.1-T2V-1.3B --local-dir wan_models/Wan2.1-T2V-1.3B
    uv run hf download jerryfeng/StreamDiffusionV2 --local-dir ./ckpts --include "wan_causal_dmd_v2v/*"

[working-directory('demo/frontend')]
build-frontend:
    npm install
    npm run build
