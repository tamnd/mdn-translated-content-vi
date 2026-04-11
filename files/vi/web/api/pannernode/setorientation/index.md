---
title: "PannerNode: setOrientation() method"
short-title: setOrientation()
slug: Web/API/PannerNode/setOrientation
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.PannerNode.setOrientation
---

{{APIRef("Web Audio API")}}{{Deprecated_Header}}

> [!NOTE]
> Phương thức thay thế được đề xuất cho phương thức đã lỗi thời này là đặt trực tiếp các thuộc tính [`orientationX`](/en-US/docs/Web/API/PannerNode/orientationX), [`orientationY`](/en-US/docs/Web/API/PannerNode/orientationY), và [`orientationZ`](/en-US/docs/Web/API/PannerNode/orientationZ).

Phương thức `setOrientation()` của giao diện {{ domxref("PannerNode") }} xác định hướng phát của nguồn âm thanh.

Điều này có thể có tác động lớn nếu âm thanh có tính định hướng cao, được kiểm soát bởi ba thuộc tính liên quan đến hình nón là {{domxref("PannerNode.coneInnerAngle")}}, {{domxref("PannerNode.coneOuterAngle")}}, và {{domxref("PannerNode.coneOuterGain")}}. Trong trường hợp đó, âm thanh hướng ra xa người nghe có thể rất nhỏ hoặc thậm chí hoàn toàn im lặng.

Ba tham số `x`, `y` và `z` không có đơn vị và mô tả một vectơ hướng trong không gian 3D bằng cách sử dụng hệ tọa độ Descartes tay phải. Giá trị mặc định của vectơ hướng là `(1, 0, 0)`.

## Cú pháp

```js-nolint
setOrientation(x, y, z)
```

### Tham số

- `x`
  - : Giá trị x của vectơ hướng của panner trong không gian 3D.
- `y`
  - : Giá trị y của vectơ hướng của panner trong không gian 3D.
- `z`
  - : Giá trị z của vectơ hướng của panner trong không gian 3D.

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
