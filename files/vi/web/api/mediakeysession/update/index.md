---
title: "MediaKeySession: phương thức update()"
short-title: update()
slug: Web/API/MediaKeySession/update
page-type: web-api-instance-method
browser-compat: api.MediaKeySession.update
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Phương thức `update()` của giao diện {{domxref('MediaKeySession')}} tải thông điệp và giấy phép vào CDM, rồi trả về một {{jsxref('Promise')}}.

## Cú pháp

```js-nolint
update(response)
```

### Tham số

- `response`
  - : Một thực thể là {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}.

### Giá trị trả về

Một {{jsxref('Promise')}} phân giải thành `undefined`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
