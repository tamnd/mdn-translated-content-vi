---
title: "AudioListener: phương thức setOrientation()"
short-title: setOrientation()
slug: Web/API/AudioListener/setOrientation
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.AudioListener.setOrientation
---

{{ APIRef("Web Audio API") }}{{deprecated_header}}

Phương thức `setOrientation()` của giao diện {{ domxref("AudioListener") }} xác định hướng của listener.

Nó bao gồm hai vector hướng:

- _Vector trước_, được xác định bởi ba tham số không có đơn vị `x`, `y` và `z`, mô tả hướng khuôn mặt của listener, tức là hướng mà mũi của người đó đang chỉ tới. Giá trị mặc định của vector trước là `(0, 0, -1)`.
- _Vector lên_, được xác định bởi ba tham số không có đơn vị `xUp`, `yUp` và `zUp`, mô tả hướng của đỉnh đầu listener. Giá trị mặc định của vector lên là `(0, 1, 0)`.

Hai vector này phải cách nhau một góc 90°; theo thuật ngữ đại số tuyến tính, chúng phải vuông góc với nhau.

## Cú pháp

```js-nolint
setOrientation(x, y, z, xUp, yUp, zUp)
```

### Tham số

- `x`
  - : Giá trị x của vector trước của listener.
- `y`
  - : Giá trị y của vector trước của listener.
- `z`
  - : Giá trị z của vector trước của listener.
- `xUp`
  - : Giá trị x của vector lên của listener.
- `yUp`
  - : Giá trị y của vector lên của listener.
- `zUp`
  - : Giá trị z của vector lên của listener.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Xem [`BaseAudioContext.createPanner()`](/en-US/docs/Web/API/BaseAudioContext/createPanner#examples) để có mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
