---
title: Text
slug: Web/API/Text
page-type: web-api-interface
browser-compat: api.Text
---

{{ApiRef("DOM")}}

Giao diện **`Text`** đại diện cho một {{domxref("Node", "nút")}} văn bản trong cây DOM.

{{InheritanceDiagram}}

Để hiểu nút văn bản là gì, hãy xem xét tài liệu sau:

```html
<html lang="en" class="e">
  <head>
    <title>Aliens?</title>
  </head>
  <body>
    Why yes.
  </body>
</html>
```

Trong tài liệu đó, có năm nút văn bản với các nội dung sau:

- `"\n    "` (sau thẻ mở `<head>`, một ký tự xuống dòng theo sau bởi bốn khoảng trắng)
- `"Aliens?"` (nội dung của phần tử `title`)
- `"\n  "` (sau thẻ đóng `</head>`, một ký tự xuống dòng theo sau bởi hai khoảng trắng)
- `"\n  "` (sau thẻ mở `<body>`, một ký tự xuống dòng theo sau bởi hai khoảng trắng)
- `"\n Why yes.\n \n\n"` (nội dung của phần tử `body`)

Mỗi nút văn bản đó là một đối tượng có các thuộc tính và phương thức được ghi lại trong bài viết này.

## Hàm khởi tạo

- {{domxref("Text.Text", "Text()")}}
  - : Trả về một nút `Text` mới với tham số là nội dung văn bản của nút đó.

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ các đối tượng cha, {{domxref("CharacterData")}}, {{domxref("Node")}} và {{domxref("EventTarget")}}._

- {{domxref("Text.assignedSlot")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("HTMLSlotElement")}} đại diện cho {{htmlelement("slot")}} mà nút đó được chèn vào.
- {{domxref("Text.wholeText")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa văn bản của tất cả các nút `Text` liền kề về mặt logic với {{domxref("Node")}} này, được nối theo thứ tự trong tài liệu.

## Phương thức phiên bản

_Kế thừa phương thức từ các đối tượng cha, {{domxref("CharacterData")}}, {{domxref("Node")}} và {{domxref("EventTarget")}}._

- {{domxref("Text.splitText")}}
  - : Tách nút thành hai nút tại một vị trí offset được chỉ định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [The DOM API](/en-US/docs/Web/API/Document_Object_Model)
