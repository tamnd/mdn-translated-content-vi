---
title: CSS Properties and Values API
slug: Web/API/CSS_Properties_and_Values_API
page-type: web-api-overview
browser-compat:
  - api.CSSPropertyRule
  - api.CSS.registerProperty_static
---

{{DefaultAPISidebar("CSS Properties and Values API")}}

**CSS Properties and Values API**, là một phần của nhóm API [CSS Houdini](/en-US/docs/Web/API/Houdini_APIs), cho phép các nhà phát triển khai báo rõ ràng [thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--*) của họ, hỗ trợ kiểm tra kiểu thuộc tính, giá trị mặc định và các thuộc tính có hoặc không kế thừa giá trị.

## Giao diện

- {{domxref('CSS/registerProperty_static', 'CSS.registerProperty')}}
  - : Định nghĩa cách trình duyệt nên phân tích [thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--*). Truy cập giao diện này qua {{domxref('CSS/registerProperty_static', 'CSS.registerProperty')}} trong [JavaScript](/en-US/docs/Web/JavaScript).
- {{cssxref('@property')}}
  - : Định nghĩa cách trình duyệt nên phân tích [thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--*). Truy cập giao diện này qua at-rule {{cssxref('@property')}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) trong [CSS](/en-US/docs/Web/CSS).

## Ví dụ

Ví dụ dưới đây sẽ đăng ký một [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Reference/Properties/--*) có tên `--my-color` sử dụng {{domxref('CSS/registerProperty_static', 'CSS.registerProperty')}} trong [JavaScript](/en-US/docs/Web/JavaScript). `--my-color` sẽ sử dụng cú pháp màu CSS, có giá trị mặc định là `#c0ffee` và sẽ không kế thừa giá trị:

```js
window.CSS.registerProperty({
  name: "--my-color",
  syntax: "<color>",
  inherits: false,
  initialValue: "#c0ffee",
});
```

Việc đăng ký tương tự có thể diễn ra trong [CSS](/en-US/docs/Web/CSS) sử dụng at-rule {{cssxref('@property')}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules):

```css
@property --my-color {
  syntax: "<color>";
  inherits: false;
  initial-value: #c0ffee;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS properties and values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API/guide)
- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [CSS Typed Object Model](/en-US/docs/Web/API/CSS_Typed_OM_API)
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)
