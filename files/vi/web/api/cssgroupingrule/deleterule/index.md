---
title: "CSSGroupingRule: deleteRule() method"
short-title: deleteRule()
slug: Web/API/CSSGroupingRule/deleteRule
page-type: web-api-instance-method
browser-compat: api.CSSGroupingRule.deleteRule
---

{{ APIRef("CSSOM") }}

Phương thức **`deleteRule()`** của giao diện
{{domxref("CSSGroupingRule")}} xóa một quy tắc CSS khỏi danh sách các quy tắc CSS con.

## Cú pháp

```js-nolint
deleteRule(index)
```

### Tham số

- `index`
  - : Chỉ mục của quy tắc cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu _index_ lớn hơn hoặc bằng số lượng quy tắc CSS con.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu quy tắc đang bị xóa là at-rule `@namespace`, và danh sách các quy tắc CSS con chứa bất cứ thứ gì ngoài các at-rule `@import` và `@namespace`.

## Ví dụ

```js
let myRules = document.styleSheets[0].cssRules;
myRules[0].deleteRule(2); /* deletes the rule at index 2 */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
