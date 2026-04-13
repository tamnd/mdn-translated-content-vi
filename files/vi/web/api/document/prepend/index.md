---
title: "Document: phương thức prepend()"
short-title: prepend()
slug: Web/API/Document/prepend
page-type: web-api-instance-method
browser-compat: api.Document.prepend
---

{{APIRef("DOM")}}

Phương thức **`Document.prepend()`** chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi trước phần tử con đầu tiên của tài liệu. Các chuỗi được chèn dưới dạng các nút {{domxref("Text")}} tương đương.

Phương thức này chèn một phần tử con vào đầu `Document`. Để chèn vào đầu một phần tử bất kỳ trong cây, xem {{domxref("Element.prepend()")}}.

## Cú pháp

```js-nolint
prepend(param1)
prepend(param1, param2)
prepend(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, …, `paramN`
  - : Một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi cần chèn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném ra khi nút không thể được chèn tại điểm đã chỉ định trong phân cấp.

## Ví dụ

### Chèn một phần tử gốc vào tài liệu

Nếu bạn cố chèn một phần tử vào một tài liệu HTML hiện có, nó có thể ném `HierarchyRequestError` {{domxref("DOMException")}} vì một phần tử {{HTMLElement("html")}} đã tồn tại.

```js
let html = document.createElement("html");
document.prepend(html);
// HierarchyRequestError: Thao tác sẽ tạo ra một cây nút không chính xác.
```

Nếu bạn đang tạo một tài liệu mới mà không có phần tử hiện có, bạn có thể chèn một phần tử HTML gốc (hoặc một phần tử SVG gốc):

```js
let doc = new Document();
let html = document.createElement("html");
doc.prepend(html);

doc.children; // HTMLCollection [<html>]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.append()")}}
- {{domxref("Element.prepend()")}}
