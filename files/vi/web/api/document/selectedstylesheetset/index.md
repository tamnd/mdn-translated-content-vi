---
title: "Document: selectedStyleSheetSet property"
short-title: selectedStyleSheetSet
slug: Web/API/Document/selectedStyleSheetSet
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.Document.selectedStyleSheetSet
---

{{APIRef("DOM")}}{{deprecated_header}}{{Non-standard_header}}

Thuộc tính **`selectedStyleSheetSet`** cho biết tên của bộ bảng kiểu hiện đang được sử dụng.

## Giá trị

Tên của bộ bảng kiểu hiện đang được sử dụng. Bạn cũng có thể đặt bộ bảng kiểu hiện tại bằng thuộc tính này.

Việc đặt giá trị của thuộc tính này tương đương với việc gọi
{{domxref("document.enableStyleSheetsForSet()")}} với giá trị của
`currentStyleSheetSet`, sau đó đặt giá trị của
`lastStyleSheetSet` thành giá trị đó.

> [!NOTE]
> Giá trị của thuộc tính này là trực tiếp; thay đổi trực tiếp thuộc tính `disabled` trên các bảng kiểu sẽ ảnh hưởng đến giá trị của thuộc tính này.

## Ví dụ

```js
console.log(`Current style sheet set: ${document.selectedStyleSheetSet}`);

document.selectedStyleSheetSet = "Some other style sheet";
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.lastStyleSheetSet")}}
- {{domxref("document.preferredStyleSheetSet")}}
- {{domxref("document.styleSheetSets")}}
- {{domxref("document.enableStyleSheetsForSet()")}}
