---
title: "Document: phương thức createExpression()"
short-title: createExpression()
slug: Web/API/Document/createExpression
page-type: web-api-instance-method
browser-compat: api.Document.createExpression
---

{{APIRef("DOM")}}

Phương thức này biên dịch một {{DOMxRef("XPathExpression")}} sau đó có thể được sử dụng để đánh giá (lặp lại).

Bạn phải gọi phương thức này trên cùng một tài liệu mà bạn chạy biểu thức.

## Cú pháp

```js-nolint
createExpression(xpathText, namespaceURLMapper)
```

### Tham số

- `xpathText`
  - : Một chuỗi là biểu thức XPath cần được biên dịch.
- `namespaceURLMapper`
  - : Một hàm ánh xạ tiền tố namespace tới URL namespace (hoặc null nếu không cần).

### Giá trị trả về

{{DOMxRef("XPathExpression")}}

## Ví dụ

```js
const xpathExpr = document.createExpression("//div");
const xpathResult = xpathExpr.evaluate(document); // returns an XPathResult object
const nodeContext = document.querySelector("nav");
// Re-using the XPathExpression "xpathExpr"
const otherResult = xpathExpr.evaluate(nodeContext); // returns an XPathResult object
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Document.evaluate()")}}
- {{DOMxRef("XPathExpression")}}
