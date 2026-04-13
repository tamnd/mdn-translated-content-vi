---
title: "CSSKeyframesRule: phương thức deleteRule()"
short-title: deleteRule()
slug: Web/API/CSSKeyframesRule/deleteRule
page-type: web-api-instance-method
browser-compat: api.CSSKeyframesRule.deleteRule
---

{{APIRef("CSSOM") }}

Phương thức **`deleteRule()`** của giao diện {{domxref("CSSKeyframeRule")}} xóa {{domxref("CSSKeyFrameRule")}} khớp với bộ chọn keyframe đã chỉ định.

## Cú pháp

```js-nolint
deleteRule(select)
```

### Tham số

- `select`
  - : Một chuỗi chứa [bộ chọn keyframe](/en-US/docs/Web/CSS/Reference/Selectors/Keyframe_selectors) của quy tắc cần xóa, phải là:
    - một danh sách phần trăm phân cách bằng dấu phẩy giữa 0% và 100%;
    - hoặc các từ khóa `from` hoặc `to`.

    Lưu ý rằng số lượng và thứ tự các giá trị trong bộ chọn keyframe đã chỉ định phải khớp với các quy tắc keyframe mục tiêu. Khoảng trắng được bỏ qua.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

CSS bao gồm một keyframes at-rule. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`.
`myRules[0]` trả về một đối tượng {{domxref("CSSKeyframesRule")}}. Trả về thuộc tính `cssRules` sẽ trả về một {{domxref("CSSRuleList")}} chứa hai quy tắc.

Sau khi xóa một quy tắc với `deleteRule()`, thuộc tính `cssRules` trả về một {{domxref("CSSRuleList")}} chứa một quy tắc.

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
let myRules = document.styleSheets[0].cssRules;
let keyframes = myRules[0]; // a CSSKeyframesRule
keyframes.deleteRule("to");
console.log(keyframes.cssRules); // a CSSRuleList object with one rule
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
