---
title: XRHitTestSource
slug: Web/API/XRHitTestSource
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRHitTestSource
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Giao diện **`XRHitTestSource`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) xử lý các đăng ký kiểm tra va chạm. Bạn có thể lấy đối tượng `XRHitTestSource` bằng cách sử dụng phương thức {{domxref("XRSession.requestHitTestSource()")}}.

Đối tượng này không tự chứa kết quả kiểm tra va chạm, nhưng được dùng để tính toán kiểm tra va chạm cho mỗi {{domxref("XRFrame")}} bằng cách gọi {{domxref("XRFrame.getHitTestResults()")}}, vốn trả về các đối tượng {{domxref("XRHitTestResult")}}.

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

- {{domxref("XRHitTestSource.cancel()")}} {{Experimental_Inline}}
  - : Hủy đăng ký kiểm tra va chạm.

## Ví dụ

### Lấy đối tượng `XRHitTestSource` cho một phiên

Gọi {{domxref("XRSession.requestHitTestSource()")}} để lấy nguồn kiểm tra va chạm.

```js
const xrSession = navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["local", "hit-test"],
});

let hitTestSource = null;

xrSession
  .requestHitTestSource({
    space: viewerSpace, // lấy từ xrSession.requestReferenceSpace("viewer");
    offsetRay: new XRRay({ y: 0.5 }),
  })
  .then((viewerHitTestSource) => {
    hitTestSource = viewerHitTestSource;
  });

// vòng lặp khung hình
function onXRFrame(time, xrFrame) {
  let hitTestResults = xrFrame.getHitTestResults(hitTestSource);

  // thực hiện các thao tác với kết quả kiểm tra va chạm
}
```

### Hủy đăng ký kiểm tra va chạm

Để hủy đăng ký khỏi một nguồn kiểm tra va chạm, gọi {{domxref("XRHitTestSource.cancel()")}}. Vì đối tượng sẽ không còn dùng được nữa, bạn có thể dọn dẹp và đặt đối tượng `XRHitTestSource` thành [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

```js
hitTestSource.cancel();
hitTestSource = null;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRTransientInputHitTestSource")}}
