---
title: "<menu>: Phần tử Menu"
slug: Web/HTML/Reference/Elements/menu
page-type: html-element
browser-compat: html.elements.menu
sidebar: htmlsidebar
---

Phần tử **`<menu>`** trong [HTML](/en-US/docs/Web/HTML) được mô tả trong đặc tả HTML là lựa chọn thay thế ngữ nghĩa cho {{HTMLElement("ul")}}, nhưng được trình duyệt xử lý (và được hiển thị qua cây tiếp cận) không khác gì {{HTMLElement("ul")}}. Nó đại diện cho một danh sách không có thứ tự các mục (được đại diện bởi các phần tử {{HTMLElement("li")}}).

{{InteractiveExample("HTML Demo: &lt;menu&gt;", "tabbed-shorter")}}

```html interactive-example
<div class="news">
  <a href="#">NASA's Webb Delivers Deepest Infrared Image of Universe Yet</a>
  <menu>
    <li><button id="save">Save for later</button></li>
    <li><button id="share">Share this news</button></li>
  </menu>
</div>
```

```css interactive-example
.news {
  background-color: bisque;
  padding: 1em;
  border: solid thin black;
}

menu {
  list-style-type: none;
  display: flex;
  padding: 0;
  margin-bottom: 0;
  gap: 1em;
}
```

## Thuộc tính

Phần tử này cũng chấp nhận các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `compact` {{Deprecated_inline}}
  - : Thuộc tính Boolean này gợi ý rằng danh sách nên được hiển thị theo kiểu compact. Cách hiểu thuộc tính này phụ thuộc vào trình duyệt. Hãy sử dụng [CSS](/en-US/docs/Web/CSS) thay thế: để tạo hiệu ứng tương tự thuộc tính `compact`, thuộc tính CSS {{cssxref("line-height")}} có thể được sử dụng với giá trị `80%`.

## Ghi chú sử dụng

Cả hai phần tử `<menu>` và {{HTMLElement("ul")}} đều đại diện cho một danh sách không có thứ tự các mục. Sự khác biệt chính là {{HTMLElement("ul")}} chủ yếu chứa các mục để hiển thị, trong khi `<menu>` đại diện cho một thanh công cụ chứa các lệnh mà người dùng có thể thực hiện hoặc kích hoạt.

> [!NOTE]
> Trong các phiên bản đầu của đặc tả HTML, phần tử `<menu>` có thêm trường hợp sử dụng như một menu ngữ cảnh. Chức năng này được coi là lỗi thời và không có trong đặc tả.

## Ví dụ

### Thanh công cụ

Trong ví dụ này, `<menu>` được sử dụng để tạo một thanh công cụ cho ứng dụng chỉnh sửa.

#### HTML

```html
<menu>
  <li><button onclick="copy()">Copy</button></li>
  <li><button onclick="cut()">Cut</button></li>
  <li><button onclick="paste()">Paste</button></li>
</menu>
```

Lưu ý rằng điều này về mặt chức năng không khác gì:

```html
<ul>
  <li><button onclick="copy()">Copy</button></li>
  <li><button onclick="cut()">Cut</button></li>
  <li><button onclick="paste()">Paste</button></li>
</ul>
```

#### CSS

```css
menu,
ul {
  display: flex;
  list-style: none;
  padding: 0;
  width: 400px;
}

li {
  flex-grow: 1;
}

button {
  width: 100%;
}
```

#### Kết quả

{{EmbedLiveSample("Toolbar", "100%", 100)}}

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
        <p>
          <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
            >Nội dung luồng</a
          >. Nếu các con của phần tử bao gồm ít nhất một
          phần tử {{HTMLElement("li")}}:
          <a
            href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content"
            >Nội dung hữu hình</a
          >.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <p>
          Không hoặc nhiều lần xuất hiện của {{HTMLElement("li")}},
          {{HTMLElement("script")}} và
          {{HTMLElement("template")}}.
        </p>
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
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role"
            >listbox</a
          ></code
        >, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role"><code>menu</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role"><code>menubar</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role"><code>radiogroup</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role"><code>tablist</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role"><code>toolbar</code></a> hoặc <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role"><code>tree</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{DOMxRef("HTMLMenuElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử HTML liên quan đến danh sách khác: {{HTMLElement("ol")}}, {{HTMLElement("ul")}}, và {{HTMLElement("li")}}.
