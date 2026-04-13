---
title: "MediaStreamAudioDestinationNode: hàm khởi tạo MediaStreamAudioDestinationNode()"
short-title: MediaStreamAudioDestinationNode()
slug: Web/API/MediaStreamAudioDestinationNode/MediaStreamAudioDestinationNode
page-type: web-api-constructor
browser-compat: api.MediaStreamAudioDestinationNode.MediaStreamAudioDestinationNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`MediaStreamAudioDestinationNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo phiên bản đối tượng {{domxref("MediaStreamAudioDestinationNode")}} mới.

## Cú pháp

```js-nolint
new MediaStreamAudioDestinationNode(context)
new MediaStreamAudioDestinationNode(context, options)
```

### Tham số

- `context`
  - : Một {{domxref("AudioContext")}} đại diện cho ngữ cảnh âm thanh mà bạn muốn liên kết nút với đó.
- `options` {{optional_inline}}
  - : Đối tượng định nghĩa các thuộc tính mà bạn muốn `MediaStreamAudioDestinationNode` có:
    - `channelCount`
      - : Số nguyên dùng để xác định số kênh được sử dụng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) kết nối đến bất kỳ đầu vào nào của nút. (Xem {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.) Cách dùng và định nghĩa chính xác phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Chuỗi mô tả cách các kênh phải khớp giữa đầu vào và đầu ra của nút. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)
    - `channelInterpretation`
      - : Chuỗi mô tả ý nghĩa của các kênh. Cách giải thích này sẽ xác định cách [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) âm thanh sẽ xảy ra. Các giá trị có thể là `"speakers"` hoặc `"discrete"`. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)

## Ví dụ

```js
const ac = new AudioContext();

const myDestination = new MediaStreamAudioDestinationNode(ac);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
