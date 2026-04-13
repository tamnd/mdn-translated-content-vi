---
title: CSSViewTransitionRule
slug: Web/API/CSSViewTransitionRule
page-type: web-api-interface
browser-compat: api.CSSViewTransitionRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSViewTransitionRule`** đại diện cho một at-rule CSS {{cssxref("@view-transition")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên {{domxref("CSSRule")}}._

- {{domxref("CSSViewTransitionRule.navigation", "navigation")}} {{readonlyinline}}
  - : Trả về giá trị descriptor `navigation` của at-rule `@view-transition`.
- {{domxref("CSSViewTransitionRule.types", "types")}} {{readonlyinline}}
  - : Trả về một mảng chứa các giá trị descriptor `types` của at-rule `@view-transition`.

## Phương thức phiên bản

_Kế thừa các phương thức từ tổ tiên {{domxref("CSSRule")}}._

## Ví dụ

### Sử dụng cơ bản

Một stylesheet bao gồm một at-rule {{cssxref("@view-transition")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules), với các descriptor `navigation` và `types` được đặt:

```css
@view-transition {
  navigation: auto;
  types: slide, rotate;
}
```

Trong script, chúng ta lấy một tham chiếu đến at-rule `@view-transition` bằng `document.styleSheets[0].cssRules`, sau đó ghi lại đối tượng `CSSViewTransitionRule` tương ứng và các thuộc tính `navigation` và `types` của nó vào console.

```js
let myRule = document.styleSheets[0].cssRules;
console.log(myRule[0]); // a CSSViewTransitionRule representing the @view-transition at-rule
console.log(myRule[0].navigation); // "auto"
console.log(myRule[0].types); // ["slide", "rotate"]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@view-transition")}}
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
