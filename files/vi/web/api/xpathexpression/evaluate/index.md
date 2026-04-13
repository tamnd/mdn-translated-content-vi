---
title: "XPathExpression: phương thức evaluate()"
short-title: evaluate()
slug: Web/API/XPathExpression/evaluate
page-type: web-api-instance-method
browser-compat: api.XPathExpression.evaluate
---

{{APIRef("DOM")}}

Phương thức **`evaluate()`** của giao diện {{domxref("XPathExpression")}} thực thi một biểu thức [XPath](/en-US/docs/Web/XML/XPath) trên nút hoặc tài liệu đã cho và trả về một {{domxref("XPathResult")}}.

## Cú pháp

```js-nolint
evaluate(contextNode)
evaluate(contextNode, type)
evaluate(contextNode, type, result)
```

### Tham số

- `contextNode`
  - : Một {{domxref("Node")}} đại diện cho ngữ cảnh để đánh giá biểu thức.
- `type` {{optional_inline}}
  - : Xác định loại kết quả trả về khi đánh giá biểu thức. Phải là một trong các hằng số {{domxref("XPathResult", "XPathResult", "Constants")}}.
- `result` {{optional_inline}}
  - : Cho phép chỉ định một đối tượng kết quả có thể được tái sử dụng và trả về bởi phương thức này. Nếu được chỉ định là `null` hoặc nếu triển khai không tái sử dụng kết quả đã chỉ định, một đối tượng kết quả mới sẽ được trả về.

### Giá trị trả về

Một đối tượng {{domxref("XPathResult")}} đại diện cho kết quả đánh giá biểu thức XPath.

### Ngoại lệ

#### INVALID_EXPRESSION_ERR

Nếu biểu thức không hợp lệ theo quy tắc của {{domxref("XPathEvaluator")}}, một {{domxref("DOMException")}} loại `INVALID_EXPRESSION_ERR` sẽ được ném ra.

#### TYPE_ERR

Trong trường hợp kết quả không thể chuyển đổi sang loại được chỉ định, một {{domxref("DOMException")}} loại `TYPE_ERR` sẽ được ném ra.

#### NAMESPACE_ERR

Nếu biểu thức chứa các tiền tố không gian tên không thể được phân giải bởi `XPathNSResolver` đã chỉ định, một {{domxref("DOMException")}} loại `NAMESPACE_ERROR` sẽ được ném ra.

#### WRONG_DOCUMENT_ERR

Nếu nút ngữ cảnh được cung cấp đến từ một tài liệu không được hỗ trợ bởi {{domxref("XPathEvaluator")}}, một {{domxref("DOMException")}} loại `WRONG_DOCUMENT_ERR` sẽ được ném ra.

#### NOT_SUPPORTED_ERR

Nếu nút ngữ cảnh được cung cấp không phải là loại được phép làm nút ngữ cảnh XPath hoặc loại yêu cầu không được phép bởi {{domxref("XPathEvaluator")}}, một {{domxref("DOMException")}} loại `NOT_SUPPORTED_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau minh họa cách sử dụng phương thức `evaluate()`.

### HTML

```html
<div>XPath example</div>
<div>Number of &lt;div&gt;s: <output></output></div>
```

### JavaScript

```js
const xpath = "//div";
const evaluator = new XPathEvaluator();
const expression = evaluator.createExpression("//div");
const result = expression.evaluate(
  document,
  XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,
);
document.querySelector("output").textContent = result.snapshotLength;
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
