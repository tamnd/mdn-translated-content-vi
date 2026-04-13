---
title: "XRSession: phương thức requestLightProbe()"
short-title: requestLightProbe()
slug: Web/API/XRSession/requestLightProbe
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRSession.requestLightProbe
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`requestLightProbe()`** của giao diện {{domxref("XRSession")}} trả về một {{jsxref("Promise")}} resolve với một đối tượng {{domxref("XRLightProbe")}} ước tính thông tin ánh sáng tại một điểm nhất định trong môi trường của người dùng.

## Cú pháp

```js-nolint
requestLightProbe()
requestLightProbe(options)
```

### Tham số

- `options` {{Optional_Inline}}
  - : Một đối tượng chứa các tùy chọn cấu hình, cụ thể:
    - `reflectionFormat`
      - : Định dạng phản chiếu nội bộ cho biết cách dữ liệu texture được biểu diễn, `srgba8` (giá trị mặc định) hoặc `rgba16f`. Xem thêm {{domxref("XRSession.preferredReflectionFormat")}}.

### Giá trị trả về

Một {{jsxref("Promise")}} resolve với một đối tượng {{domxref("XRLightProbe")}}.

### Ngoại lệ

Thay vì ném ngoại lệ thực sự, `requestLightProbe()` từ chối promise được trả về với một {{domxref("DOMException")}}, cụ thể là một trong các ngoại lệ sau:

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném nếu `lighting-estimation` không phải là tính năng đã bật trong {{domxref("XRSystem.requestSession()")}} hoặc nếu `reflectionFormat` không phải là `srgb8` hoặc `preferredReflectionFormat`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu phiên đã kết thúc.

## Ví dụ

### Yêu cầu một light probe với định dạng ưa thích của hệ thống

Định dạng mặc định là `srgb8`, tuy nhiên, một số công cụ kết xuất có thể sử dụng các định dạng khác (dynamic range cao). Bạn có thể yêu cầu light probe bằng {{domxref("XRSession.preferredReflectionFormat")}} để báo cáo định dạng nội bộ ưa thích.

```js
const lightProbe = await xrSession.requestLightProbe({
  reflectionFormat: xrSession.preferredReflectionFormat,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSession.preferredReflectionFormat")}}
