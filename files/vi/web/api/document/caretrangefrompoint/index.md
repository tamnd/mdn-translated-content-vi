---
title: "Document: phương thức caretRangeFromPoint()"
short-title: caretRangeFromPoint()
slug: Web/API/Document/caretRangeFromPoint
page-type: web-api-instance-method
status:
  - non-standard
browser-compat: api.Document.caretRangeFromPoint
---

{{APIRef("DOM")}}{{Non-standard_header}}

Phương thức **`caretRangeFromPoint()`** của giao diện {{domxref("Document")}} trả về một đối tượng {{domxref("Range")}} cho phần tài liệu nằm dưới các tọa độ được chỉ định.

Phương thức này là triển khai độc quyền WebKit của phương thức {{domxref("Document.caretPositionFromPoint")}}.

## Cú pháp

```js-nolint
caretRangeFromPoint(x, y)
```

### Tham số

- `x`
  - : Một vị trí ngang trong khung nhìn hiện tại.
- `y`
  - : Một vị trí dọc trong khung nhìn hiện tại.

### Giá trị trả về

Một trong các giá trị sau:

- Một {{domxref("Range")}}.
- `Null`, nếu _x_ hoặc _y_ là số âm, nằm ngoài khung nhìn, hoặc không có nút nhập văn bản.

## Ví dụ

Hãy truy cập trang {{domxref("Document.caretPositionFromPoint#Examples", "Document.caretPositionFromPoint")}} để xem mẫu trực tiếp của phương thức này.

## Đặc tả kỹ thuật

Không phải là một phần của bất kỳ đặc tả kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}
