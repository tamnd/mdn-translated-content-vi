---
title: "Document: thuộc tính preferredStyleSheetSet"
short-title: preferredStyleSheetSet
slug: Web/API/Document/preferredStyleSheetSet
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.Document.preferredStyleSheetSet
---

{{APIRef("DOM")}}{{deprecated_header}}{{Non-standard_header}}

Thuộc tính **`preferredStyleSheetSet`** trả về bộ bảng kiểu ưa thích được đặt bởi tác giả trang.

## Giá trị

Bộ bảng kiểu ưa thích của tác giả. Điều này được xác định từ thứ tự các khai báo bảng styled và tiêu đề HTTP `Default-Style`.

Nếu không có bộ bảng kiểu ưa thích nào được định nghĩa bởi tác giả, chuỗi rỗng (`""`) được trả về.

## Ví dụ

```js
if (document.preferredStyleSheetSet) {
  console.log(
    `Bộ bảng kiểu ưa thích là: ${document.preferredStyleSheetSet}`,
  );
} else {
  console.log("Không có bộ bảng kiểu ưa thích.");
}
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.lastStyleSheetSet")}}
- {{domxref("document.selectedStyleSheetSet")}}
- {{domxref("document.styleSheetSets")}}
- {{domxref("document.enableStyleSheetsForSet()")}}
