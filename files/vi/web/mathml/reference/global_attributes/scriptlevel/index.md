---
title: scriptlevel
slug: Web/MathML/Reference/Global_attributes/scriptlevel
page-type: mathml-attribute
browser-compat: mathml.global_attributes.scriptlevel
sidebar: mathmlref
---

Thuộc tính [toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) **`scriptlevel`** đặt [math-depth](/en-US/docs/Web/CSS/Reference/Properties/math-depth) của một phần tử MathML. Nó cho phép ghi đè các quy tắc từ [user agent stylesheet](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#user-agent_stylesheets) vốn xác định việc tính toán tự động [font-size](/en-US/docs/Web/CSS/Reference/Properties/font-size) trong các công thức MathML.

## Cú pháp

```html-nolint
<math scriptlevel="-1"> <!-- giảm math-depth đi 1 -->
<math scriptlevel="+2"> <!-- tăng math-depth lên 2 -->
<math scriptlevel="0"> <!-- đặt lại math-depth về 0 -->
```

### Giá trị

Nếu `<U>` là một [số nguyên](/en-US/docs/Web/CSS/Reference/Values/integer) không dấu (tức là đã bỏ ký hiệu dấu ở đầu) thì các giá trị được chấp nhận là:

- `<U>`
  - : Đặt `math-depth` thành giá trị `<U>`. Điều này sẽ đặt `font-size` của phần tử bằng giá trị của các phần tử ở độ sâu được chỉ định.
- `+<U>`
  - : Đặt `math-depth` thành giá trị `add(<U>)`. Điều này sẽ thu nhỏ `font-size` của phần tử `<U>` lần.
- `-<U>`
  - : Đặt `math-depth` thành giá trị `add(-<U>)`. Điều này sẽ phóng to `font-size` của phần tử `<U>` lần.

## Ví dụ

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
}

math {
  font-size: 24px;
}
```

```html
<!-- math-depth mặc định là 0 trên phần tử gốc <math>. -->
<math>
  <msubsup>
    <!-- math-depth và font-size không đổi ở phần cơ sở. -->
    <mtext>base</mtext>
    <!-- math-depth mặc định là add(1) bên trong chỉ số dưới, nên nó
         tăng thêm 1 và font-size bị thu nhỏ một lần. -->
    <mtext>subscript</mtext>
    <!-- math-depth cũng mặc định là add(1) bên trong chỉ số trên, nhưng
         thuộc tính scriptlevel nói rằng hãy tăng thêm 2 thay vì 1,
         nên font-size thực tế bị thu nhỏ hai lần. -->
    <mtext scriptlevel="+2">superscript</mtext>
  </msubsup>
</math>
```

{{EmbedLiveSample("Example", "", "150")}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).
- Thuộc tính toàn cục [displaystyle](/en-US/docs/Web/MathML/Reference/Global_attributes/displaystyle).
- {{cssxref("font-size")}}
- {{cssxref("math-depth")}}
- {{cssxref("math-style")}}
