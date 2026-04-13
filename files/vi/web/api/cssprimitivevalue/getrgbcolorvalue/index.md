---
title: "CSSPrimitiveValue: getRGBColorValue() method"
short-title: getRGBColorValue()
slug: Web/API/CSSPrimitiveValue/getRGBColorValue
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.CSSPrimitiveValue.getRGBColorValue
---

{{APIRef("CSSOM")}}{{deprecated_header}}

Phương thức **`getRGBColorValue()`** của giao diện {{domxref("CSSPrimitiveValue")}} dùng để lấy giá trị màu RGB. Nếu giá trị CSS này không chứa giá trị màu RGB, một {{domxref("DOMException")}} sẽ được ném ra. Việc sửa đổi thuộc tính style tương ứng có thể được thực hiện bằng giao diện {{domxref("RGBColor")}}.

> [!NOTE]
> Phương thức này là một phần của nỗ lực tạo ra CSS Object Model có kiểu. Nỗ lực này đã bị từ bỏ và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Cú pháp

```js-nolint
getRGBColorValue()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("RGBColor")}} đại diện cho giá trị màu.

### Ngoại lệ

| **Kiểu**       | **Mô tả**                                                                                                                               |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `DOMException` | Một `INVALID_ACCESS_ERR` được ném ra nếu thuộc tính gắn kèm không thể trả về giá trị màu RGB (tức là đây không phải là `CSS_RGBCOLOR`). |

## Ví dụ

```js
const cs = window.getComputedStyle(document.body);
const cssValue = cs.getPropertyCSSValue("color");
console.log(cssValue.getRGBColorValue());
```

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng kể từ đó đã bị loại bỏ khỏi mọi nỗ lực chuẩn hóa.

Nó đã được thay thế bởi một [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại nhưng không tương thích, hiện đang trong lộ trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}
