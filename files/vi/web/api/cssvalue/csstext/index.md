---
title: "CSSValue: thuộc tính cssText"
short-title: cssText
slug: Web/API/CSSValue/cssText
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.CSSValue.cssText
---

{{APIRef("CSSOM")}}{{Deprecated_header}}

Thuộc tính **`cssText`** của giao diện {{domxref("CSSValue")}} đại diện cho giá trị thuộc tính CSS tính toán hiện tại.

> [!NOTE]
> Thuộc tính này là một phần của nỗ lực tạo ra một CSS Object Model có kiểu. Nỗ lực này đã bị bỏ dở và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Giá trị

Một chuỗi đại diện cho giá trị thuộc tính CSS hiện tại.

## Ví dụ

```js
const styleDeclaration = document.styleSheets[0].cssRules[0].style;
const cssValue = styleDeclaration.getPropertyCSSValue("color");
console.log(cssValue.cssText);
```

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng đã bị loại bỏ khỏi bất kỳ nỗ lực tiêu chuẩn hóa nào kể từ đó.

Nó đã được thay thế bởi [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn nhưng không tương thích, hiện đang trong tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSStyleDeclaration.getPropertyCSSValue()")}}
