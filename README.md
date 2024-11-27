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

<div style="display: flex; align-items: flex-start;">
  <img src="https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/git-image%2Fmeat-dictionary%2F1.png?alt=media&token=9f1a7976-8727-42a6-be53-1331633531e8" alt="고기 부위별 설명 화면" width="300" style="margin-right: 20px;"/>
  <div>
    - **기능 설명**  
      - 고기의 기본적인 프로필 제공 (이미지, 한 줄 평, 소개)  
      - 고기 잘 고르는 방법 제공 (신선한 고기 고르는 법, 부위별 잘 고르는 법)  
      - 추천 레시피 제공  
    - **구현 기술**  
      - 빠른 접근이 가능하도록 빠른 스크롤 이동 메뉴 제공  
      - 불러온 데이터를 `Riverpod` 기반 상태 관리와 캐싱 최적화를 통해 네트워크 트래픽을 최소화  
      - `Shimmer` 효과와 `CachedNetworkImage`를 활용해 이미지 로딩 중 사용자 경험을 개선하고 네트워크 트래픽 최소화  
    - **문제점**  
      - 1: 부위별로 공통적인 부분과 개별적인 부분을 코드 중복을 최소화하는 설계에 어려움을 겪음  
      - 2: 사전 형태의 앱 특성상 사용자에게 재미있고 편리한 경험을 제공하는 데 어려움을 느낌  
      - 3: 앱 특성상 한 번에 다수의 이미지를 로드하면서 데이터 사용량이 과다하게 발생  
    - **해결책**  
      - 1: 모델(model)을 활용하여 공통적인 데이터를 인자로 처리함으로써 코드 중복을 최소화  
      - 1: 구현 전에 설계 단계를 철저히 수행하여 구조를 명확히 정의하고, 이를 통해 리팩토링 작업을 최소화  
      - 2: 빠른 스크롤 메뉴와 주요 단어 강조를 사용하여 사용자에게 편리함 제공  
      - 3: 사용자가 불편함을 느끼지 않는 범위 내에서 이미지 품질을 유지하며 최대한 압축해 저장하여 데이터 사용량 최적화  
  </div>
</div>

---

### 검색 기능

<div style="display: flex; align-items: flex-start;">
  <img src="https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/git-image%2Fmeat-dictionary%2F2.png?alt=media&token=ca3566aa-0238-4d60-93ec-09f80897424d" alt="검색 기능 화면" width="300" style="margin-right: 20px;"/>
  <div>
    - **기능 설명**  
      - 사용자가 원하는 고기 부위를 검색하여 정보를 확인할 수 있는 기능 제공  
      - 최근 검색어와 인기 검색어를 통해 사용자에게 유용한 검색 경험 제공  
      - 검색어를 입력하면 관련 고기 부위가 실시간으로 필터링되어 결과를 보여줌  
    - **구현 기술**  
      - `TextEditingController`와 `onChanged` 콜백을 활용해 사용자가 입력하는 검색어를 실시간으로 감지하고 결과를 업데이트  
      - `SharedPreferences`를 사용해 최근 검색어를 로컬에 저장하고 불러오기  
    - **문제점**  
      - 1: 검색 버튼을 눌러야만 결과가 출력되기 때문에 사용자 경험이 다소 제한적  
      - 2: 검색 중 사용자의 입력 속도가 빠를 경우 불필요한 필터링과 렌더링이 발생  
    - **해결책**  
      - 1: 단어를 입력할 때 `TextEditingController`를 실시간으로 체크해서 검색 결과를 사용자에게 제공  
      - 2: `Debouncing`을 사용해 검색이 멈췄을 때 렌더링이 발생하도록 구현  
  </div>
</div>

---

### 카드뉴스

<div style="display: flex; align-items: flex-start;">
  <img src="https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/git-image%2Fmeat-dictionary%2F3.png?alt=media&token=6949764e-97a1-4b38-ab1c-c906cf942933" alt="카드뉴스 화면" width="300" style="margin-right: 20px;"/>
  <div>
    - **기능 설명**  
      - 재미있는 고기에 관한 정보를 카드뉴스 형태로 제공  
      - 매주 1개씩 카드뉴스 추가됨  
    - **구현 기술**  
      - `GridView.builder`를 사용하여 카드뉴스를 그리드 형태로 동적으로 렌더링  
      - 대용량 사진 데이터 처리를 위해 `Pagination`을 구현하고, 스크롤 동작에 따라 데이터가 동적으로 추가되는 기능 설계  
      - 불러온 데이터를 `Riverpod` 기반 상태 관리와 캐싱 최적화를 통해 네트워크 요청을 최소화  
  </div>
</div>

---

### 취향 저격 부위 찾기

<div style="display: flex; align-items: flex-start;">
  <img src="https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/git-image%2Fmeat-dictionary%2F4.png?alt=media&token=69fc9a60-9a9c-4300-813e-b0f74fdd2b08" alt="취향 저격 부위 찾기 화면" width="300" style="margin-right: 20px;"/>
  <div>
    - **기능 설명**  
      - 고기 스펙의 우선순위에 따라 속성과 단계를 선택하여 검색 결과 개인화  
    - **구현 기술**  
      - `Slider`를 사용해 단계별 값을 조정하고 선택 결과를 UI에 반영  
  </div>
</div>

---

### 고기 리스트

<div style="display: flex; align-items: flex-start;">
  <img src="https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/git-image%2Fmeat-dictionary%2F5.png?alt=media&token=c9e010f4-178f-4b5c-a098-b9e11a7ab889" alt="고기 리스트 화면" width="300" style="margin-right: 20px;"/>
  <div>
    - **기능 설명**  
      - 고기 부위별 리스트 제공  
      - 즐겨찾기 기능 제공  
    - **구현 기술**  
      - 즐겨찾기를 할 때 `Optimal Response`를 사용하여 사용자 경험을 증진  
  </div>
</div>
