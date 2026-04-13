---
title: "CSSFontFaceRule: thuộc tính style"
short-title: style
slug: Web/API/CSSFontFaceRule/style
page-type: web-api-instance-property
browser-compat: api.CSSFontFaceRule.style
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`style`** của giao diện {{domxref("CSSFontFaceRule")}} trả về một đối tượng {{domxref("CSSFontFaceDescriptors")}} đại diện cho các descriptor có sẵn trong phần thân at-rule {{cssxref("@font-face")}}.

## Giá trị

Một đối tượng {{domxref("CSSFontFaceDescriptors")}}.

Mặc dù bản thân thuộc tính `style` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSFontFaceDescriptors`, bạn vẫn có thể gán trực tiếp cho thuộc tính `style`, tương đương với việc gán cho thuộc tính {{domxref("CSSStyleDeclaration/cssText", "cssText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `CSSFontFaceDescriptors` bằng cách sử dụng các phương thức {{domxref("CSSStyleDeclaration/setProperty", "setProperty()")}} và {{domxref("CSSStyleDeclaration/removeProperty", "removeProperty()")}}.

## Ví dụ

Ví dụ này sử dụng CSS tìm thấy trong trang {{cssxref("@font-face")}}. {{domxref("CSSRule")}} đầu tiên được trả về sẽ là một `CSSFontFaceRule`. Thuộc tính `style` trả về một đối tượng {{domxref("CSSFontFaceDescriptors")}} với các thuộc tính `fontFamily`, `fontWeight` và `src` được điền thông tin từ quy tắc.

```css
@font-face {
  font-family: "MyHelvetica";
  src:
    local("Helvetica Neue Bold"), local("HelveticaNeue-Bold"),
    url("MgOpenModernaBold.woff2");
  font-weight: bold;
}
```

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].style); // A CSSFontFaceDescriptors
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
