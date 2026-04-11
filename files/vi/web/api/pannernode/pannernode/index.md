---
title: "PannerNode: PannerNode() constructor"
short-title: PannerNode()
slug: Web/API/PannerNode/PannerNode
page-type: web-api-constructor
browser-compat: api.PannerNode.PannerNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`PannerNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một phiên bản đối tượng {{domxref("PannerNode")}} mới.

## Cú pháp

```js-nolint
new PannerNode(context)
new PannerNode(context, options)
```

### Tham số

- `context`
  - : Một {{domxref("BaseAudioContext")}} biểu diễn ngữ cảnh âm thanh mà bạn muốn liên kết với nút này.
- `options` {{optional_inline}}
  - : Một đối tượng từ điển [`PannerOptions`](https://webaudio.github.io/web-audio-api/#idl-def-PannerOptions) xác định các thuộc tính bạn muốn `PannerNode` có:
    - `panningModel`
      - : {{domxref("PannerNode.panningModel")}} mà bạn muốn {{domxref("PannerNode")}} có (mặc định là `equalpower`).
    - `distanceModel`
      - : {{domxref("PannerNode.distanceModel")}} mà bạn muốn {{domxref("PannerNode")}} có (mặc định là `inverse`).
    - `positionX`
      - : {{domxref("PannerNode.positionX")}} mà bạn muốn {{domxref("PannerNode")}} có (mặc định là `0`).
    - `positionY`
      - : {{domxref("PannerNode.positionY")}} mà bạn muốn {{domxref("PannerNode")}} có (mặc định là `0`).
    - `positionZ`
      - : {{domxref("PannerNode.positionZ")}} mà bạn muốn {{domxref("PannerNode")}} có (mặc định là `0`).
    - `orientationX`
      - : {{domxref("PannerNode.orientationX")}} mà bạn muốn {{domxref("PannerNode")}} có (mặc định là `1`).
    - `orientationY`
      - : {{domxref("PannerNode.orientationY")}} mà bạn muốn {{domxref("PannerNode")}} có (mặc định là `0`).
    - `orientationZ`
      - : {{domxref("PannerNode.orientationZ")}} mà bạn muốn {{domxref("PannerNode")}} có (mặc định là `0`).
    - `refDistance`
      - : {{domxref("PannerNode.refDistance")}} mà bạn muốn {{domxref("PannerNode")}} có. Mặc định là `1`, và các giá trị âm không được phép.
    - `maxDistance`
      - : {{domxref("PannerNode.maxDistance")}} mà bạn muốn {{domxref("PannerNode")}} có. Mặc định là `10000`, và các giá trị không dương không được phép.
    - `rolloffFactor`
      - : {{domxref("PannerNode.rolloffFactor")}} mà bạn muốn {{domxref("PannerNode")}} có. Mặc định là `1`, và các giá trị âm không được phép.
    - `coneInnerAngle`
      - : {{domxref("PannerNode.coneInnerAngle")}} mà bạn muốn {{domxref("PannerNode")}} có (mặc định là `360`).
    - `coneOuterAngle`
      - : {{domxref("PannerNode.coneOuterAngle")}} mà bạn muốn {{domxref("PannerNode")}} có (mặc định là `360`).
    - `coneOuterGain`
      - : {{domxref("PannerNode.coneOuterGain")}} mà bạn muốn {{domxref("PannerNode")}} có. Mặc định là `0`, và giá trị có thể nằm trong khoảng 0–1.
    - `channelCount`
      - : Biểu diễn số nguyên được dùng để xác định số kênh được sử dụng khi [tăng số kênh và giảm số kênh](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối tới đầu vào của nút. (Xem {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.) Cách dùng và định nghĩa chính xác phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Biểu diễn giá trị liệt kê mô tả cách các kênh phải khớp giữa đầu vào và đầu ra của nút. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)
    - `channelInterpretation`
      - : Biểu diễn giá trị liệt kê mô tả ý nghĩa của các kênh. Cách diễn giải này sẽ xác định cách thức [tăng số kênh và giảm số kênh](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) xảy ra. Các giá trị có thể là `"speakers"` hoặc `"discrete"`. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu các thuộc tính `refDistance`, `maxDistance`, hoặc `rolloffFactor` được gán giá trị nằm ngoài phạm vi chấp nhận.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính `coneOuterGain` được gán giá trị nằm ngoài phạm vi chấp nhận (0–1).

## Ví dụ

```js
const ctx = new AudioContext();

const options = {
  positionX: 1,
  maxDistance: 5000,
};

const myPanner = new PannerNode(ctx, options);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
