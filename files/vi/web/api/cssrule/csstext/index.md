---
title: "CSSRule: cssText property"
short-title: cssText
slug: Web/API/CSSRule/cssText
page-type: web-api-instance-property
browser-compat: api.CSSRule.cssText
---

{{APIRef("CSSOM") }}

Thuộc tính **`cssText`** của {{domxref("CSSRule")}} trả về văn bản thực tế của một style rule trong {{domxref("CSSStyleSheet")}}.

> [!NOTE]
> Đừng nhầm thuộc tính này với {{domxref("CSSStyleDeclaration.cssText")}} của style phần tử.

Lưu ý rằng thuộc tính này trước đây có thể sửa được nhưng giờ đã chỉ đọc. Việc gán giá trị cho nó _hoàn toàn không tạo ra tác dụng gì_, thậm chí cũng không phát sinh cảnh báo hay lỗi. Hơn nữa, nó không có thuộc tính con nào có thể gán được. Vì vậy, để sửa nó, hãy dùng các thuộc tính {{domxref("CSSRuleList", "cssRules[index]")}} của stylesheet là {{domxref("CSSStyleRule.selectorText", ".selectorText")}} và {{domxref("CSSStyleRule.style", ".style")}} (hoặc các thuộc tính con của chúng). Xem [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information) để biết chi tiết.

## Giá trị

Một chuỗi chứa văn bản thực tế của quy tắc {{domxref("CSSStyleSheet")}}.

## Ví dụ

```css
body {
  background-color: darkblue;
}
```

```js
let stylesheet = document.styleSheets[0];
console.log(stylesheet.cssRules[0].cssText); // body { background-color: darkblue; }
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
