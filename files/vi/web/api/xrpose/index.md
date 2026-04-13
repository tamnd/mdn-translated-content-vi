---
title: XRPose
slug: Web/API/XRPose
page-type: web-api-interface
browser-compat: api.XRPose
---

{{APIRef("WebXR Device API")}}{{securecontext_header}}

`XRPose` là giao diện của [WebXR API](/en-US/docs/Web/API/WebXR_Device_API) biểu diễn vị trí và hướng trong không gian 3D, tương đối với {{domxref("XRSpace")}} mà nó tồn tại trong đó. `XRSpace` (có thể là {{domxref("XRReferenceSpace")}} hoặc {{domxref("XRBoundedReferenceSpace")}}) xác định hệ tọa độ được sử dụng cho pose và, trong trường hợp của {{domxref("XRViewerPose")}}, các khung nhìn cơ sở của nó.

Để lấy `XRPose` cho `XRSpace` được sử dụng làm hệ tọa độ cục bộ của một đối tượng, hãy gọi {{domxref("XRFrame.getPose()")}}, chỉ định `XRSpace` cục bộ đó và không gian mà bạn muốn chuyển đổi sang:

```js
thePose = xrFrame.getPose(localSpace, baseSpace);
```

Pose của người xem (hoặc camera) được biểu diễn bằng lớp con {{domxref("XRViewerPose")}} của `XRPose`. Lớp này được lấy bằng cách sử dụng {{domxref("XRFrame.getViewerPose()")}} thay vì `getPose()`, chỉ định một không gian tham chiếu đã được điều chỉnh để định vị và định hướng nút nhằm cung cấp vị trí và góc nhìn mong muốn:

```js
viewerPose = xrFrame.getViewerPose(adjReferenceSpace);
```

Ở đây, `adjReferenceSpace` là không gian tham chiếu đã được cập nhật bằng khung tham chiếu cơ sở cho khung hình và các điều chỉnh cần thiết để định vị người xem dựa trên chuyển động hoặc xoay được cung cấp từ nguồn khác ngoài thiết bị XR, chẳng hạn như đầu vào từ bàn phím hoặc chuột.

Xem bài viết [Chuyển động, hướng và chuyển động](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion) để biết thêm chi tiết và ví dụ với giải thích đầy đủ.

## Thuộc tính phiên bản

- {{DOMxRef("XRPose.angularVelocity")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("DOMPointReadOnly")}} mô tả vận tốc góc tính bằng radian trên giây tương đối với {{DOMxRef("XRSpace")}} cơ sở.
- {{DOMxRef("XRPose.emulatedPosition")}} {{ReadOnlyInline}}
  - : Giá trị Boolean là `false` nếu vị trí và hướng được cung cấp bởi {{DOMxRef("XRPose.transform", "transform")}} được lấy trực tiếp từ thiết bị XR sáu bậc tự do (6DoF) hoàn chỉnh (tức là thiết bị theo dõi không chỉ pitch, yaw và roll của đầu mà còn cả chuyển động tiến, lùi và sang ngang của người xem). Nếu bất kỳ thành phần nào của `transform` được tính toán hoặc tạo ra nhân tạo (chẳng hạn bằng cách sử dụng điều khiển chuột hoặc bàn phím để di chuyển trong không gian), giá trị này là `true`.
- {{DOMxRef("XRPose.linearVelocity")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("DOMPointReadOnly")}} mô tả vận tốc tuyến tính tính bằng mét trên giây tương đối với {{DOMxRef("XRSpace")}} cơ sở.
- {{DOMxRef("XRPose.transform")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("XRRigidTransform")}} cung cấp vị trí và hướng của pose tương đối với {{DOMxRef("XRSpace")}} cơ sở.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- {{DOMxRef("XRFrame.getPose()")}}
- {{DOMxRef("XRViewerPose")}}
