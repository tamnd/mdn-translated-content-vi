---
title: "CSSMediaRule: media property"
short-title: media
slug: Web/API/CSSMediaRule/media
page-type: web-api-instance-property
browser-compat: api.CSSMediaRule.media
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`media`** của giao diện {{domxref("CSSMediaRule")}} chứa đối tượng {{domxref("MediaList")}} đại diện cho danh sách media query của quy tắc {{cssxref("@media")}}.

## Giá trị

Một đối tượng {{domxref("MediaList")}}.

Mặc dù bản thân thuộc tính `media` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `MediaList`, bạn vẫn có thể gán cho thuộc tính `media` trực tiếp, tương đương với việc gán cho thuộc tính {{domxref("MediaList/mediaText", "mediaText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `MediaList` bằng cách sử dụng các phương thức {{domxref("MediaList/appendMedium", "appendMedium()")}} và {{domxref("MediaList/deleteMedium", "deleteMedium()")}}.

## Ví dụ

CSS bao gồm một media query với một quy tắc kiểu. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`.
Gọi `myRules[0].media` do đó trả về đối tượng {{domxref("MediaList")}} đại diện cho media query.

```css
@media (width >= 500px) {
  body {
    color: blue;
  }
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].media); // a MediaList
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
