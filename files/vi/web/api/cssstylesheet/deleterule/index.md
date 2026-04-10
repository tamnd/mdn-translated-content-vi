---
title: "CSSStyleSheet: deleteRule() method"
short-title: deleteRule()
slug: Web/API/CSSStyleSheet/deleteRule
page-type: web-api-instance-method
browser-compat: api.CSSStyleSheet.deleteRule
---

{{APIRef("CSSOM")}}

Phương thức **`deleteRule()`** của {{domxref("CSSStyleSheet")}} loại bỏ một quy tắc khỏi đối tượng bảng kiểu.

## Cú pháp

```js-nolint
deleteRule(index)
```

### Tham số

- `index`
  - : Chỉ số trong {{domxref("CSSRuleList")}} của bảng kiểu cho biết quy tắc cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này xóa quy tắc đầu tiên khỏi bảng kiểu `myStyles`.

```js
myStyles.deleteRule(0);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model)
- [Constructable Stylesheets](https://web.dev/articles/constructable-stylesheets) (web.dev)
- [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
- {{domxref("CSSStyleSheet.insertRule", "insertRule()")}}
