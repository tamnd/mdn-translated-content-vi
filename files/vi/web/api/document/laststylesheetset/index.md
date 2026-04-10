---
title: "Document: thuộc tính lastStyleSheetSet"
short-title: lastStyleSheetSet
slug: Web/API/Document/lastStyleSheetSet
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.Document.lastStyleSheetSet
---

{{APIRef("DOM")}}{{deprecated_header}}{{Non-standard_header}}

Thuộc tính **`Document.lastStyleSheetSet`** trả về bộ bảng kiểu được bật lần cuối. Giá trị của thuộc tính này thay đổi bất cứ khi nào thuộc tính {{domxref("document.selectedStyleSheetSet")}} được thay đổi.

## Giá trị

Bộ bảng kiểu được đặt gần đây nhất. Nếu bộ bảng kiểu hiện tại chưa được thay đổi bằng cách đặt {{domxref("document.selectedStyleSheetSet")}}, giá trị trả về là `null`.

> [!NOTE]
> Giá trị này không thay đổi khi {{domxref("document.enableStyleSheetsForSet()")}} được gọi.

## Ví dụ

```js
let lastSheetSet = document.lastStyleSheetSet;

if (!lastSheetSet) {
  lastSheetSet = "Bộ bảng kiểu chưa được thay đổi";
} else {
  console.log(`Bộ bảng kiểu cuối cùng là: ${lastSheetSet}`);
}
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.preferredStyleSheetSet")}}
- {{domxref("document.selectedStyleSheetSet")}}
- {{domxref("document.styleSheetSets")}}
- {{domxref("document.enableStyleSheetsForSet()")}}
