---
title: "DynamicsCompressorNode: hàm khởi tạo DynamicsCompressorNode()"
short-title: DynamicsCompressorNode()
slug: Web/API/DynamicsCompressorNode/DynamicsCompressorNode
page-type: web-api-constructor
browser-compat: api.DynamicsCompressorNode.DynamicsCompressorNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`DynamicsCompressorNode()`** tạo một đối tượng {{domxref("DynamicsCompressorNode")}} mới cung cấp hiệu ứng nén âm thanh, giúp hạ âm lượng của các phần tín hiệu to nhất nhằm ngăn chặn hiện tượng clipping và méo tiếng có thể xảy ra khi nhiều âm thanh được phát và ghép lại cùng một lúc.

## Cú pháp

```js-nolint
new DynamicsCompressorNode(context, options)
```

### Tham số

- `context`
  - : Một tham chiếu đến {{domxref("AudioContext")}}.
- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `attack`
      - : Lượng thời gian (tính bằng giây) để giảm gain xuống 10dB. Giá trị mặc định là 0.003. Tham số này là k-rate. Phạm vi danh nghĩa là \[0, 1].
    - `knee`
      - : Một giá trị decibel đại diện cho phạm vi trên ngưỡng mà đường cong chuyển tiếp mượt mà sang phần "ratio". Giá trị mặc định là 30. Tham số này là k-rate. Phạm vi danh nghĩa là \[0, 40].
    - `ratio`
      - : Lượng thay đổi dB ở đầu vào cho mỗi thay đổi 1 dB ở đầu ra. Giá trị mặc định là 12. Tham số này là k-rate. Phạm vi danh nghĩa là \[1, 20].
    - `release`
      - : Lượng thời gian (tính bằng giây) để tăng gain lên 10dB. Giá trị mặc định là 0.250. Tham số này là k-rate. Phạm vi danh nghĩa là \[0, 1].
    - `threshold`
      - : Giá trị decibel mà trên đó quá trình nén sẽ bắt đầu có hiệu lực. Giá trị mặc định là -24. Tham số này là k-rate. Phạm vi danh nghĩa là \[-100, 0].

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
