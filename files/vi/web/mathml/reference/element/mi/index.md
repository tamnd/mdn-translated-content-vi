---
title: <mi>
slug: Web/MathML/Reference/Element/mi
page-type: mathml-element
browser-compat: mathml.elements.mi
sidebar: mathmlref
---

Phần tử **`<mi>`** [MathML](/en-US/docs/Web/MathML) cho biết nội dung nên được hiển thị như một **định danh**, chẳng hạn tên hàm, biến hoặc hằng ký hiệu.

Theo mặc định, các phần tử `<mi>` chứa nhiều ký tự được hiển thị như văn bản bình thường, còn các phần tử một ký tự được hiển thị kiểu nghiêng: cùng hành vi định dạng như thuộc tính CSS {{cssxref("text-transform")}} với giá trị `math-auto`.
Thuộc tính `mathvariant` với giá trị `normal` có thể được dùng để đặt lại một ký tự đơn về phông chữ bình thường.

Để sử dụng một dạng ký tự cụ thể như đậm/nghiêng, serif, sans-serif, script/calligraphy, đơn cách, double-struck, v.v., bạn nên dùng các [Ký hiệu toán học chữ và số](https://en.wikipedia.org/wiki/Mathematical_Alphanumeric_Symbols) thích hợp.

> [!NOTE]
> Trong một đặc tả trước đây (MathML3), thuộc tính `mathvariant` được dùng để xác định các lớp logic có thể áp dụng định dạng ký tự cho các ký hiệu toán học chữ và số.
> Các giá trị liên quan hiện đã lỗi thời và dự kiến sẽ bị loại bỏ khỏi trình duyệt trong các bản phát hành tương lai.

## Thuộc tính

- `mathvariant`
  - : Giá trị duy nhất được phép trong đặc tả hiện tại là `normal` (không phân biệt chữ hoa/thường):
    - `normal`
      - : Dùng cách hiển thị mặc định/bình thường, loại bỏ việc tự động làm nghiêng các ký tự đơn.

    Các giá trị cũ đã lỗi thời là:
    - `bold` {{deprecated_inline}}
      - : Cố gắng dùng ký tự đậm, ví dụ "𝐀".
    - `italic` {{deprecated_inline}}
      - : Cố gắng dùng ký tự nghiêng, ví dụ "𝐴".
    - `bold-italic` {{deprecated_inline}}
      - : Cố gắng dùng ký tự đậm-nghiêng, ví dụ "𝑨".
    - `double-struck` {{deprecated_inline}}
      - : Cố gắng dùng ký tự double-struck, ví dụ "𝔸".
    - `bold-fraktur` {{deprecated_inline}}
      - : Cố gắng dùng ký tự fraktur đậm, ví dụ "𝕬".
    - `script` {{deprecated_inline}}
      - : Cố gắng dùng ký tự script, ví dụ "𝒜".
    - `bold-script` {{deprecated_inline}}
      - : Cố gắng dùng ký tự script đậm, ví dụ "𝓐".
    - `fraktur` {{deprecated_inline}}
      - : Cố gắng dùng ký tự fraktur, ví dụ "𝔄".
    - `sans-serif` {{deprecated_inline}}
      - : Cố gắng dùng ký tự sans-serif, ví dụ "𝖠".
    - `bold-sans-serif` {{deprecated_inline}}
      - : Cố gắng dùng ký tự sans-serif đậm, ví dụ "𝗔".
    - `sans-serif-italic` {{deprecated_inline}}
      - : Cố gắng dùng ký tự sans-serif nghiêng, ví dụ "𝘈".
    - `sans-serif-bold-italic` {{deprecated_inline}}
      - : Cố gắng dùng ký tự sans-serif đậm-nghiêng, ví dụ "𝘼".
    - `monospace` {{deprecated_inline}}
      - : Cố gắng dùng ký tự đơn cách, ví dụ "𝙰".
    - `initial` {{deprecated_inline}}
      - : Cố gắng dùng ký tự initial, ví dụ "𞸢".
    - `tailed` {{deprecated_inline}}
      - : Cố gắng dùng ký tự tailed, ví dụ "𞹂".
    - `looped` {{deprecated_inline}}
      - : Cố gắng dùng ký tự looped, ví dụ "𞺂".
    - `stretched` {{deprecated_inline}}
      - : Cố gắng dùng ký tự stretched, ví dụ "𞹢".

Phần tử này cũng chấp nhận [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).

## Ví dụ

```html
<math display="block">
  <!-- Nhiều ký tự được hiển thị như văn bản "bình thường" -->
  <mi>sin</mi>
</math>
<hr />
<math display="block">
  <!-- Một ký tự được hiển thị nghiêng theo mặc định (tức "A" hiển thị thành "𝐴") -->
  <mi>A</mi>
</math>
<hr />
<math display="block">
  <!-- Dùng mathvariant="normal" để một ký tự đơn hiển thị như văn bản bình thường -->
  <mi mathvariant="normal">F</mi>
</math>
<hr />
<math display="block">
  <!-- Để dùng một biến thể cụ thể, chẳng hạn "B" ở dạng Fraktur -->
  <mi>𝔅</mi>
</math>
```

{{ EmbedLiveSample('mi_example', 400, 100) }}

## Tóm tắt kỹ thuật

<table class="properties">
  <tr>
    <th scope="row">
      <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles">Vai trò ARIA ngầm định</a>
    </th>
    <td>
      Không có
    </td>
  </tr>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
