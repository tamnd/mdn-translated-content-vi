---
title: "<h1>–<h6>: Các phần tử tiêu đề mục HTML"
slug: Web/HTML/Reference/Elements/Heading_Elements
page-type: html-element
browser-compat:
  - html.elements.h1
  - html.elements.h2
  - html.elements.h3
  - html.elements.h4
  - html.elements.h5
  - html.elements.h6
sidebar: htmlsidebar
---

Các phần tử **`<h1>`** đến **`<h6>`** trong [HTML](/vi/docs/Web/HTML) biểu diễn sáu cấp độ tiêu đề mục. `<h1>` là cấp độ mục cao nhất và `<h6>` là cấp độ thấp nhất. Theo mặc định, tất cả các phần tử tiêu đề tạo ra một hộp [cấp khối](/vi/docs/Glossary/Block-level_content) trong bố cục, bắt đầu trên một dòng mới và chiếm toàn bộ chiều rộng có sẵn trong khối chứa của chúng.

{{InteractiveExample("HTML Demo: &lt;h1-h6&gt;", "tabbed-standard")}}

```html interactive-example
<h1>Beetles</h1>
<h2>External morphology</h2>
<h3>Head</h3>
<h4>Mouthparts</h4>
<h3>Thorax</h3>
<h4>Prothorax</h4>
<h4>Pterothorax</h4>
```

```css interactive-example
h1,
h2,
h3,
h4 {
  margin: 0.1rem 0;
}

h1 {
  font-size: 2rem;
}

h2 {
  font-size: 1.5rem;
  padding-left: 20px;
}

h3 {
  font-size: 1.2rem;
  padding-left: 40px;
}

h4 {
  font-size: 1rem;
  font-style: italic;
  padding-left: 60px;
}
```

## Thuộc tính

