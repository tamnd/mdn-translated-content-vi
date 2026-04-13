---
title: "DocumentType: phương thức before()"
short-title: before()
slug: Web/API/DocumentType/before
page-type: web-api-instance-method
browser-compat: api.DocumentType.before
---

{{APIRef("DOM")}}

Phương thức **`DocumentType.before()`** chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi vào danh sách con của nút cha của `DocumentType`, ngay trước `DocumentType`. Các chuỗi sẽ được chèn dưới dạng các nút {{domxref("Text")}} tương ứng.

## Cú pháp

```js-nolint
before(param1)
before(param1, param2)
before(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, ..., `paramN`
  - : Một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi để chèn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném ra khi nút không thể được chèn tại điểm đã chỉ định trong cây phân cấp.

## Ví dụ

### Thêm một conditional comment

Các nút comment hợp lệ trước khai báo doctype nhưng không được khuyến nghị dùng vì chúng kích hoạt quirks mode trong IE. Tuy vậy, một [conditional comment](https://www.sitepoint.com/internet-explorer-conditional-comments/) cũng hoạt động với IE:

```js
let docType = document.implementation.createDocumentType("html", "", "");
let myDoc = document.implementation.createDocument("", "", docType);

docType.before(
  document.createComment("<!--[if !IE]> conditional comment <![endif]-->"),
);

myDoc.childNodes;
// NodeList [<!--[if !IE]> conditional comment <![endif]-->, <!DOCTYPE html>]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DocumentType.after()")}}
- {{domxref("CharacterData.before()")}}
- {{domxref("Element.before()")}}
