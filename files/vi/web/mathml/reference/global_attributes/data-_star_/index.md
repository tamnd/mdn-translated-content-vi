---
title: data-*
slug: Web/MathML/Reference/Global_attributes/data-*
page-type: mathml-attribute
browser-compat: mathml.global_attributes.data_attributes
sidebar: mathmlref
---

Các thuộc tính MathML **`data-*`** được gọi là thuộc tính dữ liệu tùy biến. Chúng cho phép markup MathML và DOM kết quả của nó chia sẻ thông tin mà các thuộc tính chuẩn không thể cung cấp, thường nhằm phục vụ cho việc scripting. Dữ liệu tùy biến của chúng có thể truy cập thông qua giao diện {{domxref("MathMLElement")}} của phần tử mà thuộc tính thuộc về, với thuộc tính {{domxref("MathMLElement.dataset")}}.

Dấu `*` có thể được thay thế bằng bất kỳ ký tự nào được phép theo [quy tắc đặt tên của XML](https://www.w3.org/TR/xml/#NT-Name), với các hạn chế sau:

- Không được bắt đầu bằng `xml`.
- Không có dấu chấm phẩy (`;`, `U+003A`).
- Không có các chữ cái viết hoa từ `A` đến `Z`.

> [!NOTE]
> Thuộc tính {{domxref("MathMLElement.dataset")}} là một {{domxref("DOMStringMap")}} cung cấp thuộc tính `data-test-value` thông qua `MathMLElement.dataset.testValue`. Ký tự gạch nối (`-`, `U+002D`) bị loại bỏ và chữ cái kế tiếp được viết hoa, tạo thành định dạng {{Glossary("camel_case", "camel case")}}.

Bạn có thể dùng thuộc tính này với bất kỳ phần tử MathML nào.

## Ví dụ

```html
<math>
  <msup data-formula="euler" data-value="-1">
    <mi>e</mi>
    <mrow><mi>i</mi> <mi>π</mi></mrow>
  </msup>
  <mo>+</mo>
  <mn>1</mn>
  <mo>=</mo>
  <mn>0</mn>
</math>
```

```js
const msupElement = document.querySelector("msup");
console.log(msupElement.dataset.formula); // "euler"
console.log(msupElement.dataset.value); // "-1"
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MathMLElement")}}
- Thuộc tính {{domxref("MathMLElement.dataset")}} được dùng để truy cập các thuộc tính này từ script.
- [Sử dụng thuộc tính data](/en-US/docs/Web/HTML/How_to/Use_data_attributes)
