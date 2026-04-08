---
title: "<cite>: The Citation element"
slug: Web/HTML/Reference/Elements/cite
page-type: html-element
browser-compat: html.elements.cite
sidebar: htmlsidebar
---

Phần tử **`<cite>`** trong [HTML](/en-US/docs/Web/HTML) được sử dụng để đánh dấu tiêu đề của một tác phẩm sáng tạo. Tham chiếu có thể ở dạng viết tắt theo các quy ước phù hợp với ngữ cảnh liên quan đến siêu dữ liệu trích dẫn.

{{InteractiveExample("HTML Demo: &lt;cite&gt;", "tabbed-standard")}}

```html interactive-example
<figure>
  <blockquote>
    <p>
      It was a bright cold day in April, and the clocks were striking thirteen.
    </p>
  </blockquote>
  <figcaption>
    First sentence in
    <cite
      ><a href="http://www.george-orwell.org/1984/0.html"
        >Nineteen Eighty-Four</a
      ></cite
    >
    by George Orwell (Part 1, Chapter 1).
  </figcaption>
</figure>
```

```css interactive-example
cite {
  /* Add your styles here */
}
```

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Trong ngữ cảnh của phần tử `<cite>`, một tác phẩm sáng tạo có thể là, ví dụ, một trong những điều sau:

- Một cuốn sách
- Một bài báo nghiên cứu
- Một bài luận
- Một bài thơ
- Một bản nhạc
- Một bài hát
- Một kịch bản sân khấu hoặc phim
- Một bộ phim
- Một chương trình truyền hình
- Một trò chơi
- Một tác phẩm điêu khắc
- Một bức tranh
- Một sản xuất sân khấu
- Một vở kịch
- Một vở opera
- Một bộ nhạc kịch
- Một triển lãm
- Một báo cáo vụ án pháp lý
- Một chương trình máy tính
- Một trang web
- Một trang web
- Một bài đăng blog hoặc bình luận
- Một bài đăng diễn đàn hoặc bình luận
- Một tweet
- Một bài đăng Facebook
- Một tuyên bố bằng lời nói hoặc văn bản
- Và vân vân.

Để bao gồm tham chiếu đến nguồn của tài liệu được trích dẫn nằm trong phần tử {{HTMLElement("blockquote")}} hoặc {{HTMLElement("q")}}, hãy sử dụng thuộc tính [`cite`](/en-US/docs/Web/HTML/Reference/Elements/blockquote#cite) trên phần tử.

Thông thường, các trình duyệt tạo kiểu nội dung của phần tử `<cite>` bằng chữ nghiêng theo mặc định. Để tránh điều này, áp dụng thuộc tính CSS {{cssxref("font-style")}} cho phần tử `<cite>`.

## Ví dụ

```html
<p>More information can be found in <cite>[ISO-0000]</cite>.</p>
```

### Kết quả

{{EmbedLiveSample("Example", 640, 80)}}

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
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
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
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Các vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>
        {{domxref("HTMLElement")}} Đến Gecko 1.9.2 (Firefox 4)
        bao gồm, Firefox triển khai giao diện
        {{domxref("HTMLSpanElement")}} cho phần tử này.
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("blockquote")}} cho các trích dẫn dài.
- Phần tử {{HTMLElement("q")}} cho các trích dẫn inline và thuộc tính [`cite`](/en-US/docs/Web/HTML/Reference/Elements/q#cite).
