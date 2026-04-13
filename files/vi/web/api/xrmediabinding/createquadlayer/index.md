---
title: "XRMediaBinding: createQuadLayer() method"
short-title: createQuadLayer()
slug: Web/API/XRMediaBinding/createQuadLayer
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRMediaBinding.createQuadLayer
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`createQuadLayer()`** của giao diện {{domxref("XRMediaBinding")}} trả về đối tượng {{domxref("XRQuadLayer")}}, là một lớp chiếm một không gian hình chữ nhật phẳng trong môi trường ảo.

## Cú pháp

```js-nolint
createQuadLayer(video, options)
```

### Tham số

- `video`
  - : Một {{domxref("HTMLVideoElement")}} để hiển thị.
- `options`
  - : Một đối tượng để cấu hình {{domxref("XRQuadLayer")}}. Đối tượng có thể có các thuộc tính sau và `space` là bắt buộc:
    - `height` {{optional_inline}}
      - : Một số chỉ định chiều cao của lớp.
    - `invertStereo` {{optional_inline}}
      - : Giá trị boolean chỉ định liệu vị trí tự nhiên của mỗi khung nhìn trong video có nên bị đảo ngược không. Mặc định là `false`.
    - `layout` {{optional_inline}}
      - : Chuỗi chỉ ra bố cục của video. Các giá trị có thể giống như trong `createCylinderLayer`. Giá trị mặc định là `mono`.
    - `space` **Bắt buộc**
      - : Một đối tượng {{domxref("XRSpace")}} xác định mối quan hệ không gian của lớp với môi trường vật lý của người dùng.
    - `transform` {{optional_inline}}
      - : Một đối tượng {{domxref("XRRigidTransform")}} xác định độ lệch và hướng tương đối với `space`.
    - `width` {{optional_inline}}
      - : Một số chỉ định chiều rộng của lớp.

### Giá trị trả về

Một đối tượng {{domxref("XRQuadLayer")}}.

## Ví dụ

### Tạo `XRQuadLayer` để hiển thị video

```js
function onXRSessionStarted(xrSession) {
  const xrMediaBinding = new XRMediaBinding(xrSession);
  const video = document.createElement("video");
  video.src = "just-fascination.mp4";

  const videoLayer = xrMediaBinding.createQuadLayer(video, {
    space: xrReferenceSpace,
  });

  xrSession.updateRenderState({
    layers: [videoLayer],
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRQuadLayer")}}
