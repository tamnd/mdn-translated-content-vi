---
title: "XRSession: phương thức requestHitTestSource()"
short-title: requestHitTestSource()
slug: Web/API/XRSession/requestHitTestSource
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRSession.requestHitTestSource
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`requestHitTestSource()`** của giao diện {{domxref("XRSession")}} trả về một {{jsxref("Promise")}} resolve với một đối tượng {{domxref("XRHitTestSource")}} có thể được truyền cho {{domxref("XRFrame.getHitTestResults()")}}.

## Cú pháp

```js-nolint
requestHitTestSource(options)
```

### Tham số

- `options`
  - : Một đối tượng chứa các tùy chọn cấu hình, cụ thể:
    - `space`
      - : {{domxref("XRSpace")}} sẽ được theo dõi bởi nguồn kiểm tra va chạm.
    - `entityTypes` {{Optional_Inline}}
      - : Một {{jsxref("Array")}} chỉ định các loại thực thể được sử dụng để tạo nguồn kiểm tra va chạm. Nếu không có loại thực thể nào được chỉ định, mảng mặc định là một phần tử duy nhất với loại `plane`. Các loại có thể:
        - `point`: Tính toán kết quả kiểm tra va chạm dựa trên các điểm đặc trưng được phát hiện.
        - `plane`: Tính toán kết quả kiểm tra va chạm dựa trên các mặt phẳng thực tế được phát hiện.
        - `mesh`: Tính toán kết quả kiểm tra va chạm dựa trên các lưới được phát hiện.
    - `offsetRay` {{Optional_Inline}}
      - : Đối tượng {{domxref("XRRay")}} sẽ được sử dụng để thực hiện kiểm tra va chạm. Nếu không có đối tượng `XRRay` nào được cung cấp, một đối tượng `XRRay` mới được xây dựng mà không có tham số nào.

### Giá trị trả về

Một {{jsxref("Promise")}} resolve với một đối tượng {{domxref("XRHitTestSource")}}.

### Ngoại lệ

Thay vì ném ngoại lệ thực sự, `requestHitTestSource()` từ chối promise được trả về với một {{domxref("DOMException")}}, cụ thể là một trong các ngoại lệ sau:

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném nếu `hit-test` không phải là tính năng đã bật trong {{domxref("XRSystem.requestSession()")}}.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu phiên đã kết thúc.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu có số lượng yêu cầu không hợp lý. Một số tác nhân người dùng có thể giới hạn sử dụng vì lý do bảo mật.

## Ví dụ

### Yêu cầu một nguồn kiểm tra va chạm

Để yêu cầu một nguồn kiểm tra va chạm, hãy bắt đầu một {{domxref("XRSession")}} với tính năng phiên `hit-test` đã bật. Tiếp theo, cấu hình nguồn kiểm tra va chạm và lưu trữ nó để sử dụng sau trong vòng lặp khung hình và gọi {{domxref("XRFrame.getHitTestResults()")}} để lấy kết quả.

```js
const xrSession = navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["local", "hit-test"],
});

let hitTestSource = null;

xrSession
  .requestHitTestSource({
    space: viewerSpace, // obtained from xrSession.requestReferenceSpace("viewer");
    offsetRay: new XRRay({ y: 0.5 }),
  })
  .then((viewerHitTestSource) => {
    hitTestSource = viewerHitTestSource;
  });

// frame loop
function onXRFrame(time, xrFrame) {
  let hitTestResults = xrFrame.getHitTestResults(hitTestSource);

  // do things with the hit test results
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSession.requestHitTestSourceForTransientInput()")}}
