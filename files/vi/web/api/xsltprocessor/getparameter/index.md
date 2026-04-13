---
title: "XSLTProcessor: getParameter() method"
short-title: getParameter()
slug: Web/API/XSLTProcessor/getParameter
page-type: web-api-instance-method
browser-compat: api.XSLTProcessor.getParameter
---

{{APIRef("DOM")}}

Phương thức `getParameter()` của giao diện {{domxref("XSLTProcessor")}} trả về giá trị của một tham số (`<xsl:param>`) từ biểu định kiểu XSLT đã được nhập vào bộ xử lý.

## Cú pháp

```js-nolint
getParameter(namespaceURI, localName)
```

### Tham số

- `namespaceURI`
  - : Không gian tên liên kết với tên tham số. Giá trị ["null"](/en-US/docs/Web/JavaScript/Reference/Operators/null) được xử lý giống như chuỗi rỗng (`""`).
- `localName`
  - : Tên của tham số trong không gian tên liên kết.

### Giá trị trả về

Một đối tượng là giá trị liên kết với tham số. Có thể thuộc bất kỳ kiểu nào.

> [!NOTE]
> Firefox hỗ trợ mọi kiểu tham số. Chrome, Edge và Safari chỉ hỗ trợ tham số chuỗi.

## Ví dụ

### Sử dụng getParameter()

Ví dụ này cho thấy cách sử dụng `getParameter()` để kiểm tra giá trị của một tham số điều khiển hành vi của phép biến đổi XSLT.

```js
const xsltProcessor = new XSLTProcessor();
xsltProcessor.setParameter(null, "foo", "bar");
console.log(xsltProcessor.getParameter(null, "foo")); // "bar"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XSLTProcessor.setParameter()")}}
- {{domxref("XSLTProcessor.removeParameter()")}}
- {{domxref("XSLTProcessor.clearParameters()")}}
- {{domxref("XSLTProcessor.reset()")}}
