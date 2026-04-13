---
title: "XRMediaBinding: createEquirectLayer() method"
short-title: createEquirectLayer()
slug: Web/API/XRMediaBinding/createEquirectLayer
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRMediaBinding.createEquirectLayer
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`createEquirectLayer()`** của giao diện {{domxref("XRMediaBinding")}} trả về đối tượng {{domxref("XREquirectLayer")}}, là một lớp ánh xạ dữ liệu mã hóa hình cầu đều lên bên trong một hình cầu.

## Cú pháp

```js-nolint
createEquirectLayer(video, options)
```

### Tham số

- `video`
  - : Một {{domxref("HTMLVideoElement")}} để hiển thị.
- `options`
  - : Một đối tượng để cấu hình {{domxref("XREquirectLayer")}}. Đối tượng có thể có các thuộc tính sau và `space` là bắt buộc:
    - `centralHorizontalAngle` {{optional_inline}}
      - : Một số chỉ ra góc ngang trung tâm tính bằng radian cho hình cầu. Giá trị mặc định: `6.28318` (2π).
    - `invertStereo` {{optional_inline}}
      - : Giá trị boolean chỉ định liệu vị trí tự nhiên của mỗi khung nhìn trong video có nên bị đảo ngược không. Mặc định là `false`.
    - `layout` {{optional_inline}}
      - : Chuỗi chỉ ra bố cục của video. Các giá trị có thể giống như trong `createCylinderLayer`. Giá trị mặc định là `mono`.
    - `lowerVerticalAngle` {{optional_inline}}
      - : Một số chỉ ra góc dọc thấp hơn tính bằng radian cho hình cầu. Giá trị mặc định: `-1.570795` (-π/2).
    - `radius` {{optional_inline}}
      - : Một số chỉ ra bán kính của hình cầu. Giá trị mặc định `0.0`.
    - `space` **Bắt buộc**
      - : Một đối tượng {{domxref("XRSpace")}} xác định mối quan hệ không gian của lớp với môi trường vật lý của người dùng.
    - `transform` {{optional_inline}}
      - : Một đối tượng {{domxref("XRRigidTransform")}} xác định độ lệch và hướng tương đối với `space`.
    - `upperVerticalAngle` {{optional_inline}}
      - : Một số chỉ ra góc dọc cao hơn tính bằng radian cho hình cầu. Giá trị mặc định: `1.570795` (π/2).

### Giá trị trả về

Một đối tượng {{domxref("XREquirectLayer")}}.

## Ví dụ

### Tạo `XREquirectLayer` để hiển thị video

```js
function onXRSessionStarted(xrSession) {
  const xrMediaBinding = new XRMediaBinding(xrSession);
  const video = document.createElement("video");
  video.src = "just-fascination.mp4";

  const videoLayer = xrMediaBinding.createEquirectLayer(video, {
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

- {{domxref("XREquirectLayer")}}
