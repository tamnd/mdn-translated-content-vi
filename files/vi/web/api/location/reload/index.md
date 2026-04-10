---
title: "Location: phương thức reload()"
short-title: reload()
slug: Web/API/Location/reload
page-type: web-api-instance-method
browser-compat: api.Location.reload
---

{{ APIRef("HTML DOM") }}

Phương thức **`reload()`** của giao diện {{DOMXref("Location")}} tải lại URL hiện tại, giống như nút Refresh.

## Cú pháp

```js-nolint
reload()
```

### Tham số

- `forceGet` {{non-standard_inline}}
  - : Truyền `true` để buộc tải lại và bỏ qua bộ nhớ đệm. Mặc định là `false`. Chỉ được hỗ trợ trong Firefox.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{Glossary("origin")}} của script gọi phương thức không phải là {{Glossary("Same-origin policy", "same origin")}} với trang được mô tả ban đầu bởi đối tượng {{domxref("Location")}}, chủ yếu khi script được lưu trữ trên một domain khác.

## Ví dụ

```js
// tải lại trang hiện tại
window.location.reload();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("Location")}} mà nó thuộc về.
- Các phương thức tương tự: {{domxref("Location.assign()")}} và {{domxref("Location.replace()")}}.
