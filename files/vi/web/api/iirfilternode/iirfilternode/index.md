---
title: "IIRFilterNode: IIRFilterNode() constructor"
short-title: IIRFilterNode()
slug: Web/API/IIRFilterNode/IIRFilterNode
page-type: web-api-constructor
browser-compat: api.IIRFilterNode.IIRFilterNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`IIRFilterNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một đối tượng {{domxref("IIRFilterNode")}} mới là bộ xử lý {{domxref("AudioNode")}} thực hiện bộ lọc infinite impulse response tổng quát.

## Cú pháp

```js-nolint
new IIRFilterNode(context, options)
```

### Tham số

- `context`
  - : Tham chiếu đến một {{domxref("AudioContext")}}.
- `options`
  - : Các tùy chọn như sau:
    - `feedforward`
      - : Một chuỗi các hệ số feedforward.
    - `feedback`
      - : Một chuỗi các hệ số feedback.
    - `channelCount`
      - : Đại diện cho một số nguyên được sử dụng để xác định có bao nhiêu kênh được sử dụng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) kết nối đến bất kỳ đầu vào nào của nút. (Xem {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.) Cách sử dụng và định nghĩa chính xác phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Đại diện cho một giá trị liệt kê mô tả cách các kênh phải được khớp giữa đầu vào và đầu ra của nút. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)
    - `channelInterpretation`
      - : Đại diện cho một giá trị liệt kê mô tả ý nghĩa của các kênh. Cách diễn giải này sẽ định nghĩa cách audio [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) sẽ xảy ra. Các giá trị có thể là `"speakers"` hoặc `"discrete"`. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)

Không giống như các nút khác trong Web Audio API, các tùy chọn được truyền vào bộ lọc IIR khi tạo không phải là tùy chọn. Bộ lọc cần các giá trị này để hoạt động và với phạm vi rộng của các bộ lọc có sẵn, không có giá trị mặc định.

### Giá trị trả về

Một phiên bản đối tượng {{domxref("IIRFilterNode")}} mới.

## Ví dụ

```js
let feedForward = [0.00020298, 0.0004059599, 0.00020298];
let feedBackward = [1.0126964558, -1.9991880801, 0.9873035442];

const audioCtx = new AudioContext();

const iirFilter = new IIRFilterNode(audioCtx, {
  feedforward: feedForward,
  feedback: feedBackward,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
