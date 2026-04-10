---
title: "Document: phương thức enableStyleSheetsForSet()"
short-title: enableStyleSheetsForSet()
slug: Web/API/Document/enableStyleSheetsForSet
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.Document.enableStyleSheetsForSet
---

{{APIRef("DOM")}}{{deprecated_header}}{{Non-standard_header}}

Bật các bảng kiểu khớp với tên được chỉ định trong bộ bảng kiểu hiện tại, và tắt tất cả các bảng kiểu khác (ngoại trừ những bảng không có tiêu đề, luôn được bật).

## Cú pháp

```js-nolint
enableStyleSheetsForSet(name)
```

### Tham số

- `name`
  - : Tên của các bảng kiểu cần bật. Tất cả bảng styled có tiêu đề khớp với tên này sẽ được bật, trong khi tất cả các bảng khác có tiêu đề sẽ bị tắt.
    Chỉ định một chuỗi rỗng cho tham số _name_ để tắt tất cả bảng kiểu thay thế và ưa thích (nhưng không tắt các bảng kiểu bền vững; tức là những bảng không có thuộc tính `title`).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ghi chú

- Việc khớp tiêu đề có phân biệt chữ hoa chữ thường.
- Gọi phương thức này với _name_ là `null` không có hiệu lực; nếu bạn muốn tắt tất cả bảng kiểu thay thế và ưa thích, bạn **phải** truyền "", chuỗi rỗng.
- Các bảng kiểu không có tiêu đề không bao giờ bị ảnh hưởng bởi phương thức này.
- Phương thức này không bao giờ ảnh hưởng đến giá trị của {{domxref("document.lastStyleSheetSet")}} hoặc {{domxref("document.preferredStyleSheetSet")}}.

## Ví dụ

```js
document.enableStyleSheetsForSet("Tên bộ bảng kiểu");
```

## Đặc tả kỹ thuật

Không thuộc bất kỳ đặc tả kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Stylesheet")}}
- {{domxref("Document.styleSheets")}}
- {{domxref("document.lastStyleSheetSet")}}
- {{domxref("document.preferredStyleSheetSet")}}
- {{domxref("document.selectedStyleSheetSet")}}
