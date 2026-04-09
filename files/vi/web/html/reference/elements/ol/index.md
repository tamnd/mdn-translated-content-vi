---
title: "<ol>: Phần tử Danh sách có thứ tự"
slug: Web/HTML/Reference/Elements/ol
page-type: html-element
browser-compat: html.elements.ol
sidebar: htmlsidebar
---

Phần tử **`<ol>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một danh sách các mục có thứ tự — thường được hiển thị dưới dạng danh sách có đánh số.

{{InteractiveExample("HTML Demo: &lt;ol&gt;", "tabbed-shorter")}}

```html interactive-example
<ol>
  <li>Mix flour, baking powder, sugar, and salt.</li>
  <li>In another bowl, mix eggs, milk, and oil.</li>
  <li>Stir both mixtures together.</li>
  <li>Fill muffin tray 3/4 full.</li>
  <li>Bake for 20 minutes.</li>
</ol>
```

```css interactive-example
li {
  font:
    1rem "Fira Sans",
    sans-serif;
  margin-bottom: 0.5rem;
}
```

## Thuộc tính

Phần tử này cũng chấp nhận các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `compact` {{Deprecated_inline}} {{non-standard_inline}}
  - : Thuộc tính Boolean này gợi ý rằng danh sách nên được hiển thị theo kiểu compact. Cách hiểu thuộc tính này phụ thuộc vào trình duyệt. Hãy sử dụng [CSS](/en-US/docs/Web/CSS) thay thế: để tạo hiệu ứng tương tự thuộc tính `compact`, thuộc tính CSS {{cssxref("line-height")}} có thể được sử dụng với giá trị `80%`.
- `reversed`
  - : Thuộc tính Boolean này chỉ định rằng các mục trong danh sách theo thứ tự ngược. Các mục sẽ được đánh số từ cao đến thấp.
- `start`
  - : Một số nguyên để bắt đầu đếm cho các mục trong danh sách. Luôn là số Ả Rập (1, 2, 3, v.v.), ngay cả khi `type` đánh số là chữ cái hoặc số La Mã. Ví dụ: để bắt đầu đánh số từ chữ cái "d" hoặc số La Mã "iv", hãy sử dụng `start="4"`.
- `type`
  - : Đặt kiểu đánh số:
    - `a` cho chữ cái thường
    - `A` cho chữ cái hoa
    - `i` cho số La Mã thường
    - `I` cho số La Mã hoa
    - `1` cho số (mặc định)

    Kiểu được chỉ định được sử dụng cho toàn bộ danh sách trừ khi thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/li#type) khác được sử dụng trên phần tử {{HTMLElement("li")}} bên trong.

    > [!NOTE]
    > Trừ khi kiểu số của danh sách quan trọng (như trong các tài liệu pháp lý hoặc kỹ thuật, nơi các mục được tham chiếu bằng số/chữ của chúng), hãy sử dụng thuộc tính CSS {{CSSxRef("list-style-type")}} thay thế.

## Ghi chú sử dụng

Thông thường, các mục trong danh sách có thứ tự được hiển thị với [marker](/en-US/docs/Web/CSS/Reference/Selectors/::marker) đứng trước, chẳng hạn như số hoặc chữ cái.

Các phần tử `<ol>` và {{HTMLElement("ul")}} (hoặc từ đồng nghĩa {{HTMLElement("menu")}}) có thể lồng nhau sâu tùy ý, xen kẽ giữa `<ol>`, `<ul>` (hoặc `<menu>`) khi cần.

Cả hai phần tử `<ol>` và {{HTMLElement("ul")}} đều đại diện cho một danh sách các mục. Sự khác biệt là với phần tử `<ol>`, thứ tự có ý nghĩa. Ví dụ:

- Các bước trong công thức nấu ăn
- Chỉ đường rẽ từng bước
- Danh sách thành phần theo tỷ lệ giảm dần trên nhãn thông tin dinh dưỡng

Để xác định danh sách nào cần sử dụng, hãy thử thay đổi thứ tự các mục; nếu ý nghĩa thay đổi, hãy sử dụng phần tử `<ol>` — ngược lại bạn có thể sử dụng {{HTMLElement("ul")}}, hoặc {{HTMLElement("menu")}} nếu danh sách của bạn là một menu.

## Ví dụ

### Ví dụ cơ bản

```html
<ol>
  <li>Fee</li>
  <li>Fi</li>
  <li>Fo</li>
  <li>Fum</li>
</ol>
```

#### Kết quả

{{EmbedLiveSample("Basic_example", 400, 100)}}

### Sử dụng kiểu số La Mã

```html
<ol type="i">
  <li>Introduction</li>
  <li>List of Grievances</li>
  <li>Conclusion</li>
</ol>
```

#### Kết quả

{{EmbedLiveSample("Using_Roman_Numeral_type", 400, 100)}}

### Sử dụng thuộc tính start

```html
<p>Finishing places of contestants not in the winners' circle:</p>

<ol start="4">
  <li>Speedwalk Stu</li>
  <li>Saunterin' Sam</li>
  <li>Slowpoke Rodriguez</li>
</ol>
```

#### Kết quả

{{EmbedLiveSample("Using_the_start_attribute", 400, 100)}}

### Lồng danh sách

```html
<ol>
  <li>first item</li>
  <li>
    second item
    <!-- closing </li> tag is not here! -->
    <ol>
      <li>second item first subitem</li>
      <li>second item second subitem</li>
      <li>second item third subitem</li>
    </ol>
  </li>
  <!-- Here's the closing </li> tag -->
  <li>third item</li>
</ol>
```

#### Kết quả

{{EmbedLiveSample("Nesting_lists", 400, 150)}}

### Danh sách không có thứ tự bên trong danh sách có thứ tự

```html
<ol>
  <li>first item</li>
  <li>
    second item
    <!-- closing </li> tag is not here! -->
    <ul>
      <li>second item first subitem</li>
      <li>second item second subitem</li>
      <li>second item third subitem</li>
    </ul>
  </li>
  <!-- Here's the closing </li> tag -->
  <li>third item</li>
</ol>
```

#### Kết quả

{{EmbedLiveSample("Unordered_list_inside_ordered_list", 400, 150)}}

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
        >, và nếu các con của phần tử <code>&#x3C;ol></code> bao gồm ít nhất
        một phần tử {{HTMLElement("li")}},
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content"
          >nội dung hữu hình</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Không hoặc nhiều phần tử {{ HTMLElement("li") }},
        {{HTMLElement("script")}} và
        {{HTMLElement("template")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role"
            >list</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/directory_role"><code>directory</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role"><code>group</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role"><code>listbox</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role"><code>menu</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role"><code>menubar</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role"><code>radiogroup</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role"><code>tablist</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role"><code>toolbar</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role"><code>tree</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{DOMxRef("HTMLOListElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử HTML liên quan đến danh sách khác: {{HTMLElement("ul")}}, {{HTMLElement("li")}}, {{HTMLElement("menu")}}
- Các thuộc tính CSS có thể đặc biệt hữu ích để tạo kiểu cho phần tử `<ol>`:
  - Thuộc tính {{CSSxRef("list-style")}}, để chọn cách hiển thị số thứ tự
  - [CSS counters](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters), để xử lý các danh sách lồng nhau phức tạp
  - Thuộc tính {{CSSxRef("line-height")}}, để mô phỏng thuộc tính `compact` đã bị lỗi thời
  - Thuộc tính {{CSSxRef("margin")}}, để kiểm soát thụt lề danh sách
