---
title: MimeTypeArray
slug: Web/API/MimeTypeArray
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.MimeTypeArray
---

{{APIRef("HTML DOM")}}{{Deprecated_Header}}

Giao diện **`MimeTypeArray`** trả về một mảng các thể hiện {{domxref('MimeType')}}, mỗi thể hiện chứa thông tin về một plugin trình duyệt được hỗ trợ. Đối tượng này được trả về bởi thuộc tính {{domxref("Navigator.mimeTypes")}} đã lỗi thời.

## Thuộc tính phiên bản

- {{domxref("MimeTypeArray.length")}} {{Deprecated_Inline}}
  - : Số lượng mục trong mảng.

## Phương thức phiên bản

- {{domxref("MimeTypeArray.item()")}} {{Deprecated_Inline}}
  - : Trả về đối tượng `MimeType` với chỉ số được chỉ định.
- {{domxref("MimeTypeArray.namedItem()")}} {{Deprecated_Inline}}
  - : Trả về đối tượng `MimeType` với tên được chỉ định.

## Ví dụ

Ví dụ sau kiểm tra xem plugin có sẵn cho loại MIME 'application/pdf' không và nếu có, ghi lại mô tả của nó.

```js
const mimeTypes = navigator.mimeTypes;
const pdf = mimeTypes.namedItem("application/pdf");

if (pdf) {
  console.log(pdf.description);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
