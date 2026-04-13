---
title: CSSMediaRule
slug: Web/API/CSSMediaRule
page-type: web-api-interface
browser-compat: api.CSSMediaRule
---

{{ APIRef("CSSOM") }}

Giao diện **`CSSMediaRule`** đại diện cho một quy tắc CSS {{cssxref("@media")}} duy nhất.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ các lớp tổ tiên {{domxref("CSSConditionRule")}}, {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

- {{domxref("CSSMediaRule.media")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("MediaList")}} đại diện cho phương tiện đích dự kiến cho thông tin kiểu.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa phương thức từ các lớp tổ tiên {{domxref("CSSConditionRule")}}, {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

## Ví dụ

CSS bên dưới bao gồm một media query với một quy tắc kiểu.
Cơ sở hạ tầng [live sample](/en-US/docs/MDN/Writing_guidelines/Page_structures/Live_samples) của MDN kết hợp tất cả các khối CSS trong ví dụ thành một kiểu nội tuyến duy nhất với id `css-output`, vì vậy chúng ta đầu tiên sử dụng {{domxref("document.getElementById()")}} để tìm sheet đó.
`myRules[0]` trả về đối tượng `CSSMediaRule`, từ đó chúng ta có thể lấy `mediaText`.

```html
<p id="log"></p>
```

```css
@media (width >= 500px) {
  body {
    color: blue;
  }
}
```

```js
const log = document.getElementById("log");
const myRules = document.getElementById("css-output").sheet.cssRules;
const mediaList = myRules[0]; // a CSSMediaRule representing the media query.
log.textContent += ` ${mediaList.media.mediaText}`;
```

{{EmbedLiveSample("Examples","100%","50px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
