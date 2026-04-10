---
title: "DocumentType: phương thức after()"
short-title: after()
slug: Web/API/DocumentType/after
page-type: web-api-instance-method
browser-compat: api.DocumentType.after
---

{{APIRef("DOM")}}

Phương thức **`DocumentType.after()`** chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi vào danh sách con của nút cha của `DocumentType`, ngay sau `DocumentType`. Các chuỗi sẽ được chèn dưới dạng các nút {{domxref("Text")}} tương ứng.

## Cú pháp

```js-nolint
after(param1)
after(param1, param2)
after(param1, param2, /* …, */ paramN)
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

```js
let docType = document.implementation.createDocumentType("html", "", "");
let myDoc = document.implementation.createDocument("", "", docType);

docType.after(document.createElement("html"));

myDoc.childNodes;
// NodeList [<!DOCTYPE html>, <html>]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DocumentType.before()")}}
- {{domxref("CharacterData.after()")}}
- {{domxref("Element.after()")}}
