---
title: "Document: styleSheetSets property"
short-title: styleSheetSets
slug: Web/API/Document/styleSheetSets
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.Document.styleSheetSets
---

{{APIRef("DOM")}}{{deprecated_header}}{{Non-standard_header}}

Thuộc tính chỉ đọc **`styleSheetSets`** trả về một danh sách trực tiếp của tất cả các bộ bảng kiểu hiện có sẵn.

## Giá trị

Một danh sách các bộ bảng kiểu có sẵn.

## Ví dụ

Cho một phần tử {{HTMLElement("ul")}} (danh sách) có ID là "sheetList", bạn có thể điền
nó với tên của tất cả các bộ bảng kiểu có sẵn bằng mã như sau:

```js
const list = document.getElementById("sheetList");
const sheets = document.styleSheetSets;

list.textContent = "";

for (const sheet of sheets) {
  const item = document.createElement("li");
  item.textContent = sheet;
  list.appendChild(item);
}
```

## Ghi chú

Danh sách các bộ bảng kiểu có sẵn được xây dựng bằng cách liệt kê tất cả các bảng kiểu
có sẵn cho tài liệu, theo thứ tự chúng được liệt kê trong
thuộc tính {{domxref("Document.styleSheets")}}, thêm `title` của mỗi
bảng kiểu có tiêu đề vào danh sách. Các bản sao bị loại bỏ khỏi danh sách (sử dụng phép so sánh phân biệt hoa thường).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Stylesheet")}}
- {{domxref("Document.styleSheets")}}
- {{domxref("document.lastStyleSheetSet")}}
- {{domxref("document.preferredStyleSheetSet")}}
- {{domxref("document.selectedStyleSheetSet")}}
- {{domxref("document.enableStyleSheetsForSet()")}}
