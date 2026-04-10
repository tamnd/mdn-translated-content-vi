---
title: "Location: phương thức replace()"
short-title: replace()
slug: Web/API/Location/replace
page-type: web-api-instance-method
browser-compat: api.Location.replace
---

{{ APIRef("HTML DOM") }}

Phương thức **`replace()`** của giao diện {{DOMXref("Location")}} thay thế tài nguyên hiện tại bằng tài nguyên tại URL được cung cấp. Điểm khác với phương thức {{domxref("Location.assign","assign()")}} là sau khi dùng `replace()`, trang hiện tại sẽ không được lưu trong phiên {{domxref("History")}}, nghĩa là người dùng sẽ không thể dùng nút _back_ để điều hướng tới nó. Không nên nhầm với phương thức {{jsxref("String")}} {{jsxref("String.prototype.replace()")}}.

## Cú pháp

```js-nolint
replace(url)
```

### Tham số

- `url`
  - : Một chuỗi hoặc bất kỳ đối tượng nào khác có {{Glossary("stringifier")}}, chẳng hạn một đối tượng {{domxref("URL")}}, chứa URL của trang mà bạn muốn điều hướng tới.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Trình duyệt giới hạn tần suất điều hướng và có thể ném lỗi này, tạo cảnh báo hoặc bỏ qua lời gọi nếu nó được gọi quá thường xuyên.
- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số `url` được cung cấp không phải là URL hợp lệ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Điều hướng đến bài viết Location.reload bằng cách thay thế trang này
window.location.replace(
  "https://developer.mozilla.org/en-US/docs/Web/API/Location.reload",
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("Location")}} mà nó thuộc về.
- Các phương thức tương tự: {{domxref("Location.assign()")}} và {{domxref("Location.reload()")}}.
