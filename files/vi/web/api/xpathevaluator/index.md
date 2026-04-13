---
title: XPathEvaluator
slug: Web/API/XPathEvaluator
page-type: web-api-interface
browser-compat: api.XPathEvaluator
---

{{APIRef("DOM")}}

Giao diện `XPathEvaluator` cho phép biên dịch và đánh giá các biểu thức {{Glossary("XPath")}}.

## Hàm khởi tạo

- {{domxref("XPathEvaluator.XPathEvaluator", "XPathEvaluator()")}}
  - : Tạo một đối tượng `XPathEvaluator` mới.

## Phương thức phiên bản

- {{DOMxRef("XPathEvaluator.createExpression()")}}
  - : Tạo một biểu thức XPath đã phân tích với các không gian tên đã được giải quyết.
- {{DOMxRef("XPathEvaluator.createNSResolver()")}} {{deprecated_inline}}
  - : Trả về đầu vào như nguyên vẹn.
- {{DOMxRef("XPathEvaluator.evaluate()")}}
  - : Đánh giá một chuỗi biểu thức XPath và trả về kết quả của loại đã chỉ định nếu có thể.

## Ví dụ

### Đếm số phần tử `<div>`

Ví dụ sau đây cho thấy cách sử dụng giao diện `XPathEvaluator`.

#### HTML

```html
<div>XPath example</div>
<div>Number of &lt;div&gt; elements: <output></output></div>
```

#### JavaScript

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

#### Kết quả

{{EmbedLiveSample("count_the_number_of_div_elements", "100%", "40")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.createExpression()")}}
- {{domxref("XPathExpression")}}
