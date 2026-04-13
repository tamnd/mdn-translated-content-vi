---
title: "XRPose: transform property"
short-title: transform
slug: Web/API/XRPose/transform
page-type: web-api-instance-property
browser-compat: api.XRPose.transform
---

{{APIRef("WebXR Device API")}}{{SecureContext_header}}

Thuộc tính chỉ đọc `transform` của giao diện {{DOMxRef("XRPose")}} là một đối tượng {{DOMxRef("XRRigidTransform")}} cung cấp vị trí và hướng của pose tương đối với {{DOMxRef("XRSpace")}} cơ sở được chỉ định khi pose được lấy bằng cách gọi {{domxref("XRFrame.getPose()")}}.

## Giá trị

Một {{domxref("XRRigidTransform")}} cung cấp vị trí và hướng của {{domxref("XRPose")}} tương đối với {{domxref("XRFrame")}} mà `XRPose` này được căn chỉnh theo. Đây là cùng pose được trả về bởi phương thức {{domxref("XRFrame.getPose", "getPose()")}} của khung hình.

## Ví dụ

Bộ xử lý cho sự kiện {{domxref("XRSession")}} {{domxref("XRSession.select_event", "select")}} này xử lý các sự kiện cho con trỏ được theo dõi. Nó xác định đối tượng mục tiêu bằng cách truyền pose của khung sự kiện vào hàm `findTargetUsingRay()`, sau đó điều phối sự kiện khác nhau tùy thuộc vào tay thuận của người dùng.

```js
xrSession.addEventListener("select", (event) => {
  let source = event.inputSource;
  let frame = event.frame;
  let targetRayPose = frame.getPose(source.targetRaySpace, myRefSpace);
  let targetObject = findTargetUsingRay(targetRay.transform.matrix);

  if (source.targetRayMode === "tracked-pointer") {
    if (source.handedness === user.handedness) {
      targetObject.primaryAction();
    } else {
      targetObject.offHandAction();
    }
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
