---
title: "ConvolverNode: hàm tạo ConvolverNode()"
short-title: ConvolverNode()
slug: Web/API/ConvolverNode/ConvolverNode
page-type: web-api-constructor
browser-compat: api.ConvolverNode.ConvolverNode
---

{{APIRef("Web Audio API")}}

Hàm tạo **`ConvolverNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một thực thể đối tượng {{domxref("ConvolverNode")}} mới.

## Cú pháp

```js-nolint
new ConvolverNode(context, options)
```

### Tham số

- `context`
  - : Một tham chiếu tới {{domxref("AudioContext")}}.
- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `buffer`
      - : Một {{domxref("AudioBuffer")}} đơn âm, stereo hoặc 4 kênh chứa đáp ứng xung (có thể là đa kênh) mà `ConvolverNode` dùng để tạo hiệu ứng reverb.
    - `disableNormalization`
      - : Một giá trị boolean điều khiển việc đáp ứng xung từ bộ đệm có được scale bằng phép chuẩn hóa equal-power hay không. Mặc định là `false`.
    - `channelCount`
      - : Biểu diễn một số nguyên dùng để xác định có bao nhiêu kênh được dùng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối tới bất kỳ đầu vào nào của nút. (Xem {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.) Cách dùng và định nghĩa chính xác của nó phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Biểu diễn một giá trị liệt kê mô tả cách các kênh phải được khớp giữa đầu vào và đầu ra của nút. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin, bao gồm các giá trị mặc định.)
    - `channelInterpretation`
      - : Biểu diễn một giá trị liệt kê mô tả ý nghĩa của các kênh. Cách diễn giải này sẽ xác định cách việc [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) âm thanh diễn ra. Các giá trị có thể là `"speakers"` hoặc `"discrete"`. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin, bao gồm các giá trị mặc định.)

### Giá trị trả về

Một thực thể đối tượng {{domxref("ConvolverNode")}} mới.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("AudioBuffer")}} được tham chiếu không có đúng số lượng kênh, hoặc có tốc độ lấy mẫu khác với {{domxref("AudioContext")}} liên kết.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
