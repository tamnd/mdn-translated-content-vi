---
title: "CSSStyleDeclaration: phương thức getPropertyCSSValue()"
short-title: getPropertyCSSValue()
slug: Web/API/CSSStyleDeclaration/getPropertyCSSValue
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.CSSStyleDeclaration.getPropertyCSSValue
---

{{ APIRef("CSSOM") }} {{deprecated_header}}

Phương thức giao diện **CSSStyleDeclaration.getPropertyCSSValue()** trả về một {{domxref('CSSValue')}} chứa giá trị CSS cho một thuộc tính. Lưu ý rằng nó trả về `null` nếu tên thuộc tính là một thuộc tính shorthand.

> [!NOTE]
> Giao diện này là một phần của nỗ lực tạo Mô hình Đối tượng CSS có kiểu. Nỗ lực này đã bị từ bỏ và hầu hết các trình duyệt đều không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - {{domxref("CSSStyleDeclaration.getPropertyValue()")}} của [Mô hình Đối tượng CSS](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - {{domxref("Element.computedStyleMap()")}} của [API Mô hình Đối tượng CSS có kiểu](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Cú pháp

```js-nolint
getPropertyCSSValue(property)
```

### Tham số

- `property`
  - : Một chuỗi đại diện cho tên thuộc tính cần truy xuất.

### Giá trị trả về

Một {{domxref('CSSValue')}} chứa giá trị CSS cho một thuộc tính. Nếu không tồn tại, trả về `null`.

## Ví dụ

Mã JavaScript sau đây lấy một đối tượng chứa các giá trị RGB đã tính toán của thuộc tính CSS `color`:

```js
const style = window.getComputedStyle(elem, null);
const rgbObj = style.getPropertyCSSValue("color").getRGBColorValue();
```

## Đặc tả kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả kỹ thuật [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng đã bị loại bỏ khỏi mọi nỗ lực chuẩn hóa kể từ đó.

Nó đã được thay thế bằng [API Mô hình Đối tượng CSS có kiểu](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại, không tương thích, hiện đang nằm trong quá trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}
