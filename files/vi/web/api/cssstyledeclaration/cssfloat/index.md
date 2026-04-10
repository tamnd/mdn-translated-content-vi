---
title: "CSSStyleDeclaration: thuộc tính cssFloat"
short-title: cssFloat
slug: Web/API/CSSStyleDeclaration/cssFloat
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.CSSStyleDeclaration.cssFloat
---

{{APIRef("CSSOM")}}{{deprecated_header}}

Thuộc tính **`cssFloat`** của giao diện {{domxref("CSSStyleDeclaration")}} trả về kết quả của việc gọi {{DOMxRef("CSSStyleDeclaration.getPropertyValue()")}} với `float` làm đối số.

Khi thiết lập, nó gọi {{DOMxRef("CSSStyleDeclaration.setProperty()")}} với `float` làm đối số đầu tiên và giá trị đã cho làm đối số thứ hai. Giá trị đã cho phải là một giá trị hợp lệ cho thuộc tính {{cssxref("float")}}.

## Giá trị

Một chuỗi.

Khi được đặt thành giá trị `null`, giá trị `null` đó được chuyển đổi thành chuỗi rỗng (`""`), vì vậy `csd.cssFloat = null` tương đương với `csd.cssFloat = ""`.

## Ví dụ

Trong ví dụ bên dưới, bảng kiểu chứa một quy tắc duy nhất cho `.box`, có thuộc tính {{cssxref("float")}} với giá trị là `left`. Giá trị này sẽ được trả về bởi `cssFloat`. Sau đó, chúng ta thiết lập giá trị thành "right" bằng `cssFloat` và trả về giá trị mới.

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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
