---
title: "<main>: The Main element"
slug: Web/HTML/Reference/Elements/main
page-type: html-element
browser-compat: html.elements.main
sidebar: htmlsidebar
---

Phần tử **`<main>`** trong [HTML](/en-US/docs/Web/HTML) biểu diễn nội dung chủ đạo của {{HTMLElement("body")}} trong một tài liệu. Vùng nội dung chính bao gồm nội dung liên quan trực tiếp đến hoặc mở rộng từ chủ đề trung tâm của tài liệu, hoặc chức năng trung tâm của ứng dụng.

{{InteractiveExample("HTML Demo: &lt;main&gt;", "tabbed-shorter")}}

```html interactive-example
<header>Gecko facts</header>

<main>
  <p>
    Geckos are a group of usually small, usually nocturnal lizards. They are
    found on every continent except Antarctica.
  </p>

  <p>
    Many species of gecko have adhesive toe pads which enable them to climb
    walls and even windows.
  </p>
</main>
```

```css interactive-example
header {
  font:
    bold 7vw "Arial",
    sans-serif;
}
```

Một tài liệu không được có nhiều hơn một phần tử `<main>` không có thuộc tính [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden).

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Nội dung của phần tử `<main>` phải là duy nhất đối với tài liệu. Nội dung được lặp lại trên một tập hợp tài liệu hoặc các section tài liệu như thanh bên, liên kết điều hướng, thông tin bản quyền, logo trang web và form tìm kiếm không nên được bao gồm trừ khi form tìm kiếm là chức năng chính của trang.

`<main>` không đóng góp vào outline của tài liệu; nghĩa là, không giống như các phần tử như {{HTMLElement("body")}}, tiêu đề như {{HTMLElement("Heading_Elements", "h2")}}, và như vậy, `<main>` không ảnh hưởng đến khái niệm về cấu trúc trang của {{glossary("DOM", "DOM")}}. Nó chỉ mang tính thông tin.

## Khả năng tiếp cận

### Landmark

Phần tử `<main>` hoạt động như một vai trò landmark [`main`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role). [Landmark](/en-US/docs/Web/Accessibility/ARIA/Guides/Techniques#landmark_roles) có thể được công nghệ hỗ trợ sử dụng để nhanh chóng xác định và điều hướng đến các section lớn của tài liệu. Ưu tiên sử dụng phần tử `<main>` hơn là khai báo `role="main"`, trừ khi có [lo ngại về hỗ trợ trình duyệt cũ](#browser_compatibility).

### Bỏ qua điều hướng

Bỏ qua điều hướng, còn gọi là "skipnav", là kỹ thuật cho phép người dùng công nghệ hỗ trợ nhanh chóng bỏ qua các phần lớn nội dung lặp lại (điều hướng chính, biểu ngữ thông tin, v.v.). Điều này cho phép người dùng truy cập nội dung chính của trang nhanh hơn.

Việc thêm thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) vào phần tử `<main>` cho phép nó trở thành mục tiêu của liên kết bỏ qua điều hướng.

```html
<body>
  <a href="#main-content">Skip to main content</a>

  <!-- navigation and header content -->

  <main id="main-content">
    <!-- main page content -->
  </main>
</body>
```

- [WebAIM: "Skip Navigation" Links](https://webaim.org/techniques/skipnav/)

### Chế độ đọc

Chức năng chế độ đọc của trình duyệt tìm kiếm sự hiện diện của phần tử `<main>`, cũng như các phần tử [heading](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) và [content sectioning](/en-US/docs/Web/HTML/Reference/Elements#content_sectioning) khi chuyển đổi nội dung sang view đọc chuyên biệt.

- [Building websites for Safari Reader Mode and other reading apps.](https://medium.com/@mandy.michael/building-websites-for-safari-reader-mode-and-other-reading-apps-1562913c86c9)

## Ví dụ

```html
<!-- other content -->

<main>
  <h1>Apples</h1>
  <p>The apple is the pomaceous fruit of the apple tree.</p>

  <article>
    <h2>Red Delicious</h2>
    <p>
      These bright red apples are the most common found in many supermarkets.
    </p>
    <p>…</p>
    <p>…</p>
  </article>

  <article>
    <h2>Granny Smith</h2>
    <p>These juicy, green apples make a great filling for apple pies.</p>
    <p>…</p>
    <p>…</p>
  </article>
</main>

<!-- other content -->
```

### Kết quả

{{EmbedLiveSample('Examples')}}

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
          >Nội dung flow</a
        >, nội dung palpable.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung flow</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không; cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Nơi mà
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung flow</a
        >
        được mong đợi, nhưng chỉ khi nó là một
        <a
          href="https://html.spec.whatwg.org/multipage/grouping-content.html#hierarchically-correct-main-element"
          >phần tử <code>main</code> đúng về mặt phân cấp</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role"
            >main</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử cấu trúc cơ bản: {{HTMLElement("html")}}, {{HTMLElement("head")}}, {{HTMLElement("body")}}
- Các phần tử liên quan đến section: {{HTMLElement("article")}}, {{HTMLElement("aside")}}, {{HTMLElement("footer")}}, {{HTMLElement("header")}}, hoặc {{HTMLElement("nav")}}
- [ARIA: Main role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role)
