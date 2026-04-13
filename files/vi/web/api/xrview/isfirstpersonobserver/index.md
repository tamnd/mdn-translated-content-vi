---
title: "XRView: isFirstPersonObserver property"
short-title: isFirstPersonObserver
slug: Web/API/XRView/isFirstPersonObserver
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRView.isFirstPersonObserver
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`isFirstPersonObserver`** của giao diện {{domxref("XRView")}} là giá trị boolean cho biết `XRView` có phải là chế độ xem quan sát góc nhìn thứ nhất hay không.

Để tạo bản ghi video của camera thiết bị AR, bạn không thể chỉ đơn giản sử dụng một trong các mắt đã dựng, vì thường sẽ có độ lệch vật lý. Một số thiết bị cung cấp chế độ xem phụ, chế độ xem quan sát góc nhìn thứ nhất, có `eye` là `none`.

Để nhận chế độ xem quan sát góc nhìn thứ nhất, bạn cần bật rõ ràng bộ mô tả tính năng "secondary-views" (thường là tính năng tùy chọn). Xem {{domxref("XRSystem.requestSession()")}} để biết chi tiết.

Thuộc tính `isFirstPersonObserver` cho phép bạn kiểm tra chế độ xem phụ nào là chế độ xem quan sát góc nhìn thứ nhất.

## Ví dụ

### Kiểm tra chế độ xem quan sát góc nhìn thứ nhất

```js
// Make sure to enable "secondary-view"
navigator.xr
  .requestSession("immersive-ar", {
    optionalFeatures: ["secondary-views"],
  })
  .then((session) => {
    // …

    session.requestAnimationFrame((frame) => {
      const views = frame.getViewerPose(space);
      // Make sure to iterate over all views
      for (const view of views) {
        if (view.isFirstPersonObserver) {
          renderFPO();
        } else {
          render();
        }
      }
    });
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
