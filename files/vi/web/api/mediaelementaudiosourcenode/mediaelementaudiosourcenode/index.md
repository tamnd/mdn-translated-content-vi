---
title: "MediaElementAudioSourceNode: hàm khởi tạo MediaElementAudioSourceNode()"
short-title: MediaElementAudioSourceNode()
slug: Web/API/MediaElementAudioSourceNode/MediaElementAudioSourceNode
page-type: web-api-constructor
browser-compat: api.MediaElementAudioSourceNode.MediaElementAudioSourceNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`MediaElementAudioSourceNode()`** tạo một phiên bản đối tượng {{domxref("MediaElementAudioSourceNode")}} mới.

## Cú pháp

```js-nolint
new MediaElementAudioSourceNode(context, options)
```

### Tham số

- `context`
  - : Một {{domxref("AudioContext")}} đại diện cho ngữ cảnh âm thanh bạn muốn liên kết nút với.
- `options`
  - : Một đối tượng định nghĩa các thuộc tính bạn muốn `MediaElementAudioSourceNode` có:
    - `mediaElement`
      - : Một {{domxref("HTMLMediaElement")}} sẽ được sử dụng làm nguồn âm thanh.
    - `channelCount`
      - : Số nguyên dùng để xác định số kênh được sử dụng khi [trộn lên và trộn xuống](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) kết nối tới bất kỳ đầu vào nào của nút. (Xem {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.) Cách sử dụng và định nghĩa chính xác phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Chuỗi mô tả cách các kênh phải được khớp giữa đầu vào và đầu ra của nút. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm giá trị mặc định.)
    - `channelInterpretation`
      - : Chuỗi mô tả ý nghĩa của các kênh. Cách diễn giải này sẽ xác định cách [trộn lên và trộn xuống](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) âm thanh sẽ xảy ra. Các giá trị có thể là `"speakers"` hoặc `"discrete"`. (Xem {{domxref("AudioNode.channelInterpretation")}} để biết thêm thông tin bao gồm giá trị mặc định.)

### Giá trị trả về

Một phiên bản đối tượng {{domxref("MediaElementAudioSourceNode")}} mới.

## Ví dụ

```js
const ac = new AudioContext();
const mediaElement = document.createElement("audio");

const myAudioSource = new MediaElementAudioSourceNode(ac, {
  mediaElement,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
