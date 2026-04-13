---
title: "CSSStyleSheet: removeRule() method"
short-title: removeRule()
slug: Web/API/CSSStyleSheet/removeRule
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.CSSStyleSheet.removeRule
---

{{APIRef("CSSOM")}}{{deprecated_header}}

Phương thức **`removeRule()`** đã lỗi thời của {{domxref("CSSStyleSheet")}} loại bỏ một quy tắc khỏi đối tượng bảng kiểu. Nó có chức năng tương tự như phương thức tiêu chuẩn, được khuyến nghị {{domxref("CSSStyleSheet.deleteRule", "deleteRule()")}}.

> [!NOTE]
> Đây là một _phương thức legacy_ đã được thay thế bằng
> phương thức tiêu chuẩn {{domxref("CSSStyleSheet.deleteRule", "deleteRule()")}}. Bạn
> nên sử dụng phương thức đó thay vì phương thức này.

## Cú pháp

```js-nolint
removeRule(index)
```

### Tham số

- `index`
  - : Chỉ số trong {{domxref("CSSRuleList")}} của bảng kiểu cho biết quy tắc cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này xóa quy tắc đầu tiên khỏi bảng kiểu `myStyles`.

```js
myStyles.removeRule(0);
```

Bạn có thể viết lại để sử dụng phương thức `deleteRule()` tiêu chuẩn rất dễ dàng:

```js
myStyles.deleteRule(0);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model)
- [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
- {{domxref("CSSStyleSheet.insertRule", "insertRule()")}}
