---
title: "CSSKeyframesRule: phương thức findRule()"
short-title: findRule()
slug: Web/API/CSSKeyframesRule/findRule
page-type: web-api-instance-method
browser-compat: api.CSSKeyframesRule.findRule
---

{{APIRef("CSSOM") }}

Phương thức **`findRule()`** của giao diện {{domxref("CSSKeyframeRule")}} tìm {{domxref("CSSKeyFrameRule")}} khớp với bộ chọn keyframe đã chỉ định.

## Cú pháp

```js-nolint
findRule(select)
```

### Tham số

- `select`
  - : Một chuỗi chứa [bộ chọn keyframe](/en-US/docs/Web/CSS/Reference/Selectors/Keyframe_selectors) của quy tắc cần tìm, phải là:
    - một danh sách phần trăm phân cách bằng dấu phẩy giữa 0% và 100%;
    - hoặc các từ khóa `from` hoặc `to`.

    Lưu ý rằng số lượng và thứ tự các giá trị trong bộ chọn keyframe đã chỉ định phải khớp với các quy tắc keyframe mục tiêu. Khoảng trắng được bỏ qua.

### Giá trị trả về

Một {{domxref("CSSKeyframeRule")}} là quy tắc khớp cuối cùng. Nếu không tìm thấy quy tắc nào, không có gì được trả về.

## Ví dụ

CSS bao gồm một keyframes at-rule. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`.
`myRules[0]` trả về một đối tượng {{domxref("CSSKeyframesRule")}}. Gọi findRule("to") trả về một {{domxref("CSSKeyframeRule")}} đại diện cho quy tắc thứ hai.

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
console.log(keyframes.findRule("to")); // a CSSKeyframeRule object
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
