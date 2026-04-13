---
title: "CSSKeyframeRule: thuộc tính keyText"
short-title: keyText
slug: Web/API/CSSKeyframeRule/keyText
page-type: web-api-instance-property
browser-compat: api.CSSKeyframeRule.keyText
---

{{APIRef("CSSOM") }}

Thuộc tính **`keyText`** của giao diện {{domxref("CSSKeyframeRule")}} biểu thị [bộ chọn keyframe](/en-US/docs/Web/CSS/Reference/Selectors/Keyframe_selectors) dưới dạng danh sách các giá trị phần trăm được phân tách bằng dấu phẩy. Các từ khóa from và to lần lượt ánh xạ tới 0% và 100%.

## Giá trị

Một chuỗi.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Được ném ra nếu `keyText` được cập nhật với một bộ chọn keyframe không hợp lệ, trong trường hợp đó `keyText` vẫn không thay đổi.

## Ví dụ

CSS bao gồm một at-rule keyframes. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`. `myRules[0]` trả về một đối tượng {{domxref("CSSKeyframesRule")}}, sẽ chứa các đối tượng {{domxref("CSSKeyFrameRule")}} riêng lẻ cho mỗi keyframe.

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
console.log(keyframes[0].keyText); // a string containing 0%
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
