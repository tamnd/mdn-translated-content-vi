---
title: CSSKeyframesRule
slug: Web/API/CSSKeyframesRule
page-type: web-api-interface
browser-compat: api.CSSKeyframesRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSKeyframesRule`** mô tả một đối tượng đại diện cho một tập hợp đầy đủ các keyframe cho một hoạt hình CSS. Nó tương ứng với nội dung của toàn bộ at-rule {{cssxref("@keyframes")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên {{domxref("CSSRule")}}._

- {{domxref("CSSKeyframesRule.name")}}
  - : Biểu diễn tên của các keyframe, được sử dụng bởi thuộc tính {{cssxref("animation-name")}}.
- {{domxref("CSSKeyframesRule.cssRules")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("CSSRuleList")}} của các keyframe trong danh sách.
- {{domxref("CSSKeyframesRule.length")}} {{ReadOnlyInline}}
  - : Trả về số lượng keyframe trong danh sách.

## Phương thức phiên bản

_Kế thừa các phương thức từ tổ tiên {{domxref("CSSRule")}}._

- {{domxref("CSSKeyframesRule.appendRule()")}}
  - : Thêm một quy tắc keyframe mới vào `CSSKeyframesRule` hiện tại. Tham số là một chuỗi chứa một keyframe theo cùng định dạng như một mục của at-rule {{cssxref("@keyframes")}}. Nếu nó chứa nhiều hơn một quy tắc keyframe, một {{domxref("DOMException")}} với `SYNTAX_ERR` sẽ được ném ra.
- {{domxref("CSSKeyframesRule.deleteRule()")}}
  - : Xóa một quy tắc keyframe khỏi `CSSKeyframesRule` hiện tại. Tham số là chỉ mục của keyframe cần xóa, được biểu diễn dưới dạng chuỗi giải thành số giữa `0%` và `100%`.
- {{domxref("CSSKeyframesRule.findRule()")}}
  - : Trả về một quy tắc keyframe tương ứng với khóa đã cho. Khóa là một chuỗi chứa chỉ mục của keyframe cần trả về, giải thành phần trăm giữa `0%` và `100%`. Nếu không tìm thấy keyframe nào, `findRule` trả về `null`.

## Ví dụ

### Sử dụng CSSKeyframesRule

CSS bao gồm một keyframes at-rule. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`.
`myRules[0]` trả về một đối tượng `CSSKeyframesRule`.

```css
@keyframes slide-in {
  from {
    transform: translateX(0%);
  }

  to {
    transform: translateX(100%);
  }
}
```

```js
const myRules = document.styleSheets[0].cssRules;
const keyframes = myRules[0]; // a CSSKeyframesRule
```

### Truy cập theo chỉ mục

`CSSKeyframesRule` có thể được lập chỉ mục như một mảng và hoạt động tương tự như thuộc tính {{domxref("CSSKeyframesRule.cssRules", "cssRules")}} của nó.

```js
const keyframes = document.styleSheets[0].cssRules[0];

for (let i = 0; i < keyframes.length; i++) {
  console.log(keyframes[i].keyText);
}

// Output:
// 0%
// 100%
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@keyframes")}}
- {{domxref("CSSKeyFrameRule")}}
