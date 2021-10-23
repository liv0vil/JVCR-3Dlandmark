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
원래 JVCR 코드에서는 Validation-Set 으로 `AFLW2000-3D`를 사용하였으나, 이번 챌린지에서는 Testset으로 사용합니다.

68개의 랜드마크 정보는 아래 이미지와 같이 인덱싱 되어 있습니다.   
(3D보다는 2D Landmark를 더 이해하기 쉬울 것 같아 이미지는 2D Landmark를 첨부하였습니다.)

<img src="https://user-images.githubusercontent.com/59993108/138572460-711f918e-4300-4e27-bfd0-22f51d985df2.png" height="300"/>


- [300W-LP](http://www.cbsr.ia.ac.cn/users/xiangyuzhu/projects/3DDFA/main.htm) : Facial Landmark Detection 에서 가장 대표적으로 사용되는 데이터셋인 [300W](https://ibug.doc.ic.ac.uk/resources/300-W/)을 Large Pose로 합성시킨 데이터셋입니다. 61,255개의 얼굴 이미지가 존재하며, 3D 변형 모델 기반 프로파일링 방법을 사용하여 기존 300W에서의 얼굴 이미지를 −90◦~90◦ 를 가지는 Large-Pose로 가공하여 만들었고 68개의 3D 랜드마크를 가지게됩니다. 
- [AFLW2000-3D](http://www.cbsr.ia.ac.cn/users/xiangyuzhu/projects/3DDFA/main.htm) : 300W-LP와 동일하게 68개의 3D 랜드마크를 갖는 데이터셋으로, 2,000개의 얼굴 이미지가 존재합니다. AFLW이라는 대규모 데이터셋의 일부를 300W-LP와 동일한 방식으로 3D annotation을 구한 것으로, 이번 챌린지에서는 테스트셋으로 사용합니다.

## 추천 논문 리스트
- [Face Alignment Across Large Poses: A 3D Solution](https://openaccess.thecvf.com/content_cvpr_2016/papers/Zhu_Face_Alignment_Across_CVPR_2016_paper.pdf) 
- [How far are we from solving the 2D & 3D Face Alignment problem?(and a dataset of 230,000 3D facial landmarks)](https://openaccess.thecvf.com/content_ICCV_2017/papers/Bulat_How_Far_Are_ICCV_2017_paper.pdf)
- [Attention-Driven Cropping for Very High Resolution Facial Landmark Detection](https://openaccess.thecvf.com/content_CVPR_2020/papers/Chandran_Attention-Driven_Cropping_for_Very_High_Resolution_Facial_Landmark_Detection_CVPR_2020_paper.pdf)

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
- Download [300W-LP](http://www.cbsr.ia.ac.cn/users/xiangyuzhu/projects/3DDFA/main.htm) and [AFLW2000-3D](http://www.cbsr.ia.ac.cn/users/xiangyuzhu/projects/3DDFA/main.htm)
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

## Pre-trained Model

300W-LP로 학습한 [Pre-Trained Model](https://drive.google.com/drive/folders/1wT3efHjqUfTMHj8qAjkPn8m9qS614Lxu)을 다운받은 후 checkpoint 로 사용할 수도 있습니다.


## Acknowledgment

The code is developed upon [PyTorch-Pose](https://github.com/bearpaw/pytorch-pose). Thanks to the original author.
