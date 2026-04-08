---
title: "<section>: The Generic Section element"
slug: Web/HTML/Reference/Elements/section
page-type: html-element
browser-compat: html.elements.section
sidebar: htmlsidebar
---

Phần tử **`<section>`** trong [HTML](/en-US/docs/Web/HTML) biểu diễn một section độc lập chung chung của một tài liệu, không có phần tử ngữ nghĩa cụ thể hơn để biểu diễn nó. Các section luôn phải có tiêu đề, với rất ít ngoại lệ.

{{InteractiveExample("HTML Demo: &lt;section&gt;", "tabbed-standard")}}

```html interactive-example
<h1>Choosing an Apple</h1>
<section>
  <h2>Introduction</h2>
  <p>
    This document provides a guide to help with the important task of choosing
    the correct Apple.
  </p>
</section>

<section>
  <h2>Criteria</h2>
  <p>
    There are many different criteria to be considered when choosing an Apple —
    size, color, firmness, sweetness, tartness...
  </p>
</section>
```

```css interactive-example
h1,
h2 {
  margin: 0;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Như đã đề cập ở trên, `<section>` là phần tử sectioning chung chung, và chỉ nên được sử dụng nếu không có phần tử cụ thể hơn để biểu diễn nó. Ví dụ, menu điều hướng nên được bọc trong phần tử {{htmlelement("nav")}}, nhưng danh sách kết quả tìm kiếm hoặc hiển thị bản đồ và các điều khiển của nó không có phần tử cụ thể, và có thể được đặt bên trong `<section>`.

Cũng xem xét các trường hợp sau:

- Nếu nội dung của phần tử biểu diễn một đơn vị nội dung độc lập, nguyên tử có ý nghĩa khi được tổng hợp như một phần độc lập (ví dụ, một bài blog hoặc bình luận blog, hoặc một bài báo), phần tử {{HTMLElement("article")}} sẽ là lựa chọn tốt hơn.
- Nếu nội dung biểu diễn thông tin tiếp tuyến hữu ích hoạt động cùng với nội dung chính, nhưng không trực tiếp là một phần của nó (như các liên kết liên quan, hoặc tiểu sử tác giả), hãy sử dụng {{HTMLElement("aside")}}.
- Nếu nội dung biểu diễn khu vực nội dung chính của tài liệu, hãy sử dụng {{HTMLElement("main")}}.
- Nếu bạn chỉ sử dụng phần tử như một wrapper kiểu dáng, hãy sử dụng {{HTMLElement("div")}} thay thế.

Để nhắc lại, mỗi `<section>` phải được xác định, thường bằng cách bao gồm tiêu đề (phần tử {{HTMLElement("Heading_Elements", "h1")}} - {{HTMLElement("Heading_Elements", "h6")}}) làm phần tử con của phần tử `<section>`, bất cứ khi nào có thể. Xem bên dưới để biết các ví dụ về trường hợp bạn có thể thấy `<section>` không có tiêu đề.

## Ví dụ

### Ví dụ sử dụng cơ bản

#### Trước

```html
<div>
  <h2>Heading</h2>
  <p>Bunch of awesome content</p>
</div>
```

##### Kết quả

{{EmbedLiveSample('Before')}}

#### Sau

```html
<section>
  <h2>Heading</h2>
  <p>Bunch of awesome content</p>
</section>
```

##### Kết quả

{{EmbedLiveSample('After')}}

### Sử dụng section không có tiêu đề

Các trường hợp mà bạn có thể thấy `<section>` được sử dụng không có tiêu đề thường được tìm thấy trong các section ứng dụng web/UI thay vì trong các cấu trúc tài liệu truyền thống. Trong một tài liệu, việc có một section nội dung riêng biệt không có tiêu đề để mô tả nội dung của nó thực sự không có ý nghĩa. Các tiêu đề như vậy rất hữu ích cho tất cả người đọc, nhưng đặc biệt hữu ích cho người dùng các công nghệ hỗ trợ như screen reader, và chúng cũng tốt cho SEO.

Tuy nhiên, hãy xem xét một cơ chế điều hướng thứ cấp. Nếu điều hướng toàn cục đã được bọc trong phần tử `<nav>`, bạn có thể đặt menu trước/sau trong `<section>`:

```html
<section>
  <a href="#">Previous article</a>
  <a href="#">Next article</a>
</section>
```

Hoặc một thanh nút để điều khiển ứng dụng của bạn thì sao? Điều này có thể không cần tiêu đề, nhưng nó vẫn là một section riêng biệt của tài liệu:

```html
<section>
  <button class="reply">Reply</button>
  <button class="reply-all">Reply to all</button>
  <button class="fwd">Forward</button>
  <button class="del">Delete</button>
</section>
```

#### Kết quả

{{EmbedLiveSample('Using a section without a heading')}}

Tùy thuộc vào nội dung, việc bao gồm tiêu đề cũng có thể tốt cho SEO, vì vậy đó là một tùy chọn cần xem xét.

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
        >,
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#sectioning_content"
          >nội dung sectioning</a
        >, <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content">nội dung palpable</a>.
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
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung flow</a
        >. Lưu ý rằng phần tử <code>&#x3C;section></code> không được là
        phần tử con của phần tử {{HTMLElement("address")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role"
            >region</a
          ></code
        >
        nếu phần tử có
        <a
          href="/en-US/docs/Glossary/Accessible_name"
          >tên có thể truy cập</a
        >, ngược lại là
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"
            >generic</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role"><code>alert</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role"><code>alertdialog</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role"><code>application</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role"><code>banner</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/complementary_role"><code>complementary</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/contentinfo_role"><code>contentinfo</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role"><code>dialog</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role"><code>document</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/feed_role"><code>feed</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role"><code>log</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role"><code>main</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/marquee_role"><code>marquee</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role"><code>navigation</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/note_role"><code>note</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role"><code>search</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role"><code>status</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role"><code>tabpanel</code></a>
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

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử liên quan đến section khác: {{HTMLElement("body")}}, {{HTMLElement("nav")}}, {{HTMLElement("article")}}, {{HTMLElement("aside")}}, {{HTMLElement("Heading_Elements", "h1")}}, {{HTMLElement("Heading_Elements", "h2")}}, {{HTMLElement("Heading_Elements", "h3")}}, {{HTMLElement("Heading_Elements", "h4")}}, {{HTMLElement("Heading_Elements", "h5")}}, {{HTMLElement("Heading_Elements", "h6")}}, {{HTMLElement("hgroup")}}, {{HTMLElement("header")}}, {{HTMLElement("footer")}}, {{HTMLElement("address")}}
- [Sử dụng các section và outline HTML](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements)
- [ARIA: Region role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role)
- [Why You Should Choose HTML5 article Over section](https://www.smashingmagazine.com/2020/01/html5-article-section/), by Bruce Lawson
