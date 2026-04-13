---
title: "CSSValue: thuộc tính cssValueType"
short-title: cssValueType
slug: Web/API/CSSValue/cssValueType
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.CSSValue.cssValueType
---

{{APIRef("CSSOM")}}{{Deprecated_header}}

Thuộc tính chỉ đọc **`cssValueType`** của giao diện {{domxref("CSSValue")}} đại diện cho kiểu của giá trị thuộc tính CSS tính toán hiện tại.

> [!NOTE]
> Thuộc tính này là một phần của nỗ lực tạo ra một CSS Object Model có kiểu. Nỗ lực này đã bị bỏ dở và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Giá trị

Một `unsigned short` đại diện cho mã xác định kiểu giá trị. Các giá trị có thể là:

<table class="no-markdown">
  <thead>
    <tr>
      <th>Hằng số</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>CSS_CUSTOM</code></td>
      <td>Giá trị là một giá trị tùy chỉnh.</td>
    </tr>
    <tr>
      <td><code>CSS_INHERIT</code></td>
      <td>
        Giá trị được kế thừa và <code>cssText</code> chứa
        <code>"inherit"</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_PRIMITIVE_VALUE</code></td>
      <td>
        Giá trị là một giá trị nguyên thủy và một phiên bản của giao diện
        {{domxref("CSSPrimitiveValue")}} có thể được lấy bằng cách sử dụng các phương thức
        cast cụ thể của binding trên phiên bản này của giao diện <code>CSSValue</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_VALUE_LIST</code></td>
      <td>
        Giá trị là một danh sách <code>CSSValue</code> và một phiên bản của giao diện
        {{domxref("CSSValueList")}} có thể được lấy bằng cách sử dụng các phương thức
        cast cụ thể của binding trên phiên bản này của giao diện <code>CSSValue</code>.
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

```js
const styleDeclaration = document.styleSheets[0].cssRules[0].style;
const cssValue = styleDeclaration.getPropertyCSSValue("color");
console.log(cssValue.cssValueType);
```

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng đã bị loại bỏ khỏi bất kỳ nỗ lực tiêu chuẩn hóa nào kể từ đó.

Nó đã được thay thế bởi [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại hơn nhưng không tương thích, hiện đang trong tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}
