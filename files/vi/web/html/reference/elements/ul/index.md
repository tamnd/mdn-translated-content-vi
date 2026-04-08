---
title: "<ul>: Phần tử Danh sách không có thứ tự"
slug: Web/HTML/Reference/Elements/ul
page-type: html-element
browser-compat: html.elements.ul
sidebar: htmlsidebar
---

Phần tử **`<ul>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một danh sách không có thứ tự các mục, thường được hiển thị dưới dạng danh sách có dấu đầu dòng.

{{InteractiveExample("HTML Demo: &lt;ul&gt;", "tabbed-standard")}}

```html interactive-example
<ul>
  <li>Milk</li>
  <li>
    Cheese
    <ul>
      <li>Blue cheese</li>
      <li>Feta</li>
    </ul>
  </li>
</ul>
```

```css interactive-example
li {
  list-style-type: circle;
}

li li {
  list-style-type: square;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `compact` {{Deprecated_inline}}
  - : Thuộc tính Boolean này gợi ý rằng danh sách nên được hiển thị theo kiểu compact. Cách hiểu thuộc tính này phụ thuộc vào trình duyệt. Hãy sử dụng [CSS](/en-US/docs/Web/CSS) thay thế: để tạo hiệu ứng tương tự thuộc tính `compact`, thuộc tính CSS {{cssxref("line-height")}} có thể được sử dụng với giá trị `80%`.
- `type` {{Deprecated_inline}}
  - : Thuộc tính này đặt kiểu dấu đầu dòng cho danh sách. Các giá trị được xác định theo HTML3.2 và phiên bản chuyển tiếp của HTML 4.0/4.01 là:
    - `circle`
    - `disc`
    - `square`

    Một kiểu dấu đầu dòng thứ tư đã được xác định trong giao diện WebTV, nhưng không phải tất cả trình duyệt đều hỗ trợ: `triangle`.

    Nếu không có và nếu không có thuộc tính CSS {{ cssxref("list-style-type") }} nào áp dụng cho phần tử, tác nhân người dùng sẽ chọn kiểu dấu đầu dòng tùy thuộc vào cấp độ lồng nhau của danh sách.

    > [!WARNING]
    > Đừng sử dụng thuộc tính này vì nó đã bị lỗi thời; hãy sử dụng thuộc tính CSS {{ cssxref("list-style-type") }} thay thế.

## Ghi chú sử dụng

- Phần tử `<ul>` dùng để nhóm một tập hợp các mục không có thứ tự số, và thứ tự của chúng trong danh sách không có ý nghĩa. Thông thường, các mục trong danh sách không có thứ tự được hiển thị với dấu đầu dòng, có thể có nhiều dạng khác nhau như dấu chấm, vòng tròn, hoặc hình vuông. Kiểu dấu đầu dòng không được xác định trong mô tả HTML của trang, mà trong CSS liên kết của nó, sử dụng thuộc tính {{ cssxref("list-style-type") }}.
- Các phần tử `<ul>` và {{HTMLElement("ol")}} có thể được lồng nhau sâu tùy ý. Hơn nữa, các danh sách lồng nhau có thể xen kẽ giữa `<ol>` và `<ul>` không giới hạn.
- Cả hai phần tử {{ HTMLElement("ol") }} và `<ul>` đều đại diện cho một danh sách các mục. Chúng khác nhau ở chỗ, với phần tử {{ HTMLElement("ol") }}, thứ tự có ý nghĩa. Để xác định cái nào nên sử dụng, hãy thử thay đổi thứ tự các mục trong danh sách; nếu ý nghĩa thay đổi, hãy sử dụng phần tử {{ HTMLElement("ol") }}, ngược lại bạn có thể sử dụng `<ul>`.

## Ví dụ

### Ví dụ cơ bản

```html
<ul>
  <li>first item</li>
  <li>second item</li>
  <li>third item</li>
</ul>
```

#### Kết quả

{{EmbedLiveSample("Basic_example", 400, 120)}}

### Lồng danh sách

```html
<ul>
  <li>first item</li>
  <li>
    second item
    <!-- Look, the closing </li> tag is not placed here! -->
    <ul>
      <li>second item first subitem</li>
      <li>
        second item second subitem
        <!-- Same for the second nested unordered list! -->
        <ul>
          <li>second item second subitem first sub-subitem</li>
          <li>second item second subitem second sub-subitem</li>
          <li>second item second subitem third sub-subitem</li>
        </ul>
      </li>
      <!-- Closing </li> tag for the li that
                  contains the third unordered list -->
      <li>second item third subitem</li>
    </ul>
    <!-- Here is the closing </li> tag -->
  </li>
  <li>third item</li>
</ul>
```

#### Kết quả

{{EmbedLiveSample("Nesting_a_list", 400, 340)}}

### Danh sách có thứ tự bên trong danh sách không có thứ tự

```html
<ul>
  <li>first item</li>
  <li>
    second item
    <!-- Look, the closing </li> tag is not placed here! -->
    <ol>
      <li>second item first subitem</li>
      <li>second item second subitem</li>
      <li>second item third subitem</li>
    </ol>
    <!-- Here is the closing </li> tag -->
  </li>
  <li>third item</li>
</ul>
```

#### Kết quả

{{EmbedLiveSample("Ordered_list_inside_unordered_list", 400, 190)}}

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
        >, và nếu các con của phần tử <code>&#x3C;ul></code> bao gồm ít nhất
        một phần tử {{HTMLElement("li")}},
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content"
          >nội dung hữu hình</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Không hoặc nhiều phần tử {{HTMLElement("li")}},
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
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role"><code>radiogroup</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role"><code>tablist</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role"><code>toolbar</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role"><code>tree</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLUListElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử HTML liên quan đến danh sách khác: {{HTMLElement("ol")}}, {{HTMLElement("li")}}, {{HTMLElement("menu")}}
- Các thuộc tính CSS có thể đặc biệt hữu ích để tạo kiểu cho phần tử `<ul>`:
  - Thuộc tính {{CSSxRef("list-style")}}, để chọn cách hiển thị số thứ tự.
  - [CSS counters](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters), để xử lý các danh sách lồng nhau phức tạp.
  - Thuộc tính {{CSSxRef("line-height")}}, để mô phỏng thuộc tính [`compact`](#compact) đã bị lỗi thời.
  - Thuộc tính {{CSSxRef("margin")}}, để kiểm soát thụt lề danh sách.
