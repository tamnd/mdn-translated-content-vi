---
title: "<article>: The Article Contents element"
slug: Web/HTML/Reference/Elements/article
page-type: html-element
browser-compat: html.elements.article
sidebar: htmlsidebar
---

Phần tử **`<article>`** trong [HTML](/en-US/docs/Web/HTML) biểu diễn một bài viết khép kín trong một tài liệu, trang, ứng dụng hoặc trang web, được thiết kế để có thể phân phối hoặc tái sử dụng một cách độc lập (ví dụ, trong syndication). Các ví dụ bao gồm: bài đăng trên diễn đàn, bài báo tạp chí hoặc báo, hoặc bài blog, thẻ sản phẩm, bình luận do người dùng gửi, tiện ích hoặc gadget tương tác, hoặc bất kỳ mục nội dung độc lập nào khác.

{{InteractiveExample("HTML Demo: &lt;article&gt;", "tabbed-standard")}}

```html interactive-example
<article class="forecast">
  <h1>Weather forecast for Seattle</h1>
  <article class="day-forecast">
    <h2>03 March 2018</h2>
    <p>Rain.</p>
  </article>
  <article class="day-forecast">
    <h2>04 March 2018</h2>
    <p>Periods of rain.</p>
  </article>
  <article class="day-forecast">
    <h2>05 March 2018</h2>
    <p>Heavy rain.</p>
  </article>
</article>
```

```css interactive-example
.forecast {
  margin: 0;
  padding: 0.3rem;
  background-color: #eeeeee;
}

.forecast > h1,
.day-forecast {
  margin: 0.5rem;
  padding: 0.3rem;
  font-size: 1.2rem;
}

.day-forecast {
  background: right/contain content-box border-box no-repeat
    url("/shared-assets/images/examples/rain.svg") white;
}

.day-forecast > h2,
.day-forecast > p {
  margin: 0.2rem;
  font-size: 1rem;
}
```

Một tài liệu có thể có nhiều bài viết; ví dụ, trên một blog hiển thị văn bản của từng bài viết lần lượt khi người đọc cuộn, mỗi bài đăng sẽ được chứa trong một phần tử `<article>`, có thể với một hoặc nhiều `<section>` bên trong.

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

- Mỗi `<article>` phải được xác định, thường bằng cách bao gồm phần tử tiêu đề ([`<h1>` - `<h6>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements)) làm phần tử con của phần tử `<article>`.
- Khi một phần tử `<article>` được lồng nhau, phần tử bên trong biểu diễn một bài viết liên quan đến phần tử bên ngoài. Ví dụ, các bình luận của bài blog có thể là các phần tử `<article>` được lồng trong `<article>` biểu diễn bài blog.
- Thông tin về tác giả của phần tử `<article>` có thể được cung cấp thông qua phần tử {{HTMLElement("address")}}, nhưng nó không áp dụng cho các phần tử `<article>` được lồng nhau.
- Ngày và giờ xuất bản của phần tử `<article>` có thể được mô tả bằng thuộc tính [`datetime`](/en-US/docs/Web/HTML/Reference/Elements/time#datetime) của phần tử {{HTMLElement("time")}}.

## Ví dụ

```html
<article class="film_review">
  <h2>Jurassic Park</h2>
  <section class="main_review">
    <h3>Review</h3>
    <p>Dinos were great!</p>
  </section>
  <section class="user_reviews">
    <h3>User reviews</h3>
    <article class="user_review">
      <h4>Too scary!</h4>
      <p>Way too scary for me.</p>
      <footer>
        <p>
          Posted on
          <time datetime="2015-05-16 19:00">May 16</time>
          by Lisa.
        </p>
      </footer>
    </article>
    <article class="user_review">
      <h4>Love the dinos!</h4>
      <p>I agree, dinos are my favorite.</p>
      <footer>
        <p>
          Posted on
          <time datetime="2015-05-17 19:00">May 17</time>
          by Tom.
        </p>
      </footer>
    </article>
  </section>
  <footer>
    <p>
      Posted on
      <time datetime="2015-05-15 19:00">May 15</time>
      by Staff.
    </p>
  </footer>
</article>
```

### Kết quả

{{EmbedLiveSample('Examples','','570')}}

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
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content"
          >nội dung palpable</a
        >
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
        >. Lưu ý rằng phần tử <code>&#x3C;article></code> không được là
        phần tử con của phần tử {{HTMLElement("address")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role"
            >article</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role"><code>application</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role"><code>document</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/feed_role"><code>feed</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role"><code>main</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role"><code>region</code></a>
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

- Các phần tử liên quan đến section khác: {{HTMLElement("body")}}, {{HTMLElement("nav")}}, {{HTMLElement("section")}}, {{HTMLElement("aside")}}, {{HTMLElement("Heading_Elements", "h1")}}, {{HTMLElement("Heading_Elements", "h2")}}, {{HTMLElement("Heading_Elements", "h3")}}, {{HTMLElement("Heading_Elements", "h4")}}, {{HTMLElement("Heading_Elements", "h5")}}, {{HTMLElement("Heading_Elements", "h6")}}, {{HTMLElement("hgroup")}}, {{HTMLElement("header")}}, {{HTMLElement("footer")}}, {{HTMLElement("address")}}
- [Sử dụng các section và outline HTML](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements)
