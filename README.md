# 육식도감 프로젝트

## 프로젝트 정보

- **작업 기간** : 2024.09 - 진행 **中**
- **인원** : 3명
- **내 역할(기여도)** : 기획(80%), 앱 개발(100%), 디자인(5%)
- **프로젝트 목적**
  - 사람들이 고기를 좀 더 알고 먹고, 똑똑하게 소비할 수 있도록 함
- **프로젝트 내용**
  - 부위별 고기에 대한 정보 전달 (부위별 특징, 잘 고르는 법, 기본 스펙, 레시피 등)
  - 내 취향에 맞는 부위 찾기
  - 고기에 관한 재미있는 정보를 카드뉴스 형태로 제공
- **대표 사용 기술** : `Riverpod`, `Shimmer`, `CachedNetworkImage`, `SharedPreferences`, `Pagination`, `Optimal Response`, `Debouncing`

---

## 육식도감

> 내 손 안의 고기 사전  

🥩 **매일 먹는 고기 조금은 알고 먹자**  
🛒 **구매도 좀 더 똑똑하게**  
🗞️ **재미있는 정보까지 카드뉴스로 제공**  

[YouTube 링크](https://www.youtube.com/shorts/XmoS10DLQao)

---

## 주요 기능 및 트러블 슈팅

### 고기 부위별 설명 화면

![고기 부위별 설명 화면](https://prod-files-secure.s3.us-west-2.amazonaws.com/a3e29db4-24e1-4b27-b8f1-6245f33b8a0b/04217704-5260-4621-8d0e-f1d0fb1dc8e9/Simulator_Screenshot_-_iPhone_15_Pro_-_2024-11-25_at_11.42.57.png)

- **기능 설명**
  - 고기의 기본적인 프로필 제공 (이미지, 한 줄 평, 소개)
  - 고기 잘 고르는 방법 제공 (신선한 고기 고르는 법, 부위별 잘 고르는 법)
  - 추천 레시피 제공
- **구현 기술**
  - 빠른 접근을 위해 빠른 스크롤 이동 메뉴 제공
  - `Riverpod` 기반 상태 관리와 캐싱 최적화를 통해 네트워크 트래픽 최소화
  - `Shimmer` 효과와 `CachedNetworkImage`를 활용하여 로딩 중 사용자 경험을 개선
- **문제점 및 해결책**
  - **문제점**: 코드 중복 설계, 재미 요소 부족, 과도한 데이터 사용량  
    **해결책**: 공통 데이터 모델화, 빠른 스크롤 및 강조 UI 제공, 이미지 품질 유지 및 압축 적용  

---

### 검색 기능

![검색 기능 화면](https://prod-files-secure.s3.us-west-2.amazonaws.com/a3e29db4-24e1-4b27-b8f1-6245f33b8a0b/a88be1f5-4871-4735-beb3-2f968da3e6d0/Simulator_Screenshot_-_iPhone_15_Pro_-_2024-11-25_at_19.47.56.png)

- **기능 설명**
  - 고기 부위를 검색하고 정보를 확인할 수 있는 기능
  - 최근 검색어와 인기 검색어 제공
  - 검색어 실시간 필터링
- **구현 기술**
  - `TextEditingController`와 `onChanged` 콜백을 활용해 검색어 실시간 감지
  - `SharedPreferences`를 통해 최근 검색어 저장 및 불러오기
- **문제점 및 해결책**
  - **문제점**: 결과 출력 제한, 빠른 입력 시 불필요한 렌더링 발생  
    **해결책**: 실시간 검색 결과 제공, `Debouncing`으로 검색 최적화  

---

### 카드뉴스

![카드뉴스 화면](https://prod-files-secure.s3.us-west-2.amazonaws.com/a3e29db4-24e1-4b27-b8f1-6245f33b8a0b/4d4f142e-dbce-433d-b0dc-16978d1c55b7/Simulator_Screenshot_-_iPhone_15_Pro_-_2024-11-25_at_12.17.22.png)

- **기능 설명**
  - 재미있는 고기 정보를 카드뉴스 형태로 제공
  - 매주 새로운 카드뉴스 추가
- **구현 기술**
  - `GridView.builder`를 사용한 동적 렌더링
  - `Pagination`으로 스크롤 동작에 따라 데이터 추가 로드
  - `Riverpod` 기반 상태 관리와 캐싱 최적화를 통해 네트워크 요청 최소화  

---

### 취향 저격 부위 찾기

![취향 저격 부위 찾기 화면](https://prod-files-secure.s3.us-west-2.amazonaws.com/a3e29db4-24e1-4b27-b8f1-6245f33b8a0b/35a154b8-b4db-4e53-9da7-890e8f49e6c2/Simulator_Screenshot_-_iPhone_15_Pro_-_2024-11-25_at_12.09.17.png)

- **기능 설명**
  - 고기 스펙 우선순위에 따라 속성과 단계를 선택하여 개인화된 결과 제공
- **구현 기술**
  - `Slider`를 활용한 단계별 값 조정 및 UI 반영  

---

### 고기 리스트

![고기 리스트 화면](https://prod-files-secure.s3.us-west-2.amazonaws.com/a3e29db4-24e1-4b27-b8f1-6245f33b8a0b/253bf8e1-da6d-4037-a479-4579423bd836/Simulator_Screenshot_-_iPhone_15_Pro_-_2024-11-25_at_11.42.52.png)

- **기능 설명**
  - 고기 부위별 리스트와 즐겨찾기 기능 제공
- **구현 기술**
  - `Optimal Response`를 사용하여 즐겨찾기 UX 향상  
