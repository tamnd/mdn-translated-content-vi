---
title: XRTransientInputHitTestSource
slug: Web/API/XRTransientInputHitTestSource
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRTransientInputHitTestSource
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRTransientInputHitTestSource`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) xử lý các đăng ký kiểm tra va chạm đầu vào thoáng qua. Bạn có thể lấy đối tượng `XRTransientInputHitTestSource` bằng cách gọi {{domxref("XRSession.requestHitTestSourceForTransientInput()")}}.

Đối tượng này không tự chứa kết quả kiểm tra va chạm đầu vào thoáng qua, nhưng được dùng để tính toán kiểm tra va chạm cho mỗi {{domxref("XRFrame")}} bằng cách gọi {{domxref("XRFrame.getHitTestResultsForTransientInput()")}}, vốn trả về các đối tượng {{domxref("XRTransientInputHitTestResult")}}.

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

- {{domxref("XRTransientInputHitTestSource.cancel()")}} {{Experimental_Inline}}
  - : Hủy đăng ký kiểm tra va chạm đầu vào thoáng qua.

## Ví dụ

### Lấy đối tượng `XRTransientInputHitTestSource` cho một phiên

Sử dụng phương thức {{domxref("XRSession.requestHitTestSourceForTransientInput()")}} để lấy nguồn kiểm tra va chạm đầu vào thoáng qua.

```js
const xrSession = navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["local", "hit-test"],
});

let transientHitTestSource = null;

xrSession
  .requestHitTestSourceForTransientInput({
    profile: "generic-touchscreen",
    offsetRay: new XRRay(),
  })
  .then((touchScreenHitTestSource) => {
    transientHitTestSource = touchScreenHitTestSource;
  });

// vòng lặp khung hình
function onXRFrame(time, xrFrame) {
  let hitTestResults = xrFrame.getHitTestResultsForTransientInput(
    transientHitTestSource,
  );

  // thực hiện các thao tác với kết quả kiểm tra va chạm thoáng qua
}
```

### Hủy đăng ký kiểm tra va chạm đầu vào thoáng qua

Để hủy đăng ký khỏi một nguồn kiểm tra va chạm đầu vào thoáng qua, sử dụng phương thức {{domxref("XRTransientInputHitTestSource.cancel()")}}. Vì đối tượng sẽ không còn dùng được nữa, bạn có thể dọn dẹp và đặt đối tượng `XRTransientInputHitTestSource` thành [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

```js
transientHitTestSource.cancel();
transientHitTestSource = null;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRTransientInputHitTestResult")}}
