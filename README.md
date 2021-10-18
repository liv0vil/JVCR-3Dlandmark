# [2021 Computer-Vision] Term-Project

This repository was forked from [JVCR](https://github.com/HongwenZhang/JVCR-3Dlandmark) for the purpose of the term project of class Computer Vision in Sejong Univ.

This repository includes the PyTorch code for training and evaluating the network described in [Joint Voxel and Coordinate Regression for Accurate 3D Facial Landmark Localization](https://arxiv.org/abs/1801.09242).

## Challenge Overview

본 챌린지는 얼굴의 상징점(눈, 코, 입 등)의 위치 즉, Facial Landmark 를 찾는 Task 입니다.   
해당 연구를 Facial Landmark Detection 혹은 Facial Landmark Localization 이라고도 합니다.

이번 챌린지에서는 [Joint Voxel and Coordinate Regression](https://arxiv.org/pdf/1801.09242.pdf) (이하 JVCR) 베이스라인으로 3D Landmark Detection 을 찾아내는 것을 목표로 합니다.

<p align='center'>
<img src='imgs/aflwDemo.gif' title='examples for 3D facial landmark localization' style='max-width:600px'></img>
</p>

## Dataset

Train Dataset으로는 `300W-LP` 를 사용합니다.
원래 JVCR 코드에서는 Validation-Set 으로 `AFLW3000-3D`를 사용하였으나, 이번 챌린지에서는 Testset으로 사용합니다.

- 300W-LP : The synthesized large-pose face images from 300W.
- AFLW3000-3D : The fitted 3D faces of the first 2000 AFLW samples, which can be used for 3D face alignment evaluation.

## 추천 논문 리스트
- [Face Alignment Across Large Poses: A 3D Solution](https://openaccess.thecvf.com/content_cvpr_2016/papers/Zhu_Face_Alignment_Across_CVPR_2016_paper.pdf)
- 

## Implement
`Joint Voxel and Coordinate Regression for Accurate 3D Facial Landmark Localization`   
아래 implement 을 따라 실행해주시기 바랍니다.

## Requirements

- python 2.7

### packages

- [PyTorch](https://www.pytorch.org) 1.2.0
- [NumPy](http://www.numpy.org) 1.16.2
- [Matplotlib](https://matplotlib.org) 2.2.2
- [progress](https://anaconda.org/conda-forge/progress) 1.3

## Usage

Clone the repository and install the dependencies mentioned above
```
git clone https://github.com/HongwenZhang/JVCR-3Dlandmark.git
cd JVCR-3Dlandmark
```
Then, you can run the demo code or train a model from stratch.


### Training

1. train과 evaluate 을 위한 데이터셋을 다운받기 (링크 및 소프트링크 추가)
- Download [300W-LP](http://www.cbsr.ia.ac.cn/users/xiangyuzhu/projects/3DDFA/main.htm) and [AFLW3000-3D](http://www.cbsr.ia.ac.cn/users/xiangyuzhu/projects/3DDFA/main.htm)
- Create soft links to the dataset directories
```
ln -s /path/to/your/300W_LP data/300wLP/images
ln -s /path/to/your/aflw2000 data/aflw2000/images
```
- Download `.json` annotation files from [here](https://drive.google.com/drive/folders/16cj4x1v1jbqikB4KS8ndnuP49coqwt1c) and put them into `data/300wLP` and `data/aflw2000` respectively
2. Run the training code
```
python train.py --gpus 0 -j 4
```

## Acknowledgment

The code is developed upon [PyTorch-Pose](https://github.com/bearpaw/pytorch-pose). Thanks to the original author.
