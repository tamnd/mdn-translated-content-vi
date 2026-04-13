---
title: "CSSStyleProperties: cssFloat property"
short-title: cssFloat
slug: Web/API/CSSStyleProperties/cssFloat
page-type: web-api-instance-property
browser-compat: api.CSSStyleProperties.cssFloat
---

{{APIRef("CSSOM")}}

Thuộc tính **`cssFloat`** của giao diện {{domxref("CSSStyleProperties")}} trả về thuộc tính CSS {{cssxref("float")}}.

Đây là kết quả của việc gọi {{DOMxRef("CSSStyleDeclaration.getPropertyValue()","getPropertyValue()")}} trên đối tượng với `float` làm tham số.

Khi đặt giá trị, nó gọi {{DOMxRef("CSSStyleDeclaration.setProperty()","setProperty()")}} với `float` là tham số đầu tiên và giá trị đã cho là tham số thứ hai.
Giá trị đã cho phải là giá trị hợp lệ cho thuộc tính {{cssxref("float")}}.

## Giá trị

Một chuỗi.

Khi được đặt thành giá trị `null`, giá trị `null` đó được chuyển đổi thành chuỗi rỗng (`""`), vì vậy `csd.cssFloat = null` tương đương với `csd.cssFloat = ""`.

## Ví dụ

Trong ví dụ bên dưới, stylesheet chứa một quy tắc duy nhất cho `.box`, có thuộc tính {{cssxref("float")}} với giá trị `left`. Giá trị này sẽ được trả về bởi `cssFloat`. Sau đó chúng tôi đặt giá trị thành "right" bằng `cssFloat` và trả về giá trị mới.

```css
.box {
  float: left;
  inline-size: 300px;
}
```

```js
let myRules = document.styleSheets[0].cssRules;
let rule = myRules[0];
console.log(rule.style.cssFloat); // "left"
rule.style.cssFloat = "right";
console.log(rule.style.cssFloat); // "right"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
