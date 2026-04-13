---
title: "WaveShaperNode: hàm khởi tạo WaveShaperNode()"
short-title: WaveShaperNode()
slug: Web/API/WaveShaperNode/WaveShaperNode
page-type: web-api-constructor
browser-compat: api.WaveShaperNode.WaveShaperNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`WaveShaperNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một đối tượng {{domxref("WaveShaperNode")}} mới là {{domxref("AudioNode")}} đại diện cho bộ méo phi tuyến tính.

## Cú pháp

```js-nolint
new WaveShaperNode(context, options)
```

### Tham số

- `context`
  - : Tham chiếu đến một {{domxref("AudioContext")}}.
- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `curve`
      - : Đường cong hình dạng được sử dụng cho hiệu ứng waveshaping. Tín hiệu đầu vào thường nằm trong khoảng \[-1;1].
    - `oversample`
      - : Chỉ định loại oversampling (nếu có) cần sử dụng khi áp dụng đường cong hình dạng. Các giá trị hợp lệ là `"none"`, `"2x"`, hoặc `"4x"`. Mặc định là `"none"`.
    - `channelCount`
      - : Đại diện cho số nguyên được sử dụng để xác định số kênh được sử dụng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối với bất kỳ đầu vào nào của nút.
    - `channelCountMode`
      - : Đại diện cho giá trị liệt kê mô tả cách các kênh phải khớp giữa đầu vào và đầu ra của nút.
    - `channelInterpretation`
      - : Đại diện cho giá trị liệt kê mô tả ý nghĩa của các kênh. Các giá trị có thể là `"speakers"` hoặc `"discrete"`.

### Giá trị trả về

Một phiên bản đối tượng {{domxref("WaveShaperNode")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
