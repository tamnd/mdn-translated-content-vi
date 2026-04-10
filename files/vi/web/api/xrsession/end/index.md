---
title: "XRSession: phương thức end()"
short-title: end()
slug: Web/API/XRSession/end
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRSession.end
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`end()`** tắt {{domxref("XRSession")}} mà nó được gọi trên đó, trả về một promise sẽ resolve sau khi phiên đã tắt hoàn toàn.

## Cú pháp

```js-nolint
end()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("promise")}} resolve mà không có giá trị sau khi bất kỳ bước nền tảng cụ thể nào liên quan đến việc tắt phiên đã hoàn tất. Bạn có thể sử dụng promise để thực hiện các thao tác như cập nhật các phần tử UI để phản ánh kết nối đã tắt, kích hoạt tắt ứng dụng, hoặc bất kỳ điều gì khác bạn có thể cần làm.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
