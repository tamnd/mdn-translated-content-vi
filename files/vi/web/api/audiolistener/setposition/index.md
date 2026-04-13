---
title: "AudioListener: phương thức setPosition()"
short-title: setPosition()
slug: Web/API/AudioListener/setPosition
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.AudioListener.setPosition
---

{{ APIRef("Web Audio API") }} {{deprecated_header}}

Phương thức `setPosition()` của giao diện {{ domxref("AudioListener") }} xác định vị trí của listener.

Ba tham số `x`, `y` và `z` không có đơn vị và mô tả vị trí của listener trong không gian 3D theo hệ tọa độ Descartes tay phải. Các đối tượng {{domxref("PannerNode")}} dùng vị trí này tương đối với từng nguồn âm thanh để thực hiện âm thanh không gian.

Giá trị mặc định của vector vị trí là `(0, 0, 0)`.

> [!NOTE]
> Vì phương thức này đã bị phản đối sử dụng, hãy dùng ba thuộc tính {{domxref("AudioListener.positionX", "positionX")}}, {{domxref("AudioListener.positionY", "positionY")}} và {{domxref("AudioListener.positionZ", "positionZ")}} để thay thế.

## Cú pháp

```js-nolint
setPosition(x, y, z)
```

### Tham số

- `x`
  - : Vị trí x của listener trong không gian 3D.
- `y`
  - : Vị trí y của listener trong không gian 3D.
- `z`
  - : Vị trí z của listener trong không gian 3D.

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
