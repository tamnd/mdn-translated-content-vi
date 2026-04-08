---
title: "<style>: The Style Information element"
slug: Web/HTML/Reference/Elements/style
page-type: html-element
browser-compat: html.elements.style
sidebar: htmlsidebar
---

Phần tử **`<style>`** trong [HTML](/en-US/docs/Web/HTML) chứa thông tin style cho một tài liệu hoặc một phần của tài liệu. Nó chứa CSS, được áp dụng cho nội dung của tài liệu chứa phần tử `<style>`.

{{InteractiveExample("HTML Demo: &lt;style&gt;", "tabbed-standard")}}

```html interactive-example
<style>
  p {
    color: #26b72b;
  }
  code {
    font-weight: bold;
  }
</style>

<p>
  This text will be green. Inline styles take precedence over CSS included
  externally.
</p>

<p style="color: blue">
  The <code>style</code> attribute can override it, though.
</p>
```

```css interactive-example
p {
  color: red;
}
```

Phần tử `<style>` phải được đặt bên trong {{htmlelement("head")}} của tài liệu. Nhìn chung, tốt hơn là đặt các style của bạn trong các stylesheet ngoài và áp dụng chúng bằng các phần tử {{htmlelement("link")}}.

Nếu bạn đưa nhiều phần tử `<style>` và `<link>` vào tài liệu, chúng sẽ được áp dụng vào DOM theo thứ tự chúng xuất hiện trong tài liệu — hãy đảm bảo bạn đưa chúng vào đúng thứ tự, để tránh các vấn đề cascade không mong muốn.

Giống như các phần tử `<link>`, các phần tử `<style>` có thể bao gồm các thuộc tính `media` chứa [media queries](/en-US/docs/Web/CSS/Guides/Media_queries), cho phép bạn áp dụng có chọn lọc các stylesheet nội bộ cho tài liệu của mình tùy thuộc vào các đặc điểm của phương tiện như chiều rộng viewport.

## Thuộc tính

Phần tử này bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `blocking`
  - : Thuộc tính này chỉ định rõ ràng rằng một số thao tác nhất định cần bị chặn khi tải xuống các tài nguyên con quan trọng và áp dụng stylesheet cho tài liệu. Các stylesheet được nhập bằng {{cssxref("@import")}} thường được coi là tài nguyên con quan trọng, trong khi {{cssxref("background-image")}} và font thì không. Các thao tác cần bị chặn phải là danh sách các token chặn được phân tách bằng dấu cách như sau. Hiện tại chỉ có một token:
    - `render`: Việc hiển thị nội dung trên màn hình bị chặn.

    > [!NOTE]
    > Chỉ các phần tử `style` trong `<head>` của tài liệu mới có thể chặn hiển thị. Theo mặc định, một phần tử `style` trong `<head>` chặn hiển thị khi trình duyệt phát hiện ra nó trong quá trình phân tích cú pháp. Nếu phần tử `style` như vậy được thêm động thông qua script, bạn phải đặt thêm `blocking = "render"` để nó chặn hiển thị.

- `media`
  - : Thuộc tính này xác định phương tiện nào mà style sẽ được áp dụng. Giá trị của nó là một [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using), mặc định là `all` nếu thuộc tính bị bỏ qua.
- `nonce`
  - : Một {{Glossary("Nonce", "nonce")}} mật mã (số dùng một lần) được dùng để cho phép các style inline trong [Content-Security-Policy style-src](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/style-src). Máy chủ phải tạo một giá trị nonce duy nhất mỗi khi truyền chính sách. Điều quan trọng là cung cấp một nonce không thể đoán được vì nếu không thì việc bỏ qua chính sách của tài nguyên là điều rất dễ xảy ra.
- `title`
  - : Thuộc tính này chỉ định các bộ [stylesheet thay thế](/en-US/docs/Web/HTML/Reference/Attributes/rel/alternate_stylesheet).

### Các thuộc tính đã lỗi thời

- `type` {{deprecated_inline}}
  - : Không nên cung cấp thuộc tính này: nếu có, các giá trị được phép duy nhất là chuỗi rỗng hoặc kết quả khớp không phân biệt chữ hoa thường với `text/css`.

## Ví dụ

### Một stylesheet cơ bản

Trong ví dụ sau, chúng ta áp dụng một stylesheet ngắn cho một tài liệu:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>Test page</title>
    <style>
      p {
        color: red;
      }
    </style>
  </head>
  <body>
    <p>This is my paragraph.</p>
  </body>
</html>
```

#### Kết quả

{{EmbedLiveSample('A_basic_stylesheet', '100%', '100')}}

### Nhiều phần tử style

Trong ví dụ này chúng ta đã bao gồm hai phần tử `<style>` — hãy chú ý cách các khai báo mâu thuẫn trong phần tử `<style>` sau ghi đè những khai báo trong phần tử trước đó, nếu chúng có [độ ưu tiên](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) bằng nhau.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>Test page</title>
    <style>
      p {
        color: white;
        background-color: blue;
        padding: 5px;
        border: 1px solid black;
      }
    </style>
    <style>
      p {
        color: blue;
        background-color: yellow;
      }
    </style>
  </head>
  <body>
    <p>This is my paragraph.</p>
  </body>
</html>
```

#### Kết quả

{{EmbedLiveSample('Multiple_style_elements', '100%', '100')}}

### Bao gồm một media query

Trong ví dụ này chúng ta dựa trên ví dụ trước, thêm thuộc tính `media` vào phần tử `<style>` thứ hai để nó chỉ được áp dụng khi viewport nhỏ hơn 500px về chiều rộng.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>Test page</title>
    <style>
      p {
        color: white;
        background-color: blue;
        padding: 5px;
        border: 1px solid black;
      }
    </style>
    <style media="(width < 500px)">
      p {
        color: blue;
        background-color: yellow;
      }
    </style>
  </head>
  <body>
    <p>This is my paragraph.</p>
  </body>
</html>
```

#### Kết quả

{{EmbedLiveSample('Including_a_media_query', '100%', '100')}}

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
        >.
      </td>
    </tr>
    <tr>
      <th>Nội dung được phép</th>
      <td>
        Nội dung văn bản khớp với thuộc tính <code>type</code>, tức là
        <code>text/css</code>.
      </td>
    </tr>
    <tr>
      <th>Bỏ qua thẻ</th>
      <td>Không thể bỏ qua thẻ nào.</td>
    </tr>
    <tr>
      <th>Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#metadata_content"
          >nội dung metadata</a
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
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th>Giao diện DOM</th>
      <td>{{domxref("HTMLStyleElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("link")}}, cho phép chúng ta áp dụng các stylesheet ngoài cho một tài liệu.
- [Stylesheet thay thế](/en-US/docs/Web/HTML/Reference/Attributes/rel/alternate_stylesheet)
