---
title: "Document: phương thức append()"
short-title: append()
slug: Web/API/Document/append
page-type: web-api-instance-method
browser-compat: api.Document.append
---

{{APIRef("DOM")}}

Phương thức **`Document.append()`** chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi sau phần tử con cuối cùng của tài liệu. Các chuỗi được chèn vào dưới dạng các nút {{domxref("Text")}} tương đương.

Phương thức này thêm một phần tử con vào một `Document`. Để thêm vào một phần tử bất kỳ trong cây, xem {{domxref("Element.append()")}}.

## Cú pháp

```js-nolint
append(param1)
append(param1, param2)
append(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, …, `paramN`
  - : Một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi cần chèn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném ra khi node không thể được chèn tại điểm được chỉ định trong hệ thống phân cấp.

## Ví dụ

### Thêm một phần tử gốc vào tài liệu

Nếu bạn cố gắng thêm một phần tử vào một tài liệu HTML hiện có, nó có thể ném ra `HierarchyRequestError` {{domxref("DOMException")}} vì một phần tử {{HTMLElement("html")}} đã tồn tại.

```js
let html = document.createElement("html");
document.append(html);
// HierarchyRequestError: The operation would yield an incorrect node tree.
```

Nếu bạn đang tạo một tài liệu mới mà không có phần tử hiện có nào, bạn có thể thêm một phần tử HTML gốc (hoặc một phần tử SVG gốc):

```js
let doc = new Document();
let html = document.createElement("html");
doc.append(html);

doc.children; // HTMLCollection [<html>]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.prepend()")}}
- {{domxref("Element.append()")}}
