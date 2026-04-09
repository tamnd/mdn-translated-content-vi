---
title: "<dfn>: The Definition element"
slug: Web/HTML/Reference/Elements/dfn
page-type: html-element
browser-compat: html.elements.dfn
sidebar: htmlsidebar
---

Phần tử **`<dfn>`** trong [HTML](/en-US/docs/Web/HTML) chỉ ra một thuật ngữ cần được định nghĩa. Phần tử `<dfn>` nên được sử dụng trong một câu định nghĩa hoàn chỉnh, nơi định nghĩa đầy đủ của thuật ngữ có thể là một trong những điều sau:

- Đoạn văn tổ tiên (một khối văn bản, đôi khi được đánh dấu bởi phần tử {{HTMLElement("p")}})
- Cặp {{HTMLElement("dt")}}/{{HTMLElement("dd")}}
- Tổ tiên [phần](/en-US/docs/Web/HTML/Guides/Content_categories#sectioning_content) gần nhất của phần tử `<dfn>`,

{{InteractiveExample("HTML Demo: &lt;dfn&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  A <dfn id="def-validator">validator</dfn> is a program that checks for syntax
  errors in code or documents.
</p>
```

```css interactive-example
dfn {
  /* Add your styles here */
}
```

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

Thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) có ý nghĩa đặc biệt, như được ghi chú bên dưới.

## Ghi chú sử dụng

Có một số khía cạnh không hoàn toàn rõ ràng khi sử dụng phần tử `<dfn>`. Chúng tôi xem xét những điều đó ở đây.

### Chỉ định thuật ngữ đang được định nghĩa

Thuật ngữ đang được định nghĩa được xác định theo các quy tắc sau:

1. Nếu phần tử `<dfn>` có thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title), giá trị của thuộc tính `title` được coi là thuật ngữ đang được định nghĩa. Phần tử vẫn phải có văn bản bên trong, nhưng văn bản đó có thể là chữ viết tắt (có thể sử dụng {{HTMLElement("abbr")}}) hoặc dạng khác của thuật ngữ.
2. Nếu `<dfn>` chứa một phần tử con duy nhất và không có nội dung văn bản riêng, và phần tử con là một phần tử {{HTMLElement("abbr")}} có thuộc tính `title` riêng, thì giá trị chính xác của `title` của phần tử `<abbr>` là thuật ngữ đang được định nghĩa.
3. Nếu không, nội dung văn bản của phần tử `<dfn>` là thuật ngữ đang được định nghĩa. Điều này được hiển thị [trong ví dụ đầu tiên bên dưới](#basic_identification_of_a_term).

> [!NOTE]
> Nếu phần tử `<dfn>` có thuộc tính `title`, nó _phải_ chứa thuật ngữ đang được định nghĩa và không có văn bản nào khác.

### Liên kết đến các phần tử `<dfn>`

Nếu bạn bao gồm thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) trên phần tử `<dfn>`, bạn có thể liên kết đến nó bằng cách sử dụng các phần tử {{HTMLElement("a")}}. Các liên kết như vậy nên là các cách sử dụng của thuật ngữ, với ý định là người đọc có thể nhanh chóng điều hướng đến định nghĩa của thuật ngữ nếu họ chưa biết về nó, bằng cách nhấp vào liên kết của thuật ngữ.

Điều này được hiển thị trong ví dụ dưới đây về [Liên kết đến các định nghĩa](#links_to_definitions).

## Ví dụ

Hãy xem một số ví dụ về các tình huống sử dụng khác nhau.

### Xác định cơ bản một thuật ngữ

Ví dụ này sử dụng một phần tử `<dfn>` thuần túy để xác định vị trí của thuật ngữ trong định nghĩa.

#### HTML

```html
<p>
  The <strong>HTML Definition element (<dfn>&lt;dfn&gt;</dfn>)</strong> is used
  to indicate the term being defined within the context of a definition phrase
  or sentence.
</p>
```

Vì phần tử `<dfn>` không có `title`, nội dung văn bản của phần tử `<dfn>` được sử dụng làm thuật ngữ đang được định nghĩa.

#### Kết quả

{{EmbedLiveSample("Basic_identification_of_a_term", 650, 120)}}

### Liên kết đến định nghĩa

Để thêm liên kết đến định nghĩa, bạn tạo liên kết theo cách thông thường, với phần tử {{HTMLElement("a")}}.

#### HTML

```html-nolint
<p>
  The
  <strong>HTML Definition element (<dfn id="definition-dfn">&lt;dfn&gt;</dfn>)</strong>
  is used to indicate the term being defined within the context of a definition
  phrase or sentence.
</p>

<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Graece donan, Latine
  voluptatem vocant. Confecta res esset. Duo Reges: constructio interrete.
  Scrupulum, inquam, abeunti;
</p>

<p>
  Because of all of that, we decided to use the
  <code><a href="#definition-dfn">&lt;dfn&gt;</a></code> element for this
  project.
</p>
```

Ở đây chúng ta thấy định nghĩa — bây giờ với thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id), `"definition-dfn"`, có thể được sử dụng làm mục tiêu của một liên kết. Sau đó, một liên kết được tạo bằng `<a>` với thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) được đặt thành `"#definition-dfn"` để thiết lập liên kết trở lại định nghĩa.

#### Kết quả

{{EmbedLiveSample("Links_to_definitions", 650, 300)}}

### Sử dụng chữ viết tắt và định nghĩa cùng nhau

Trong một số trường hợp, bạn có thể muốn sử dụng chữ viết tắt cho một thuật ngữ khi định nghĩa nó. Điều này có thể được thực hiện bằng cách sử dụng các phần tử `<dfn>` và {{HTMLElement("abbr")}} kết hợp, như thế này:

#### HTML

```html
<p>
  The <dfn><abbr title="Hubble Space Telescope">HST</abbr></dfn> is among the
  most productive scientific instruments ever constructed. It has been in orbit
  for over 20 years, scanning the sky and returning data and photographs of
  unprecedented quality and detail.
</p>

<p>
  Indeed, the <abbr title="Hubble Space Telescope">HST</abbr> has arguably done
  more to advance science than any device ever built.
</p>
```

Lưu ý phần tử `<abbr>` được lồng bên trong `<dfn>`. Phần tử trước xác định rằng thuật ngữ là chữ viết tắt ("HST") và chỉ định thuật ngữ đầy đủ ("Hubble Space Telescope") trong thuộc tính `title` của nó. Phần tử sau chỉ ra rằng thuật ngữ viết tắt đại diện cho một thuật ngữ đang được định nghĩa.

#### Kết quả

{{EmbedLiveSample("Using_abbreviations_and_definitions_together", 650, 200)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content">nội dung hữu hình</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">Nội dung cụm từ</a>,
        nhưng không có phần tử <code>&lt;dfn&gt;</code> nào được là phần tử con.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không có, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/term_role"><code>term</code></a></td>
    </tr>
    <tr>
      <th scope="row">Các vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử liên quan đến danh sách định nghĩa: {{HTMLElement("dl")}}, {{HTMLElement("dt")}}, {{HTMLElement("dd")}}
- {{HTMLElement("abbr")}}