Các phần tử này chỉ bao gồm [các thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

- Thông tin tiêu đề có thể được dùng bởi các tác nhân người dùng để tự động tạo mục lục cho tài liệu.
- Không sử dụng các phần tử tiêu đề để thay đổi kích thước văn bản. Thay vào đó, hãy sử dụng thuộc tính {{cssxref("font-size")}} trong {{glossary("CSS")}}.
- Không bỏ qua các cấp độ tiêu đề: luôn bắt đầu từ `<h1>`, tiếp theo là `<h2>` và cứ tiếp tục như vậy.

### Tránh sử dụng nhiều phần tử `<h1>` trên một trang

Mặc dù tiêu chuẩn HTML cho phép sử dụng nhiều phần tử `<h1>` trên một trang (miễn là chúng không được [lồng nhau](#nesting)), nhưng đây không được coi là thực hành tốt. Một trang thường nên có một phần tử `<h1>` duy nhất mô tả nội dung của trang (tương tự như phần tử [`<title>`](/vi/docs/Web/HTML/Reference/Elements/title) của tài liệu).

> [!NOTE]
> Việc lồng nhiều phần tử `<h1>` trong các [phần tử phân đoạn](/vi/docs/Web/HTML/Reference/Elements#content_sectioning) lồng nhau đã được cho phép trong các phiên bản cũ hơn của tiêu chuẩn HTML. Tuy nhiên, điều này chưa bao giờ được coi là thực hành tốt và hiện nay không tuân thủ. Đọc thêm trong [There Is No Document Outline Algorithm](https://adrianroselli.com/2016/08/there-is-no-document-outline-algorithm.html).

Tốt hơn là chỉ sử dụng một `<h1>` mỗi trang và [lồng các tiêu đề](#nesting) mà không bỏ qua các cấp độ.

### Chỉ định cỡ chữ đồng nhất cho `<h1>`

Trước tháng 5 năm 2025, [tiêu chuẩn HTML](https://html.spec.whatwg.org/multipage/rendering.html#sections-and-headings) quy định rằng các phần tử `<h1>` trong phần tử `<section>`, `<article>`, `<aside>` hoặc `<nav>` sẽ hiển thị như `<h2>` ({{cssxref("font-size")}} nhỏ hơn với {{cssxref("margin-block")}} được điều chỉnh), hoặc như `<h3>` nếu lồng thêm một cấp, và cứ tiếp tục như vậy. Kiểu mặc định phụ thuộc ngữ cảnh đặc biệt này đã được [xóa bỏ](https://github.com/whatwg/html/issues/7867).

Để đảm bảo hiển thị `<h1>` nhất quán cho các trình duyệt thực hiện kiểu mặc định phụ thuộc ngữ cảnh cũ, hãy sử dụng quy tắc kiểu sau:

```css
h1 {
  margin-block: 0.67em;
  font-size: 2em;
}
```

Ngoài ra, để tránh ghi đè các quy tắc kiểu khác nhắm vào `<h1>`, bạn có thể sử dụng {{cssxref(":where()")}}, có độ đặc hiệu bằng không:

```css
:where(h1) {
  margin-block: 0.67em;
  font-size: 2em;
}
```

## Khả năng tiếp cận

### Điều hướng

Một kỹ thuật điều hướng phổ biến cho người dùng phần mềm đọc màn hình là nhảy nhanh từ tiêu đề này sang tiêu đề khác để xác định nội dung của trang. Do đó, điều quan trọng là không bỏ qua một hoặc nhiều cấp độ tiêu đề. Làm như vậy có thể gây nhầm lẫn, vì người đang điều hướng theo cách này có thể tự hỏi tiêu đề bị thiếu ở đâu.

**Không làm thế này:**

```html example-bad
<h1>Heading level 1</h1>
<h3>Heading level 3</h3>
<h4>Heading level 4</h4>
```

**Nên dùng cách này:**

```html example-good
<h1>Heading level 1</h1>
<h2>Heading level 2</h2>
<h3>Heading level 3</h3>
```

#### Lồng nhau

Các tiêu đề có thể được lồng nhau dưới dạng các mục con để phản ánh cấu trúc tổ chức nội dung của trang. Hầu hết các đọc màn hình cũng có thể tạo danh sách có thứ tự tất cả các tiêu đề trên một trang, có thể giúp người dùng nhanh chóng xác định hệ thống phân cấp nội dung và điều hướng đến các tiêu đề khác nhau.

Với cấu trúc trang sau:

```html
<h1>Beetles</h1>

<h2>Etymology</h2>

<h2>Distribution and Diversity</h2>

<h2>Evolution</h2>
<h3>Late Paleozoic</h3>
<h3>Jurassic</h3>
<h3>Cretaceous</h3>
<h3>Cenozoic</h3>

<h2>External Morphology</h2>
<h3>Head</h3>
<h4>Mouthparts</h4>
<h3>Thorax</h3>
<h4>Prothorax</h4>
<h4>Pterothorax</h4>
<h3>Legs</h3>
<h3>Wings</h3>
<h3>Abdomen</h3>
```

Đọc màn hình sẽ tạo danh sách như sau:

1. `h1` Beetles
   1. `h2` Etymology
   2. `h2` Distribution and Diversity
   3. `h2` Evolution
      1. `h3` Late Paleozoic
      2. `h3` Jurassic
      3. `h3` Cretaceous
      4. `h3` Cenozoic

   4. `h2` External Morphology
      1. `h3` Head
         1. `h4` Mouthparts

      2. `h3` Thorax
         1. `h4` Prothorax
         2. `h4` Pterothorax

      3. `h3` Legs
      4. `h3` Wings
      5. `h3` Abdomen

Khi các tiêu đề được lồng nhau, các cấp độ tiêu đề có thể bị "bỏ qua" khi đóng một mục con.

- [Headings • Page Structure • WAI Web Accessibility Tutorials](https://www.w3.org/WAI/tutorials/page-structure/headings/)
- [MDN Understanding WCAG, Guideline 1.3 explanations](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.3_—_create_content_that_can_be_presented_in_different_ways)
- [Understanding Success Criterion 1.3.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/content-structure-separation-programmatic.html)
- [MDN Understanding WCAG, Guideline 2.4 explanations](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.4_—_navigable_provide_ways_to_help_users_navigate_find_content_and_determine_where_they_are)
- [Understanding Success Criterion 2.4.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-skip.html)
- [Understanding Success Criterion 2.4.6 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-descriptive.html)
- [Understanding Success Criterion 2.4.10 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-headings.html)

### Gán nhãn nội dung mục

Một kỹ thuật điều hướng phổ biến khác cho người dùng phần mềm đọc màn hình là tạo danh sách [nội dung phân đoạn](/vi/docs/Web/HTML/Reference/Elements#content_sectioning) và sử dụng nó để xác định bố cục của trang.

Nội dung phân đoạn có thể được gán nhãn bằng cách kết hợp thuộc tính [`aria-labelledby`](/vi/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) và [`id`](/vi/docs/Web/HTML/Reference/Global_attributes/id), với nhãn mô tả ngắn gọn mục đích của mục. Kỹ thuật này hữu ích cho các tình huống có nhiều hơn một phần tử phân đoạn trên cùng một trang.

#### Ví dụ về nội dung phân đoạn

```html
<header>
  <nav aria-labelledby="primary-navigation">
    <h2 id="primary-navigation">Primary navigation</h2>
    <!-- navigation items -->
  </nav>
</header>

<!-- page content -->

<footer>
  <nav aria-labelledby="footer-navigation">
    <h2 id="footer-navigation">Footer navigation</h2>
    <!-- navigation items -->
  </nav>
</footer>
```

{{EmbedLiveSample('Sectioning_content_examples')}}

Trong ví dụ này, công nghệ đọc màn hình sẽ thông báo rằng có hai mục {{HTMLElement("nav")}}, một mục được gọi là "Primary navigation" và một mục được gọi là "Footer navigation". Nếu không có nhãn, người dùng phần mềm đọc màn hình có thể phải điều tra nội dung của từng phần tử `nav` để xác định mục đích của chúng.

- [Using the aria-labelledby attribute](/vi/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
- [Labeling Regions • Page Structure • W3C WAI Web Accessibility Tutorials](https://www.w3.org/WAI/tutorials/page-structure/labels/#using-aria-labelledby)

## Ví dụ

### Tất cả các tiêu đề

Đoạn mã sau hiển thị tất cả các cấp độ tiêu đề đang được sử dụng.

```html
<h1>Heading level 1</h1>
<h2>Heading level 2</h2>
<h3>Heading level 3</h3>
<h4>Heading level 4</h4>
<h5>Heading level 5</h5>
<h6>Heading level 6</h6>
```

{{EmbedLiveSample('All_headings', '280', '300')}}

### Trang ví dụ

Đoạn mã sau hiển thị một vài tiêu đề với một số nội dung bên dưới chúng.

```html
<h1>Heading elements</h1>
<h2>Summary</h2>
<p>Some text here…</p>

<h2>Examples</h2>
<h3>Example 1</h3>
<p>Some text here…</p>

<h3>Example 2</h3>
<p>Some text here…</p>

<h2>See also</h2>
<p>Some text here…</p>
```

{{EmbedLiveSample('Example_page', '280', '480')}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >, nội dung tiêu đề, nội dung rõ ràng.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >.
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
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/heading_role"
          >heading</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role"><code>tab</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a> hoặc
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLHeadingElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("p")}}
- {{HTMLElement("div")}}
- {{HTMLElement("section")}}
