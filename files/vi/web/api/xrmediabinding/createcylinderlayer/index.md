---
title: "XRMediaBinding: createCylinderLayer() method"
short-title: createCylinderLayer()
slug: Web/API/XRMediaBinding/createCylinderLayer
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRMediaBinding.createCylinderLayer
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`createCylinderLayer()`** của giao diện {{domxref("XRMediaBinding")}} trả về đối tượng {{domxref("XRCylinderLayer")}}, là một lớp chiếm một không gian hình chữ nhật cong trong môi trường ảo.

## Cú pháp

```js-nolint
createCylinderLayer(video, options)
```

### Tham số

- `video`
  - : Một {{domxref("HTMLVideoElement")}} để hiển thị.
- `options`
  - : Một đối tượng để cấu hình {{domxref("XRCylinderLayer")}}. Đối tượng có thể có các thuộc tính sau và `space` là bắt buộc:
    - `aspectRatio` {{optional_inline}}
      - : Một số chỉ ra tỷ lệ của phần hình trụ có thể nhìn thấy. Đây là tỷ lệ chiều rộng của phần có thể nhìn thấy của hình trụ chia cho chiều cao của nó. Chiều rộng được tính bằng cách nhân `radius` với `centralAngle`.
    - `centralAngle` {{optional_inline}}
      - : Một số chỉ ra góc tính bằng radian của phần hình trụ có thể nhìn thấy. Giá trị mặc định: `0.78539` (π / 4).
    - `invertStereo` {{optional_inline}}
      - : Giá trị boolean chỉ định liệu vị trí tự nhiên của mỗi khung nhìn trong video có nên bị đảo ngược không. Mặc định là `false`.
    - `layout` {{optional_inline}}
      - : Chuỗi chỉ ra bố cục của video. Các giá trị có thể:
        - `default`
          - : Lớp hỗ trợ tất cả các khung nhìn của phiên.
        - `mono`
          - : Một {{domxref("XRSubImage")}} được phân bổ và trình bày cho cả hai mắt.
        - `stereo`
          - : Tác nhân người dùng quyết định cách phân bổ {{domxref("XRSubImage")}} (một hoặc hai) và bố cục (trên/dưới hoặc trái/phải). Nên sử dụng loại kết cấu `texture-array` cho bố cục `stereo`.
        - `stereo-left-right`
          - : Một {{domxref("XRSubImage")}} được phân bổ. Mắt trái nhận vùng trái của kết cấu, mắt phải nhận vùng phải. Bố cục này được thiết kế để giảm thiểu các lần vẽ cho nội dung đã ở dạng stereo.
        - `stereo-top-bottom`
          - : Một {{domxref("XRSubImage")}} được phân bổ. Mắt trái nhận vùng trên của kết cấu, mắt phải nhận vùng dưới. Bố cục này được thiết kế để giảm thiểu các lần vẽ cho nội dung đã ở dạng stereo.
            Giá trị mặc định là `mono`.
    - `radius` {{optional_inline}}
      - : Một số chỉ ra bán kính của hình trụ. Giá trị mặc định `2.0`.
    - `space` **Bắt buộc**
      - : Một đối tượng {{domxref("XRSpace")}} xác định mối quan hệ không gian của lớp với môi trường vật lý của người dùng.
    - `transform` {{optional_inline}}
      - : Một đối tượng {{domxref("XRRigidTransform")}} xác định độ lệch và hướng tương đối với `space`.

### Giá trị trả về

Một đối tượng {{domxref("XRCylinderLayer")}}.

## Ví dụ

### Tạo `XRCylinderLayer` để hiển thị video

Tạo {{domxref("XRMediaBinding")}} và sử dụng {{domxref("HTMLVideoElement")}} được truyền vào `createCylinderLayer()`. Cấu hình lớp quad bằng cách sử dụng các tùy chọn liệt kê ở trên và trình bày lớp cho thiết bị XR bằng cách thêm nó vào trạng thái kết xuất `layers` trong {{domxref("XRSession.updateRenderState()")}}.

```js
function onXRSessionStarted(xrSession) {
  const xrMediaBinding = new XRMediaBinding(xrSession);
  const video = document.createElement("video");
  video.src = "just-fascination.mp4";

  const videoLayer = xrMediaBinding.createCylinderLayer(video, {
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

- {{domxref("XRCylinderLayer")}}
