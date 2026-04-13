---
title: "PannerNode: setPosition() method"
short-title: setPosition()
slug: Web/API/PannerNode/setPosition
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.PannerNode.setPosition
---

{{APIRef("Web Audio API")}}{{Deprecated_Header}}

> [!NOTE]
> Phương thức thay thế được đề xuất cho phương thức đã lỗi thời này là đặt trực tiếp các thuộc tính [`positionX`](/en-US/docs/Web/API/PannerNode/positionX), [`positionY`](/en-US/docs/Web/API/PannerNode/positionY), và [`positionZ`](/en-US/docs/Web/API/PannerNode/positionZ).

Phương thức `setPosition()` của giao diện {{ domxref("PannerNode") }} xác định vị trí của nguồn âm thanh tương đối với người nghe (được biểu diễn bởi đối tượng {{domxref("AudioListener")}} được lưu trong thuộc tính {{domxref("BaseAudioContext.listener")}}). Ba tham số `x`, `y` và `z` không có đơn vị và mô tả vị trí của nguồn trong không gian 3D bằng cách sử dụng hệ tọa độ Descartes tay phải.

Giá trị mặc định của vị trí trong phương thức `setPosition()` là `(0, 0, 0)`.

## Cú pháp

```js-nolint
setPosition(x, y, z)
```

### Tham số

- `x`
  - : Vị trí x của panner trong không gian 3D.
- `y`
  - : Vị trí y của panner trong không gian 3D.
- `z`
  - : Vị trí z của panner trong không gian 3D.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Xem [`BaseAudioContext.createPanner()`](/en-US/docs/Web/API/BaseAudioContext/createPanner#examples) để có mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
