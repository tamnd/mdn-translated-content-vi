---
title: <mfenced>
slug: Web/MathML/Reference/Element/mfenced
page-type: mathml-element
status:
  - deprecated
  - non-standard
browser-compat: mathml.elements.mfenced
sidebar: mathmlref
---

{{Deprecated_Header}}{{Non-standard_Header}}

Phần tử **`<mfenced>`** [MathML](/en-US/docs/Web/MathML) cung cấp khả năng thêm các dấu mở và đóng tùy chỉnh, chẳng hạn dấu ngoặc, cùng các ký tự phân tách như dấu phẩy hoặc dấu chấm phẩy vào một biểu thức.

> [!NOTE]
> Trong lịch sử, phần tử `<mfenced>` được định nghĩa như một cách viết tắt để ghi các biểu thức có bao ngoặc và tương đương với dạng mở rộng dùng các phần tử {{MathMLElement("mrow")}} và {{MathMLElement("mo")}}. Ngày nay, nên dùng trực tiếp dạng tương đương đó thay thế.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).

- `close`
  - : Một chuỗi cho dấu phân tách đóng. Giá trị mặc định là `")"` và mọi khoảng trắng sẽ bị loại bỏ.
- `open`
  - : Một chuỗi cho dấu phân tách mở. Giá trị mặc định là `"("` và mọi khoảng trắng sẽ bị loại bỏ.
- `separators`
  - : Một chuỗi gồm không hoặc nhiều ký tự sẽ được dùng cho các dấu phân tách khác nhau, tùy chọn chia bởi khoảng trắng, phần này bị bỏ qua. Giá trị mặc định là `,`. Bằng cách chỉ định nhiều hơn một ký tự, có thể đặt các dấu phân tách khác nhau cho từng đối số trong biểu thức. Nếu có quá nhiều dấu phân tách, phần thừa sẽ bị bỏ qua. Nếu có quá ít dấu phân tách trong biểu thức, dấu phân tách được chỉ định cuối cùng sẽ được lặp lại.

## Ví dụ

### Dấu phân tách cuối cùng được lặp lại

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
  font-size: 2rem;
}
```

```html
<math display="block">
  <mfenced open="{" close="}" separators=";;,">
    <mi>a</mi>
    <mi>b</mi>
    <mi>c</mi>
    <mi>d</mi>
    <mi>e</mi>
  </mfenced>
</math>
```

Kết quả mẫu:

![{a;b;c,d,e}](mfenced-repeated.svg)

Kết quả hiển thị trong trình duyệt của bạn:

{{ EmbedLiveSample('mfenced_example1', 700, 200, "", "") }}

### Bỏ qua mọi phần dư

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
  font-size: 2rem;
}
```

```html
<math display="block">
  <mfenced open="[" close="]" separators="||||,">
    <mi>a</mi>
    <mi>b</mi>
    <mi>c</mi>
    <mi>d</mi>
    <mi>e</mi>
  </mfenced>
</math>
```

Kết quả mẫu:

![[a|b|c|d|e]](mfenced-ignored.svg)

Kết quả hiển thị trong trình duyệt của bạn:

{{ EmbedLiveSample('mfenced_example1', 700, 200, "", "") }}

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

Phần tử `<mfenced>` không được định nghĩa trong bất kỳ đặc tả nào hướng tới trình duyệt, nhưng bạn có thể tìm thấy mô tả trong [MathML 4](https://w3c.github.io/mathml/#presm_mfenced).

## Tương thích trình duyệt

{{Compat}}
