---
title: "XRFrame: phương thức getViewerPose()"
short-title: getViewerPose()
slug: Web/API/XRFrame/getViewerPose
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRFrame.getViewerPose
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getViewerPose()`**, thành viên của giao diện {{domxref("XRFrame")}}, trả về một đối tượng {{domxref("XRViewerPose")}} mô tả tư thế (vị trí và hướng) của người xem tương đối với không gian tham chiếu được chỉ định.

Xem phương thức {{domxref("XRFrame.getPose", "getPose()")}} để tính toán tư thế đại diện cho sự khác biệt giữa hai không gian.

## Cú pháp

```js-nolint
getViewerPose(referenceSpace)
```

### Tham số

- `referenceSpace`
  - : Một đối tượng {{domxref("XRReferenceSpace")}} chỉ định không gian được dùng làm điểm tham chiếu hoặc cơ sở để tính toán tư thế hiện tại của người xem.

### Giá trị trả về

Một {{domxref("XRViewerPose")}} mô tả vị trí và hướng của người xem tương đối với không gian tham chiếu được chỉ định.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu `getViewerPose()` không được gọi trong ngữ cảnh của callback của {{domxref("XRSession.requestAnimationFrame", "XRSession.requestAnimationFrame()")}}.

## Ví dụ

Trong hàm callback này cho {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}}, {{domxref("XRViewerPose")}} mô tả góc nhìn của người xem về thế giới được lấy bằng cách gọi `getViewerPose()` trên {{domxref("XRFrame")}} được truyền vào callback.

```js
viewerPose = xrFrame.getViewerPose(xrReferenceSpace);

if (viewerPose) {
  /* render the pose's views */
}
```

Để xem ví dụ đầy đủ, hãy xem [Chuyển động, hướng và di chuyển](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
