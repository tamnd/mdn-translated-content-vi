---
title: <maction>
slug: Web/MathML/Reference/Element/maction
page-type: mathml-element
status:
  - deprecated
browser-compat: mathml.elements.maction
sidebar: mathmlref
---

{{Deprecated_Header}}

Phần tử **`<maction>`** [MathML](/en-US/docs/Web/MathML) cho phép gắn các hành động vào biểu thức toán học. Theo mặc định, chỉ phần tử con đầu tiên được hiển thị, nhưng một số trình duyệt có thể xét đến các thuộc tính `actiontype` và `selection` để triển khai hành vi tùy biến.

> [!NOTE]
> Trong lịch sử, phần tử này cung cấp một cơ chế để làm cho các công thức MathML có tính tương tác. Ngày nay, nên dựa vào [JavaScript](/en-US/docs/Web/JavaScript) và các công nghệ Web khác để triển khai trường hợp sử dụng này.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với các thuộc tính sau:

- `actiontype` {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Hành động chỉ định điều gì xảy ra với phần tử này. Một số trình duyệt đã triển khai hành vi đặc biệt cho các giá trị sau:
    - `statusline`: Nếu có nhấp vào _biểu thức_ hoặc người đọc di chuyển con trỏ qua nó, _thông báo_ sẽ được gửi tới thanh trạng thái của trình duyệt. Cú pháp là: `<maction actiontype="statusline"> expression message </maction>`.
    - `toggle`: Khi có nhấp vào biểu thức con, việc hiển thị sẽ luân phiên giữa các biểu thức con được chọn. Vì vậy, mỗi lần nhấp sẽ tăng giá trị `selection` lên.
      Cú pháp là: `<maction actiontype="toggle" selection="positive-integer" > expression1 expression2 expressionN </maction>`.

- `selection` {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Phần tử con hiện đang hiển thị, chỉ được xét đến đối với `actiontype="toggle"` hoặc các giá trị `actiontype` không chuẩn. Giá trị mặc định là `1`, tức phần tử con đầu tiên.

## Ví dụ

Ví dụ sau dùng `actiontype` "toggle":

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-content: center;
}

math {
  font-size: 1.5em;
}

maction {
  padding: 0.5em;
  cursor: pointer;
}
```

```html
<p>Hãy thử nhấp vào công thức này vài lần:</p>
<math display="block">
  <maction actiontype="toggle">
    <mfrac>
      <mn>6</mn>
      <mn>8</mn>
    </mfrac>

    <mfrac>
      <mrow>
        <mn>3</mn>
        <mo>×</mo>
        <mn>2</mn>
      </mrow>
      <mrow>
        <mn>4</mn>
        <mo>×</mo>
        <mn>2</mn>
      </mrow>
    </mfrac>

    <mfrac>
      <mn>3</mn>
      <mn>4</mn>
    </mfrac>
  </maction>
</math>
```

Kết quả mẫu:

![Ví dụ hành động toggle trong MathML](toggle.gif)

Kết quả hiển thị trong trình duyệt của bạn:

{{EmbedLiveSample('Examples', 700, 200)}}

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
