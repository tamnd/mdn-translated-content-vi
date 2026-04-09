---
title: "<bdo>: The Bidirectional Text Override element"
slug: Web/HTML/Reference/Elements/bdo
page-type: html-element
browser-compat: html.elements.bdo
sidebar: htmlsidebar
---

Phần tử **`<bdo>`** trong [HTML](/en-US/docs/Web/HTML) ghi đè hướng văn bản hiện tại, sao cho văn bản bên trong được hiển thị theo hướng khác.

{{InteractiveExample("HTML Demo: &lt;bdo&gt;", "tabbed-standard")}}

```html interactive-example
<h1>Famous seaside songs</h1>

<p>The English song "Oh I do like to be beside the seaside"</p>

<p>
  Looks like this in Hebrew:
  <span dir="rtl">אה, אני אוהב להיות ליד חוף הים</span>
</p>

<p>
  In the computer's memory, this is stored as
  <bdo dir="ltr">אה, אני אוהב להיות ליד חוף הים</bdo>
</p>
```

```css interactive-example
html {
  font-family: sans-serif;
}

bdo {
  /* Add your styles here */
}
```

Các ký tự của văn bản được vẽ từ điểm bắt đầu theo hướng đã cho; hướng của các ký tự riêng lẻ không bị ảnh hưởng (vì vậy các ký tự không bị vẽ ngược, ví dụ).

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `dir`
  - : Hướng mà văn bản nên được hiển thị trong nội dung của phần tử này. Các giá trị có thể có là:
    - `ltr`: Chỉ ra rằng văn bản nên đi theo hướng từ trái sang phải.
    - `rtl`: Chỉ ra rằng văn bản nên đi theo hướng từ phải sang trái.

## Ví dụ

```html
<!-- Switch text direction -->
<p>This text will go left to right.</p>
<p><bdo dir="rtl">This text will go right to left.</bdo></p>
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Ghi chú

Đặc tả HTML 4 không chỉ định các sự kiện cho phần tử này; chúng đã được thêm vào trong XHTML. Đây có thể là một sự bỏ sót.

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
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"
            >generic</a
          ></code
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
        <code
          ><a href="/en-US/docs/Web/API/HTMLSpanElement"
            >HTMLSpanElement</a
          ></code
        >
        cho phần tử này.
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML liên quan: {{HTMLElement("bdi")}}
