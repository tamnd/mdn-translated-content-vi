---
title: "<search>: Phần tử tìm kiếm chung"
slug: Web/HTML/Reference/Elements/search
page-type: html-element
browser-compat: html.elements.search
sidebar: htmlsidebar
---

Phần tử **`<search>`** trong [HTML](/vi/docs/Web/HTML) là một vùng chứa biểu diễn các phần của tài liệu hoặc ứng dụng có các điều khiển form hoặc nội dung khác liên quan đến việc thực hiện tìm kiếm hoặc lọc dữ liệu. Phần tử `<search>` xác định mặt ngữ nghĩa mục đích của nội dung phần tử là có khả năng tìm kiếm hoặc lọc. Chức năng tìm kiếm hoặc lọc có thể dành cho trang web hoặc ứng dụng, trang web hoặc tài liệu hiện tại, hoặc toàn bộ Internet hoặc một mục con của nó.

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Phần tử `<search>` không dùng để hiển thị kết quả tìm kiếm. Thay vào đó, kết quả tìm kiếm hoặc lọc nên được trình bày như một phần của nội dung chính của trang web đó. Tuy nhiên, các gợi ý và liên kết là một phần của chức năng "tìm kiếm nhanh" trong chức năng tìm kiếm hoặc lọc được lồng thích hợp trong nội dung của phần tử `<search>` vì chúng là các tính năng tìm kiếm.

## Khả năng tiếp cận

Phần tử `<search>` xác định một mốc [`search`](/vi/docs/Web/Accessibility/ARIA/Reference/Roles/search_role). Điều này loại bỏ nhu cầu thêm `role=search` vào phần tử {{HTMLElement('form')}}.

## Ví dụ

### Form tìm kiếm trong header

Ví dụ này minh họa việc sử dụng `<search>` như vùng chứa cho tìm kiếm trong header của trang web để thực hiện tìm kiếm toàn trang. `<search>` là vùng chứa ngữ nghĩa cho {{HTMLElement("form")}} gửi truy vấn tìm kiếm do người dùng nhập đến máy chủ.

#### HTML

```html
<header>
  <h1>Movie website</h1>
  <search>
    <form action="./search/">
      <label for="movie">Find a Movie</label>
      <input type="search" id="movie" name="q" />
      <button type="submit">Search</button>
    </form>
  </search>
</header>
```

#### Kết quả

{{EmbedLiveSample('Header search form')}}

### Tìm kiếm ứng dụng web

Ví dụ này minh họa nội dung DOM tiềm năng khi tích hợp động chức năng tìm kiếm JavaScript vào một ứng dụng web. Khi chức năng tìm kiếm được thực hiện hoàn toàn bằng JavaScript, nếu không có form nào được gửi, cả phần tử {{HTMLElement("form")}} lẫn nút gửi {{HTMLElement("button")}} đều không bắt buộc. Về mặt ngữ nghĩa, phần tử `<search>` được bao gồm để chứa các khả năng tìm kiếm và lọc.

#### HTML

```html
<search>
  <label>
    Find and filter your query
    <input type="search" id="query" />
  </label>
  <label>
    <input type="checkbox" id="exact-only" />
    Exact matches only
  </label>

  <section>
    <h3>Results:</h3>
    <ul id="results">
      <!-- search result content -->
    </ul>
    <output id="no-results">
      <!-- no results content -->
    </output>
  </section>
</search>
```

#### Kết quả

{{EmbedLiveSample('Web app search')}}

> [!NOTE]
> Hãy nhớ rằng một số người dùng không có JavaScript, và không có người dùng nào của bạn có JavaScript chạy cho đến khi JavaScript được tải xuống, phân tích cú pháp và thực thi thành công. Đảm bảo rằng người dùng của bạn có thể truy cập nội dung của trang khi JavaScript bị tắt.

### Nhiều tìm kiếm

Ví dụ này minh họa một trang có hai tính năng tìm kiếm. Tính năng đầu tiên là tìm kiếm trang web toàn cục nằm ở header. Tính năng thứ hai là tìm kiếm và lọc dựa trên ngữ cảnh trang, trong ví dụ này là tìm kiếm xe ô tô.

#### HTML

```html
<body>
  <header>
    <h1>Car rental agency</h1>
    <search title="Website">...</search>
  </header>
  <main>
    <h2>Cars available for rent</h2>
    <search title="Cars">
      <h3>Filter results</h3>
      ...
    </search>
    <article>
      <!-- search result content -->
    </article>
  </main>
</body>
```

#### Kết quả

{{EmbedLiveSample('Multiple searches')}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>, <a href="/vi/docs/Web/HTML/Guides/Content_categories#palpable_content">nội dung rõ ràng</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không có, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role">search</a></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/form_role"><code>form</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role"><code>group</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role"><code>region</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role"><code>search</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử liên quan đến tìm kiếm khác: {{HTMLElement("header")}}, {{HTMLElement("footer")}}, {{HTMLElement("aside")}}, {{HTMLElement("nav")}}, {{HTMLElement("form")}}
- [ARIA: Search role](/vi/docs/Web/Accessibility/ARIA/Reference/Roles/search_role)
