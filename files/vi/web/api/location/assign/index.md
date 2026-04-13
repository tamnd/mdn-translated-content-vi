---
title: "Location: phương thức assign()"
short-title: assign()
slug: Web/API/Location/assign
page-type: web-api-instance-method
browser-compat: api.Location.assign
---

{{ APIRef("HTML DOM") }}

Phương thức **`assign()`** của giao diện {{DOMXref("Location")}} khiến cửa sổ tải và hiển thị tài liệu tại URL được chỉ định. Sau khi điều hướng xảy ra, người dùng có thể quay lại trang đã gọi `Location.assign()` bằng cách nhấn nút "back".

## Cú pháp

```js-nolint
assign(url)
```

### Tham số

- `url`
  - : Một chuỗi hoặc bất kỳ đối tượng nào khác có {{Glossary("stringifier")}}, chẳng hạn một đối tượng {{domxref("URL")}}, chứa URL của trang mà bạn muốn điều hướng tới; ví dụ một URL tuyệt đối như `https://developer.mozilla.org/en-US/docs/Web/API/Location/reload`, hoặc một URL tương đối - chẳng hạn `/Web` (chỉ là một path, để điều hướng tới tài liệu khác cùng origin) hoặc `#specifications` (chỉ là fragment string, để điều hướng tới một phần của cùng trang), v.v.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{Glossary("origin")}} của script gọi phương thức không phải là {{Glossary("Same-origin policy", "same origin")}} với trang được mô tả ban đầu bởi đối tượng {{domxref("Location")}}, thường là khi script được lưu trữ trên một domain khác. Trình duyệt cũng giới hạn tần suất điều hướng và có thể ném lỗi này, tạo cảnh báo hoặc bỏ qua lời gọi nếu nó được gọi quá thường xuyên.
- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số `url` được cung cấp không phải là URL hợp lệ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Điều hướng đến bài viết Location.reload
window.location.assign(
  "https://developer.mozilla.org/en-US/docs/Web/API/Location/reload",
);

// Sau đó điều hướng đến phần Specifications của nó
window.location.assign("#specifications");

// Cuối cùng điều hướng đến https://developer.mozilla.org/en-US/docs/Web
window.location.assign("/Web");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("Location")}} mà nó thuộc về.
- Các phương thức tương tự: {{domxref("Location.replace()")}} và {{domxref("Location.reload()")}}.
