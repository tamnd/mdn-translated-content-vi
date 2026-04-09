---
title: "<sub>: The Subscript element"
slug: Web/HTML/Reference/Elements/sub
page-type: html-element
browser-compat: html.elements.sub
sidebar: htmlsidebar
---

Phần tử **`<sub>`** trong [HTML](/en-US/docs/Web/HTML) chỉ định văn bản nội tuyến cần được hiển thị dưới dạng chỉ số dưới vì lý do kiểu chữ đơn thuần. Chỉ số dưới thường được hiển thị với đường cơ sở thấp hơn sử dụng chữ nhỏ hơn.

{{InteractiveExample("HTML Demo: &lt;sub&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  Almost every developer's favorite molecule is
  C<sub>8</sub>H<sub>10</sub>N<sub>4</sub>O<sub>2</sub>, also known as
  "caffeine."
</p>
```

```css interactive-example
p {
  font:
    1rem "Fira Sans",
    sans-serif;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Phần tử `<sub>` chỉ nên được dùng vì lý do kiểu chữ — tức là để thay đổi vị trí của văn bản nhằm tuân thủ các quy ước hoặc tiêu chuẩn kiểu chữ, thay vì chỉ vì mục đích trình bày hoặc ngoại hình.

Ví dụ, dùng `<sub>` để tạo kiểu tên của một công ty sử dụng đường cơ sở thay đổi trong [wordmark](https://en.wikipedia.org/wiki/Wordmark) của họ là không phù hợp; thay vào đó, nên dùng CSS. Ví dụ, bạn có thể dùng thuộc tính {{cssxref("vertical-align")}} với khai báo như `vertical-align: sub` hoặc, để kiểm soát chính xác hơn việc dịch chuyển đường cơ sở, `vertical-align: -25%`.

Các trường hợp sử dụng phù hợp cho `<sub>` bao gồm (nhưng không nhất thiết giới hạn ở):

- Đánh dấu số chú thích cuối trang. Xem [Số chú thích cuối trang](#footnote_numbers) để xem ví dụ.
- Đánh dấu chỉ số dưới trong số biến toán học (mặc dù bạn cũng có thể xem xét sử dụng công thức [MathML](/en-US/docs/Web/MathML) cho điều này). Xem [Chỉ số dưới biến](#variable_subscripts).
- Biểu thị số nguyên tử của một nguyên tố trong công thức hóa học (như người bạn tốt nhất của mọi nhà phát triển, C<sub>8</sub>H<sub>10</sub>N<sub>4</sub>O<sub>2</sub>, còn được gọi là "caffeine"). Xem [Công thức hóa học](#chemical_formulas).

## Ví dụ

### Số chú thích cuối trang

Chú thích cuối trang truyền thống được biểu thị bằng các số được hiển thị dưới dạng chỉ số dưới. Đây là trường hợp sử dụng phổ biến cho `<sub>`:

```html
<p>
  According to the computations by Nakamura, Johnson, and Mason<sub>1</sub> this
  will result in the complete annihilation of both particles.
</p>
```

#### Kết quả

{{EmbedLiveSample("Footnote_numbers", 650, 80)}}

### Chỉ số dưới biến

Trong toán học, các họ biến liên quan đến cùng một khái niệm (chẳng hạn như khoảng cách dọc theo cùng một trục) được biểu thị bằng cùng tên biến với chỉ số dưới theo sau. Ví dụ:

```html-nolint
<p>
  The horizontal coordinates' positions along the X-axis are represented as
  <var>x<sub>1</sub></var> … <var>x<sub>n</sub></var>.
</p>
```

#### Kết quả

{{EmbedLiveSample("Variable_subscripts", 650, 80)}}

### Công thức hóa học

Khi viết công thức hóa học, chẳng hạn như H<sub>2</sub>O, số nguyên tử của một nguyên tố trong phân tử được mô tả được biểu thị bằng một số dưới dạng chỉ số dưới; trong trường hợp nước, số "2" dưới dạng chỉ số dưới chỉ ra rằng có hai nguyên tử hydro trong phân tử.

Ví dụ khác:

```html
<p>
  Almost every developer's favorite molecule is
  C<sub>8</sub>H<sub>10</sub>N<sub>4</sub>O<sub>2</sub>, which is commonly known
  as "caffeine."
</p>
```

#### Kết quả

{{EmbedLiveSample("Chemical_formulas", 650, 120)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, nội dung rõ ràng.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents">subscript</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("sup")}} tạo ra chỉ số trên. Lưu ý rằng bạn không thể dùng `sup` và `sub` cùng lúc: bạn cần dùng [MathML](/en-US/docs/Web/MathML) để tạo ra cả chỉ số trên ngay phía trên chỉ số dưới bên cạnh ký hiệu hóa học của một nguyên tố, đại diện cho số nguyên tử và số khối của nó.
- Các phần tử MathML [`<msub>`](/en-US/docs/Web/MathML/Reference/Element/msub), [`<msup>`](/en-US/docs/Web/MathML/Reference/Element/msup), và [`<msubsup>`](/en-US/docs/Web/MathML/Reference/Element/msubsup).
- Thuộc tính CSS {{cssxref("vertical-align")}}.
