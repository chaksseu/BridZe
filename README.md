# 🛫 BridZe : 다문화가정 아동을 위한 언어와 정서 길잡이 서비스 🌎
## 📝다문화 아이들의 언어 및 정서 평가, 기관 연결 플랫폼 : 베트남 다문화가정을 중심으로
---
### Front-end
<p>
   <img src="https://img.shields.io/badge/Flutter-02569B.svg?style=for-the-badge&logo=Flutter&logoColor=white">
</p>
   
### Back-end
<p>
   <img src="https://img.shields.io/badge/Flask-02569B.svg?style=for-the-badge&logo=Flask&logoColor=white">
   <img src="https://img.shields.io/badge/Goorm-02569B.svg?style=for-the-badge&logo=Goorm&logoColor=white">
</p>

### Communication
<p>
  <img src="https://img.shields.io/badge/Google Meet-00897B.svg?style=for-the-badge&logo=Google Meet&logoColor=white">
  <img src="https://img.shields.io/badge/Notion-000000.svg?style=for-the-badge&logo=Notion&logoColor=white">
</p>
  
### Version Control
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![GitKraken](https://img.shields.io/badge/GitKraken-179287.svg?style=for-the-badge&logo=GitKraken&logoColor=white)
##
---
## 서비스 소개 

BridZe는 정보 소외 대상자이자 디지털 소외 계층인 베트남 다문화가정 아동을 위한 언어와 정서 평가를 통한 기관 추천 서비스로, 다문화가정 아동의 발음과 읽기능력을 평가하고 아동의 표정과 유대관계를 평가하여 분석하고 언어 문제의 경우 언어 교육 기관으로, 정서 문제인 경우 심리 상담 기관을 추천해줍니다. 
다문화가정 아동 혹은 한국 아동을 위한 언어 교육 기관과 심리 상담 기관은 국내에 많이 존재하고 있습니다. 그러나 한국 가정 부모님들과 달리 다문화가정 부모님들은 이러한 자원을 활용하기 위한 아동 관찰 및 정보 찾기를 통한 문제 해결이 어렵습니다. 따라서 다문화가정 아동들도 한국 아동들과 동일하게 제대로 된 환경에서 성장할 수 있도록 정보 소외 대상자인 이들이 아동을 직접 오랜 시간 관찰하고 정보를 찾아보지 않고도 기관을 이용할 수 있도록 BridZe 서비스가 개발되어야합니다.

---
## 데이터 모델 소개

- Whisper (STT 모델)
: openai에서 오픈 소스로 공개한 Speech To Text(STT) 모델인 whisper은 2023년 7월 기준 가장 고성능의 STT 모델이었습니다. BridZe는 해당 모델의 성능을 올리고 베트남인이 한국어를 발화할 때 보이는 특성들을 반영하여 전사할 수 있는 STT 모델로 fine tuning을 진행하였습니다. 기존 모델의 경우 '아,어,음'과 같은 말더듬 표현을 교정하여 생략된 채로 음성 파일을 텍스트로 전사하였으나 발음의 어눌함과 읽기 능력을 평가해야하는 BridZe의 목적에 맞게 말더듬 표현까지 전사할 수 있도록 fine tuning을 진행하였습니다. 해당 모델은 BridZe 내 언어 평가에서 활용됩니다.

- SEvggnet (CV 모델)
: 기존 vggnet 모델은 외국인의 얼굴을 잘 인식하고 표정을 잘 분류했지만 비교적 이목구비가 뚜렷하지 않은 동양인의 얼굴은 잘 인식하지 못하는 모습을 보였습니다. 다문화가정 아동들은 한국인 부모님과 타국가의 부모님 사이에서 태어난 아동들이기에 vggnet 모델이 동양인의 얼굴과 표정 역시 잘 인식할 수 있도록 추가학습을 진행하였습니다. SE 블록을 추가하여 vggnet 모델의 정확도를 올리는 작업을 진행하였습니다. 해당 모델은 BridZe 내 정서 평가의 표정 평가 및 분류에서 활용됩니다.

---
# Whisper 파일 트리
```
📦data_STT, CV
 ┗ 📂Whisper용 원천 데이터(샘플 100개)
 ┃ ┣ 📂라벨링 데이터(샘플 100개)
 ┃ ┃ ┣ 📜VN10QC226_VN0005_20210801.csv
 ┃ ┃ ┣ 📜VN10QC226_VN0009_20210810.csv
                 . . .
 ┃ ┃ ┣ 📜VN10QC227_VN0082_20210802.csv
 ┃ ┃ ┗ 📜VN10QC227_VN0083_20210812.csv
 ┃ ┗ 📂오디오 파일(샘플 100개)
 ┃ ┃ ┣ 📜VN10QC226_VN0005_20210801.wav
 ┃ ┃ ┣ 📜VN10QC226_VN0009_20210810.wav
                 . . .
 ┃ ┃ ┣ 📜VN10QC227_VN0082_20210802.wav
 ┃ ┃ ┗ 📜VN10QC227_VN0083_20210812.wav
```
```
AI Hub에서 제공한 외국인의 한국어 발화 데이터셋입니다.
'https://aihub.or.kr/aihubdata/data/view.do?currMenu=&topMenu=&aihubDataSe=realm&dataSetSn=505'에서 다운로드 가능합니다.
데이터의 수가 19만개가 넘어가 100개씩만 업로드하였습니다.
```
```
┣ 📂Whisper_finetuned
 ┃ ┣ 📂flagged
 ┃ ┣ 📂git-lfs-3.4.0(파일 생략)
 ┃ ┣ 📂Whisper_trained_model
 ┃ ┃ ┣ 📜.gitattributes
 ┃ ┃ ┣ 📜.gitignore
                . . .
 ┃ ┃ ┣ 📜vocab.json
 ┃ ┃ ┗ 📂runs
 ┃ ┣ 📜=0.30
 ┃ ┣ 📜=2.6.1
```
```
fine tuning된 Whisper 모델입니다.
Hugging Face에서 API형태로 언제든 불러 쓸 수 있습니다.
```
```
 ┃ ┗ 📜Whisper_코드.ipynb
```
```
fine tuning을 진행한 코드입니다.
fine tuning 과정의 검증이 필요하실 경우, 위 쪽의 전처리 코드는 모두 건너뛰고 중간의
`loaded_dataset_dict = DatasetDict.load_from_disk("/content/drive/MyDrive/bridze_data")`
이 코드부터 실행하시면 됩니다. (경로는 저장위치에 맞게 수정하시면 됩니다.)
```
- bridze_data는 이 [데이터셋](https://drive.google.com/drive/u/1/folders/11qAPKh_tbQM3x48KM_yYE1LZRKK_CNi3)을 다운받으시면 됩니다.
   - bridze data는 whisper모델에 투입하여 훈련할 수 있도록 가공이 완료된 데이터셋입니다.
---
# SEvggnet 파일 트리
---
# 환경 설정

## Whisper 실행 환경
- Whisper fined tune 코드 : `data_STT, CV/Whisper_finetuned/Whisper_코드.ipynb`
- Whisper fine tuning에 사용된 데이터셋 : 인공지능 학습을 위한 외국인 한국어 발화 음성 데이터의 베트남 도메인 19만 데이터
   - 해당 데이터셋의 전체 버전은 [ai hub](https://www.aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=505)에서 다운이 가능합니다.
- Whisper 구동 환경 : pytorch , cuda 를 설치합니다.
   - 설치 방법 참조 : https://pytorch.org/get-started/previous-versions/
- Whisper 사용 방법 : 위 코드가 문제없이 끝까지 실행된다면, 저희 Hugging Face repository에 손실값과 cer오류율이 가장 작은 모델이 저장되고, API 형태로 언제든 불러서 쓸 수 있습니다.
```
pipe = pipeline(model="oceanstar/bridze")
pipe(audio_file)['text']
위와 같이 모델을 불러 사용할 수 있습니다.
```
---
## SEvggnet 실행 환경
- SEvggnet fined tune 코드 :
- SEvggnet fine tuning에 사용된 데이터셋 : 한국인 감정인식을 위한 복합 영상의 이미지 데이터
   - 해당 데이터를 활용하여 imblearn의 SMOTE 기법으로 각 감정별 6만 데이터로 증강시켜 학습을 진행하였습니다.
   - 해당 데이터셋의 전체 버전은 [ai hub](https://www.aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=82)에서 다운이 가능합니다.
- SEvggnet 구동 환경 :
- SEvggnet 사용 방법 (데이터 불러오기) :
---

## 프론트엔드 개발 환경
- Dart 언어 기반의 Flutter
- Flutter 설치 하기 : https://docs.flutter.dev/get-started/install
- 코드 구동하기 
     - vscode나 androidstudio에서 device를 chrome으로 설정합니다.
     - 터미널에 flutter pub get 입력 후 main.dart를 디버깅합니다.
- main.dart 위치 : `bridze/lib/main.dart`

## 백엔드 개발 환경

---
  
# 최종 모델 성능 결과
|모델|정확도|
|---|---|
|openai whisper|80.7|
|BridZe fine tuned whisper|92.7|
|vggnet|.|
|BridZe fine tuned SEvggnet|.|
- openai whisper과 vggnet은 기존에 공개된 오픈 소스 코드의 정확도이며 BridZe fine tuned whisper과 BridZe fine tuned SEvggnet은 저희 팀이 직접 fine tuning하여 목적에 맞게 새로이 구축된 모델의 정확도입니다.
  
# whisper 성능 결과
|step|training loss|validation loss|cer(글자 단위 오류율)|
|---|---|---|---|
|1500|0.221|0.238|9.3|
|2000|0.225|0.219|8.6|
|2500|0.194|0.206|7.5|
|3000|0.139|0.196|7.3|
|3500|0.178|0.190|7.5|
|4000|0.163|0.188|7.3|
- 4000스텝까지의 학습 중 check point를 통해 최고 성능의 3000스텝의 모델을 저장하였습니다.
- 3000스텝에서의 loss 값이 0.18로 존재하나 과적합이라고 보기 어려운 미세한 loss값이며 새로운 test 데이터셋으로 확인한 결과 과적합이 일어나지 않는 모델임을 확인했습니다.
  
# SEvggnet 성능 결과
---

# 모델과 서비스 연결
## Frontend
프론트엔드(flutter)에서는 기관 추천 알고리즘을 제공합니다. 임계치에 따라 분류된 언어 평가(상,중,하)와 정서평가(상,중상,중하,하)에 맞는 아동 맞춤 기관을 제공합니다.
본인이 원하는 지역을 선택하면 해당 지역의 맞춤 기관을 추천받을 수 있습니다.
- 알고리즘 파일 위치: `/bridze/lib/institution.dart`

## Backend
백엔드(flask)에서는 프론트엔드(flutter)와 상호작용하며 음성 및 이미지 데이터 관련 다양한 작업을 처리합니다. 음성을 텍스트로 변환하는(STT) 기능, Character Recognition Rate (CRR) 점수 산정, 비디오 프레임 추출, 이미지 감정 분석 등의 기능을 지원합니다.
- flask 파일 위치: `/bridze/backend/application.py`
## 1. 음성 데이터 텍스트 변환 (Whisper)
음성 데이터를 텍스트 데이터로 변환합니다. 해당 기능은 Hugging Face에 업로드한 모델 API를 받아 사용합니다. 
- 모델 실행 위치: `/bridze/backend/stt/model_stt.py`
- Hugging Face 모델 주소: https://huggingface.co/models/oceanstar/bridze (수정필요)
## 2. 데이터 분석 (CRR)
입력된 텍스트 데이터를 저장된 지정발화 문장으로 평가하여 100점 만점으로 반환하는 알고리즘입니다.
- 알고리즘 실행 위치: `/bridze/backend/stt/crr.py`
## 3. 얼굴 및 감정 인식 (Mediapipe + VGGNet)
 Mediapipe를 사용하여 얼굴을 감지하고, 학습된 VGGNet 모델을 활용하여 감지된 얼굴의 감정을 예측합니다.
- 학습 모델 파일: `/bridze/backend/facial_emotion_recognition/vggnet_weigt.h5`
- 모델 실행 위치: `/bridze/backend/facial_emotion_recognition/model_cv.py`
## 4. 동영상 프레임 추출
OpenCV를 사용하여 동영상 파일을 읽고 지정된 간격으로 프레임을 추출하여 이미지로 저장합니다. 추출된 프레임은 `frames` 폴더에 저장됩니다.
- 알고리즘 실행 위치: `/bridze/backend/videos/video2frame.py`
---

## 서비스 흐름도
![서비스 흐름도](https://github.com/BridZe/bridze/assets/89845380/97583ad6-c8ad-4aa0-af2b-944b46edbca5)
## 언어 평가 과정
![stt](https://github.com/BridZe/bridze/assets/89845380/35c4dec5-07cc-4e7d-9bd4-0d896e6d0472)
아동의 나이에 맞는 수준의 지정 발화를 읽어 Flutter 내에서 음성 녹음을 진행합니다. 음성이 녹음되면 해당 음성 파일은 whisper 모델 안에서 전처리와 토큰화를 거쳐 텍스트로 전사되고 정답셋과 비교하여 글자 단위 비교 알고리즘인 CRR 알고리즘을 통해 100점 만점으로 환산되어 점수를 받게 됩니다. 받은 점수는 AI HUB의 한국어 아동 음성 데이터, 어린이 음성 데이터를 통해 계산된 통계 기반 임계치로 상, 중, 하로 결과를 받게 됩니다. 베트남 부모님도 이와 동일한 방식으로 언어 평가를 받게 됩니다.

### 아동 임계치
|나이|상|중|하|
|---|---|---|---|
|5세 - 7세|100 ~ 88|87 ~ 69|68 ~ 0|
|8 - 10세|100 ~ 91|90 ~ 73|72 ~ 0|
|11세 - 13세|100 ~ 97|96 ~ 76|75~ 0|

### 부모 임계치
|상|중|하|
|---|---|---|
|100~97|96~89|88 ~ 0|

## 정서 평가 과정
![정서평가과정](https://github.com/BridZe/bridze/assets/89845380/d79f46f3-9d60-4751-95dd-39879c502787)
베트남 다문화가정 아동이 검증된 테스트지를 바탕으로 한 질문 5개에 답을 합니다. 답변은 임의의 가중치에 의해 100점 만점으로 환산되어 저장됩니다. 기존 테스트지의 기준에 따라 상, 중상, 중하, 하 4단계로 나누어 평가받게 됩니다. 유대관계 테스트지에 답하는 중간중간 BridZe의 캐릭터 토리찌가 부모님과 관련된 질문을 하고 아동은 이에 답하게 됩니다. Flutter 내에서 화면이 녹화되는 동안 mediapipe 기술로 얼굴을 인식하여 잡아내고 SEvggnet이 해당 범위 내에서 아동의 표정이 '행복, 슬픔, 화남, 불안(두려움), 무표정' 중 어떠한 표정인지를 판단하여 부모님에 대한 질문에 답할 때의 주된 표정이 무엇인지를 테스트 점수와 함께 제공합니다. 이어, 언어적인 소통이 안되는 관계일수록 비언어적인 요소를 파악하여 유대관계를 형성하는 것의 중요성은 높아집니다. 이러한 이유로 의사소통이 어려운 베트남 부모님과 다문화가정 아동의 좋은 유대관계 형성을 위하여 아동의 5가지 표정 모음집을 위와 동일한 방식으로 mediapipe와 vggnet을 통해 분류해 제공하도록 합니다. 표정을 판별할 때에는 5초간 촬영을 진행하며 0.5초마다 화면을 캡처하여 가장 높은 확률로 제시된 감정의 표정과 동일한 표정이라고 분류된 사진을 제공합니다. 마지막으로 Flutter 내 촬영된 영상을 제공하여 부모님이 확인할 수 있으며 기관에서도 참고할 수 있습니다.

### Contributors 👩‍💻👨‍💻
<a href="https://github.com/chaenni0312"><img src="https://img.shields.io/badge/chaenni0312-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/KwonYeonghoo"><img src="https://img.shields.io/badge/KwonYeonghoo-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/park-hyunbin"><img src="https://img.shields.io/badge/Park Hyunbin-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/oceanstar777"><img src="https://img.shields.io/badge/oceanstar777-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/chaksseu"><img src="https://img.shields.io/badge/chaksseu-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/Hongjunior"><img src="https://img.shields.io/badge/Hongjunior-black?style=social-square&logo=github&logoColor=white"/></a>
