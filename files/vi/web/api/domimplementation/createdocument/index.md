---
title: "DOMImplementation: createDocument() method"
short-title: createDocument()
slug: Web/API/DOMImplementation/createDocument
page-type: web-api-instance-method
browser-compat: api.DOMImplementation.createDocument
---

{{ApiRef("DOM")}}

Phương thức **`createDocument()`** của giao diện {{domxref("DOMImplementation")}} tạo và trả về một {{domxref("XMLDocument")}}.

## Cú pháp

```js-nolint
createDocument(namespaceURI, qualifiedName)
createDocument(namespaceURI, qualifiedName, documentType)
```

### Tham số

- `namespaceURI`
  - : Một chuỗi chứa URI không gian tên của tài liệu cần tạo, hoặc `null` nếu tài liệu không thuộc không gian tên nào.
- `qualifiedName`
  - : Một chuỗi chứa tên đủ điều kiện của tài liệu cần tạo. Giá trị [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) được xử lý giống như chuỗi rỗng (`""`).

    Định dạng của tên đủ điều kiện là `prefix:localName` hoặc `localName`, trong đó các phần được định nghĩa là:
    - `prefix` {{optional_inline}}
      - : "Bí danh ngắn" cho không gian tên. Tiền tố là tùy chọn, nhưng nếu được chỉ định thì tham số `namespaceURI` cũng phải được chỉ định. Nếu tiền tố được đặt là `xml` hoặc `xmlns`, `namespaceURI` phải được đặt thành `http://www.w3.org/XML/1998/namespace` hoặc `http://www.w3.org/2000/xmlns/`, tương ứng. Mặc định là `null`.

    - `localName`
      - : Tên cục bộ của tài liệu.

- `documentType` {{optional_inline}}
  - : {{domxref("DocumentType")}} của tài liệu cần tạo. Mặc định là `null`.

### Giá trị trả về

{{domxref("XMLDocument")}} mới được tạo.

### Ngoại lệ

- `NamespaceError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị [`namespaceURI`](#namespaceURI):
    - không phải URI không gian tên hợp lệ.
    - được đặt thành chuỗi rỗng khi `prefix` có giá trị.
    - không phải giá trị `http://www.w3.org/XML/1998/namespace` hoặc `http://www.w3.org/2000/xmlns/` khi [`prefix`](#prefix) được đặt thành `xml` hoặc `xmlns`, tương ứng.
- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Được ném ra nếu `prefix` hoặc `localName` không hợp lệ.

## Ví dụ

### Sử dụng cơ bản

```js
const doc = document.implementation.createDocument(
  "http://www.w3.org/1999/xhtml",
  "html",
  null,
);
const body = document.createElementNS("http://www.w3.org/1999/xhtml", "body");
body.setAttribute("id", "abc");
doc.documentElement.appendChild(body);
alert(doc.getElementById("abc")); // [object HTMLBodyElement]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("DOMImplementation")}} mà nó thuộc về.
