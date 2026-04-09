---
title: "<meta>: The metadata element"
slug: Web/HTML/Reference/Elements/meta
page-type: html-element
browser-compat: html.elements.meta
sidebar: htmlsidebar
---

Phần tử **`<meta>`** [HTML](/en-US/docs/Web/HTML) đại diện cho {{Glossary("Metadata","metadata")}} không thể được biểu diễn bởi các phần tử liên quan đến meta khác, như {{HTMLElement("base")}}, {{HTMLElement("link")}}, {{HTMLElement("script")}}, {{HTMLElement("style")}}, hoặc {{HTMLElement("title")}}.

Loại metadata được cung cấp bởi phần tử `<meta>` có thể là một trong các loại sau:

- Nếu thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) được đặt, phần tử `<meta>` cung cấp _metadata cấp tài liệu_ áp dụng cho toàn bộ trang.
- Nếu thuộc tính [`http-equiv`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv) được đặt, phần tử `<meta>` hoạt động như _chỉ thị pragma_ để mô phỏng các chỉ thị có thể được cung cấp bởi tiêu đề HTTP.
- Nếu thuộc tính [`charset`](#charset) được đặt, phần tử `<meta>` là _khai báo charset_, cung cấp mã hóa ký tự mà tài liệu được mã hóa.
- Nếu thuộc tính [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop) được đặt, phần tử `<meta>` cung cấp _metadata do người dùng định nghĩa_.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

> [!NOTE]
> Thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) có ý nghĩa cụ thể cho phần tử `<meta>`.
> Thuộc tính [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop) không được đặt trên phần tử `<meta>` bao gồm thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name), [`http-equiv`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv), hoặc [`charset`](#charset).

- `charset`
  - : Thuộc tính này khai báo mã hóa ký tự của tài liệu. Nếu thuộc tính có mặt, giá trị của nó phải là khớp không phân biệt hoa thường ASCII với chuỗi `"utf-8"`, vì UTF-8 là mã hóa duy nhất hợp lệ cho các tài liệu HTML5. Các phần tử `<meta>` khai báo mã hóa ký tự phải nằm hoàn toàn trong 1024 byte đầu tiên của tài liệu.
- [`content`](/en-US/docs/Web/HTML/Reference/Attributes/content)
  - : Thuộc tính này chứa giá trị cho thuộc tính [`http-equiv`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv) hoặc [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name), tùy thuộc vào cái nào được sử dụng.
- [`http-equiv`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv)
  - : Xác định chỉ thị pragma, là các hướng dẫn cho trình duyệt để xử lý tài liệu.
    Tên thuộc tính là viết tắt của `http-equivalent` vì các giá trị được phép là tên của các tiêu đề HTTP tương đương.
- `media`
  - : Thuộc tính `media` xác định media nào màu chủ đề được định nghĩa trong thuộc tính `content` nên được áp dụng.
    Giá trị của nó là [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using), mặc định là `all` nếu thuộc tính bị thiếu.
    Thuộc tính này chỉ liên quan khi thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) của phần tử được đặt thành [`theme-color`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/theme-color).
    Nếu không, nó không có hiệu ứng và không nên được bao gồm.
- [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name)
  - : Các thuộc tính `name` và `content` có thể được sử dụng cùng nhau để cung cấp metadata tài liệu dưới dạng các cặp tên-giá trị, với thuộc tính `name` cung cấp tên metadata và thuộc tính `content` cung cấp giá trị.

## Ví dụ

### Đặt mô tả meta

Thẻ `<meta>` sau đây cung cấp `description` làm metadata cho trang web:

```html
<meta
  name="description"
  content="The HTML reference describes all elements and attributes of HTML, including global attributes that apply to all elements." />
```

### Đặt chuyển hướng trang

Ví dụ sau sử dụng `http-equiv="refresh"` để hướng dẫn trình duyệt thực hiện chuyển hướng.
Thuộc tính `content="3;url=https://www.mozilla.org"` sẽ chuyển hướng trang đến `https://www.mozilla.org` sau 3 giây:

```html
<meta http-equiv="refresh" content="3;url=https://www.mozilla.org" />
```

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#metadata_content"
          >Nội dung metadata</a
        >. Nếu thuộc tính <a href="/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop"><code>itemprop</code></a> có mặt:
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th>Nội dung được phép</th>
      <td>Không có; đây là {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th>Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th>Cha được phép</th>
      <td>
        <ul>
          <li>
            <code>&#x3C;meta charset></code>,
            <code>&#x3C;meta http-equiv></code>: phần tử
            {{HTMLElement("head")}}. Nếu
            <a href="/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv"><code>http-equiv</code></a> không phải là
            khai báo mã hóa, nó cũng có thể ở bên trong phần tử
            {{HTMLElement("noscript")}}, bản thân nó bên trong
            phần tử <code>&#x3C;head></code>.
          </li>
          <li>
            <code>&#x3C;meta name></code>: bất kỳ phần tử nào chấp nhận
            <a
              href="/en-US/docs/Web/HTML/Guides/Content_categories#metadata_content"
              >nội dung metadata</a
            >.
          </li>
          <li>
            <code>&#x3C;meta itemprop></code>: bất kỳ phần tử nào chấp nhận
            <a
              href="/en-US/docs/Web/HTML/Guides/Content_categories#metadata_content"
              >nội dung metadata</a
            >
            hoặc
            <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
              >nội dung luồng</a
            >.
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ẩn</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> được phép</td>
    </tr>
    <tr>
      <th>Giao diện DOM</th>
      <td>{{domxref("HTMLMetaElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tên metadata chuẩn](/en-US/docs/Web/HTML/Reference/Elements/meta/name)
- [Học: `<meta>`](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#metadata_the_meta_element)
