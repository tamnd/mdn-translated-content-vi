---
title: "GainNode: GainNode() constructor"
short-title: GainNode()
slug: Web/API/GainNode/GainNode
page-type: web-api-constructor
browser-compat: api.GainNode.GainNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`GainNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo đối tượng {{domxref("GainNode")}} mới là {{domxref("AudioNode")}} đại diện cho sự thay đổi âm lượng.

## Cú pháp

```js-nolint
new GainNode(context, options)
```

### Tham số

- `context`
  - : Tham chiếu đến {{domxref("BaseAudioContext")}}, ví dụ {{domxref("AudioContext")}}.
- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `gain`
      - : Lượng gain cần áp dụng. Tham số này là `a-rate` và phạm vi danh nghĩa của nó là (-∞,+∞). Mặc định là `1`.
    - `channelCount`
      - : Đại diện cho số nguyên được sử dụng để xác định số kênh được sử dụng khi [trộn lên và trộn xuống](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối đến bất kỳ đầu vào nào của nút. (Xem {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.) Cách sử dụng và định nghĩa chính xác của nó phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Đại diện cho giá trị được liệt kê mô tả cách các kênh phải khớp giữa các đầu vào và đầu ra của nút. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)
    - `channelInterpretation`
      - : Đại diện cho giá trị được liệt kê mô tả ý nghĩa của các kênh. Diễn giải này sẽ xác định cách âm thanh [trộn lên và trộn xuống](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) sẽ xảy ra. Các giá trị có thể là `"speakers"` hoặc `"discrete"`. (Xem {{domxref("AudioNode.channelInterpretation")}} để biết thêm thông tin bao gồm các giá trị mặc định.)

### Giá trị trả về

Phiên bản đối tượng {{domxref("GainNode")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
