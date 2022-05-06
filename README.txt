Readme for Behind The Mask Project

Prerequisites
Code is intended to work with Python 3.6.x.

PyTorch 0.3.1 & Torchvision

Download 'visdom' and 'dominate' package along with all the requisite packages and libraries as present in requirements.txt

Training & Testing
1. Setup the dataset
First, you will need to build your datasets by setting up the following directory structure:
.
├── datasets                   
|   ├── <dataset_name>         # i.e., 
|   |   ├── train              # Training
|   |   |   ├── A              # Contains domain A images (i.e., masked images)
|   |   |   └── B              # Contains domain B images (i.e., unmasked images)
|   |   └── test               # Testing
|   |   |   ├── A              # Contains domain A images (i.e., masked images)
|   |   |   └── B              # Contains domain B images (i.e., unmasked images)


2. Training
set -ex
python /content/gdrive/MyDrive/Attention_GAN/train.py --dataroot /content/gdrive/MyDrive/Attention_GAN/datasets/mask_unmask --name mask_unmask_attentiongan --model attention_gan --dataset_mode unaligned --pool_size 50 --continue_train --no_dropout --norm instance --lambda_A 10 --lambda_B 10 --lambda_identity 0.5 --load_size 286 --crop_size 256 --batch_size 4 --niter 60 --niter_decay 0 --gpu_ids 0 --display_id 0 --display_freq 100 --print_freq 100

3. Testing
set -ex
python /content/gdrive/MyDrive/Attention_GAN/test.py --dataroot /content/gdrive/MyDrive/Attention_GAN/datasets/mask_unmask --name mask_unmask_attentiongan --model attention_gan --dataset_mode unaligned --norm instance --phase test --no_dropout --load_size 256 --crop_size 256 --batch_size 1 --gpu_ids 0 --num_test 25 --saveDisk

Code Structure
train.py, test.py: the entry point for training and testing.
utils.py: consists of several helper functions.

Acknowledgments
This source code borrows heavily from CycleGAN and AttentionGAN.