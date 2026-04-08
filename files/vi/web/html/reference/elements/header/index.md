---
title: "<header>: The Header element"
slug: Web/HTML/Reference/Elements/header
page-type: html-element
browser-compat: html.elements.header
sidebar: htmlsidebar
---

Phần tử **`<header>`** trong [HTML](/en-US/docs/Web/HTML) biểu diễn nội dung giới thiệu, thường là một nhóm các công cụ hỗ trợ giới thiệu hoặc điều hướng. Nó có thể chứa một số phần tử tiêu đề nhưng cũng là logo, form tìm kiếm, tên tác giả và các phần tử khác.

{{InteractiveExample("HTML Demo: &lt;header&gt;", "tabbed-standard")}}

```html interactive-example
<header>
  <a class="logo" href="#">Cute Puppies Express!</a>
</header>

<article>
  <header>
    <h1>Beagles</h1>
    <time>08.12.2014</time>
  </header>
  <p>
    I love beagles <em>so</em> much! Like, really, a lot. They're adorable and
    their ears are so, so snugly soft!
  </p>
</article>
```

```css interactive-example
.logo {
  background: left / cover
    url("/shared-assets/images/examples/puppy-header.jpg");
  display: flex;
  height: 120px;
  align-items: center;
  justify-content: center;
  font:
    bold calc(1em + 2 * (100vw - 120px) / 100) "Dancing Script",
    fantasy;
  color: #ff0083;
  text-shadow: black 2px 2px 0.2rem;
}

header > h1 {
  margin-bottom: 0;
}

header > time {
  font: italic 0.7rem sans-serif;
}
```

## Ghi chú sử dụng

Khi không được lồng trong [nội dung sectioning](/en-US/docs/Web/HTML/Guides/Content_categories#sectioning_content), {{htmlelement("main")}}, hoặc một phần tử có cùng vai trò ARIA với vai trò ARIA ngầm định của các phần tử này, thì phần tử `<header>` có ý nghĩa giống với vai trò landmark [`banner`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role) trên toàn trang. Nó định nghĩa một header trang web toàn cục, thường bao gồm logo, tên công ty, tính năng tìm kiếm và có thể là điều hướng toàn cục hoặc slogan. Nó thường nằm ở đầu trang.

Ngược lại, khi được lồng trong các phần tử đã nói, nó mất trạng thái landmark và biểu diễn một nhóm các công cụ hỗ trợ giới thiệu hoặc điều hướng cho section bao quanh. Nó thường chứa tiêu đề của section bao quanh (phần tử `h1` đến `h6`) và phụ tiêu đề tùy chọn, nhưng điều này **không** bắt buộc.

### Lịch sử sử dụng

Phần tử `<header>` ban đầu tồn tại ở đầu HTML dành cho tiêu đề. Nó được thấy trong [website đầu tiên](https://info.cern.ch/). Vào một thời điểm nào đó, các tiêu đề trở thành [`<h1>` đến `<h6>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements), cho phép `<header>` tự do để đảm nhận một vai trò khác.

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Khả năng tiếp cận

Phần tử `<header>` định nghĩa một landmark [`banner`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role) khi ngữ cảnh của nó là phần tử {{HTMLElement('body')}}.

Khi được đặt trong {{HTMLElement('article')}}, {{HTMLElement('main')}}, {{HTMLElement('section')}}, {{HTMLElement('nav')}}, {{HTMLElement('aside')}}, hoặc một phần tử có cùng vai trò ARIA với vai trò ARIA ngầm định của các phần tử này, phần tử `<header>` có vai trò [`generic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role) thay thế, và không còn được coi là landmark. Trong trường hợp này, nó không thể được đánh nhãn bằng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby).

## Ví dụ

### Header trang

```html
<header>
  <h1>Main Page Title</h1>
  <img src="mdn-logo-sm.png" alt="MDN logo" />
</header>
```

#### Kết quả

{{EmbedLiveSample('Page Header')}}

### Header bài viết

```html
<article>
  <header>
    <h2>The Planet Earth</h2>
    <p>
      Posted on Wednesday, <time datetime="2017-10-04">4 October 2017</time> by
      Jane Smith
    </p>
  </header>
  <p>
    We live on a planet that's blue and green, with so many things still unseen.
  </p>
  <p><a href="https://example.com/the-planet-earth/">Continue reading…</a></p>
</article>
```

#### Kết quả

{{EmbedLiveSample('Article Header')}}

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
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content"
          >nội dung palpable</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung flow</a
        >, nhưng không có phần tử con <code>&#x3C;header></code> hay
        {{HTMLElement("footer")}}.
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
        >. Lưu ý rằng phần tử <code>&#x3C;header></code> không được là
        phần tử con của {{HTMLElement("address")}},
        {{HTMLElement("footer")}} hoặc phần tử
        <code>&lt;header&gt;</code> khác.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role">banner</a
        >, hoặc
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"
          >generic</a
        >
        nếu là phần tử con của
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/article">article</a></code
        >, <code><a href="/en-US/docs/Web/HTML/Reference/Elements/aside">aside</a></code
        >, <code><a href="/en-US/docs/Web/HTML/Reference/Elements/main">main</a></code
        >, <code><a href="/en-US/docs/Web/HTML/Reference/Elements/nav">nav</a></code> hoặc
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/section">section</a></code>
        element, hoặc một phần tử với
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role"
            >article</a
          ></code
        >,
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/complementary_role"
            >complementary</a
          ></code
        >,
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role"
            >main</a
          ></code
        >,
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role"
            >navigation</a
          ></code
        >
        hoặc
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role"
            >region</a
          ></code
        > role
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role"><code>group</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a> hoặc
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>
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

- Các phần tử liên quan đến section khác: {{HTMLElement("body")}}, {{HTMLElement("nav")}}, {{HTMLElement("article")}}, {{HTMLElement("aside")}}, {{HTMLElement("Heading_Elements", "h1")}}, {{HTMLElement("Heading_Elements", "h2")}}, {{HTMLElement("Heading_Elements", "h3")}}, {{HTMLElement("Heading_Elements", "h4")}}, {{HTMLElement("Heading_Elements", "h5")}}, {{HTMLElement("Heading_Elements", "h6")}}, {{HTMLElement("footer")}}, {{HTMLElement("section")}}, {{HTMLElement("address")}}.
