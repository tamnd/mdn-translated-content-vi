---
title: "<sup>: The Superscript element"
slug: Web/HTML/Reference/Elements/sup
page-type: html-element
browser-compat: html.elements.sup
sidebar: htmlsidebar
---

Phần tử **`<sup>`** trong [HTML](/en-US/docs/Web/HTML) chỉ định văn bản nội tuyến cần được hiển thị dưới dạng chỉ số trên vì lý do kiểu chữ đơn thuần. Chỉ số trên thường được hiển thị với đường cơ sở cao hơn sử dụng chữ nhỏ hơn.

{{InteractiveExample("HTML Demo: &lt;sup&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  The <em>Pythagorean theorem</em> is often expressed as the following equation:
</p>

<p>
  <var>a<sup>2</sup></var> + <var>b<sup>2</sup></var> = <var>c<sup>2</sup></var>
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

Phần tử `<sup>` chỉ nên được dùng vì lý do kiểu chữ — tức là để thay đổi vị trí của văn bản nhằm tuân thủ các quy ước hoặc tiêu chuẩn kiểu chữ, thay vì chỉ vì mục đích trình bày hoặc ngoại hình.

Ví dụ, để tạo kiểu [wordmark](https://en.wikipedia.org/wiki/Wordmark) của một doanh nghiệp hoặc sản phẩm sử dụng đường cơ sở cao hơn nên được thực hiện bằng CSS (thường là {{cssxref("vertical-align")}}) thay vì `<sup>`. Điều này có thể được thực hiện bằng cách sử dụng, ví dụ, `vertical-align: super` hoặc, để dịch chuyển đường cơ sở lên 50%, `vertical-align: 50%`.

Các trường hợp sử dụng phù hợp cho `<sup>` bao gồm (nhưng không nhất thiết giới hạn ở):

- Hiển thị số mũ, chẳng hạn như "x<sup>3</sup>". Có thể đáng xem xét việc sử dụng [MathML](/en-US/docs/Web/MathML) cho những trường hợp này, đặc biệt trong các trường hợp phức tạp hơn. Xem [Số mũ](#exponents) trong [Ví dụ](#examples) bên dưới.
- Hiển thị [chữ viết tắt dạng trên](https://en.wikipedia.org/wiki/Superior_letter), được dùng trong một số ngôn ngữ khi hiển thị một số từ viết tắt nhất định. Ví dụ, trong tiếng Pháp, từ "mademoiselle" có thể được viết tắt là "M<sup>lle</sup>"; đây là trường hợp sử dụng chấp nhận được. Xem [Chữ viết tắt dạng trên](#superior_lettering) để biết ví dụ.
- Biểu thị số thứ tự, chẳng hạn như "4<sup>th</sup>" thay vì "fourth." Xem [Số thứ tự](#ordinal_numbers) để biết ví dụ.

## Ví dụ

### Số mũ

Số mũ, hay lũy thừa của một số, là một trong những cách sử dụng phổ biến nhất của văn bản chỉ số trên. Ví dụ:

```html
<p>
  One of the most common equations in all of physics is <var>E</var>=<var>m</var
  ><var>c</var><sup>2</sup>.
</p>
```

#### Kết quả

{{EmbedLiveSample("Exponents", 650, 80)}}

### Chữ viết tắt dạng trên

Chữ viết tắt dạng trên về mặt kỹ thuật không giống với chỉ số trên. Tuy nhiên, thường dùng `<sup>` để trình bày chữ viết tắt dạng trên trong HTML. Một trong những cách dùng phổ biến nhất của chữ viết tắt dạng trên là trình bày một số từ viết tắt nhất định trong tiếng Pháp:

```html
<p>Robert a présenté son rapport à M<sup>lle</sup> Bernard.</p>
```

#### Kết quả

{{EmbedLiveSample("Superior_lettering", 650, 80)}}

### Số thứ tự

Số thứ tự, chẳng hạn như "fourth" trong tiếng Anh hoặc "quinto" trong tiếng Tây Ban Nha, có thể được viết tắt bằng chữ số và văn bản theo ngôn ngữ cụ thể được hiển thị dưới dạng chỉ số trên:

```html
<p>
  The ordinal number "fifth" can be abbreviated in various languages as follows:
</p>
<ul>
  <li>English: 5<sup>th</sup></li>
  <li>French: 5<sup>ème</sup></li>
</ul>
```

#### Kết quả

{{EmbedLiveSample("Ordinal_numbers", 650, 160)}}

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
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents">superscript</a
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

- Phần tử HTML {{HTMLElement("sub")}} tạo ra chỉ số dưới. Lưu ý rằng bạn không thể dùng `sub` và `sup` cùng lúc: bạn cần dùng [MathML](/en-US/docs/Web/MathML) để tạo ra cả chỉ số trên và chỉ số dưới bên cạnh ký hiệu hóa học của một nguyên tố, đại diện cho số nguyên tử và số khối của nó.
- Các phần tử MathML [`<msub>`](/en-US/docs/Web/MathML/Reference/Element/msub), [`<msup>`](/en-US/docs/Web/MathML/Reference/Element/msup), và [`<msubsup>`](/en-US/docs/Web/MathML/Reference/Element/msubsup).
- Thuộc tính CSS {{cssxref("vertical-align")}}.
