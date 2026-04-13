---
title: XPathExpression
slug: Web/API/XPathExpression
page-type: web-api-interface
browser-compat: api.XPathExpression
---

{{APIRef("DOM")}}

Giao diện này là một biểu thức XPath đã được biên dịch, có thể được đánh giá trên một tài liệu hoặc nút cụ thể để trả về thông tin từ cây {{Glossary("DOM")}} của nó.

Điều này hữu ích khi một biểu thức sẽ được tái sử dụng trong ứng dụng, vì nó chỉ được biên dịch một lần và tất cả các tiền tố không gian tên xuất hiện trong biểu thức đều được phân giải trước.

Các đối tượng thuộc loại này được tạo bằng cách gọi {{domxref("XPathEvaluator.createExpression", "XPathEvaluator.createExpression()")}}.

## Phương thức phiên bản

- {{DOMxRef("XPathExpression.evaluate()")}}
  - : Đánh giá biểu thức XPath trên nút hoặc tài liệu đã cho.

## Ví dụ

Ví dụ sau minh họa cách sử dụng giao diện `XPathExpression`.

### HTML

```html
<div>XPath example</div>
<div>Number of &lt;div&gt;s: <output></output></div>
```

### JavaScript

```js
const xpath = "//div";
const evaluator = new XPathEvaluator();
const expression = evaluator.createExpression(xpath);
const result = expression.evaluate(
  document,
  XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,
);
document.querySelector("output").textContent = result.snapshotLength;
```

### Kết quả

{{EmbedLiveSample('Example', 400, 70)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("document.createExpression()")}}
- {{DOMxRef("XPathResult")}}
