---
title: "<figure>: Phần tử Hình ảnh với chú thích tùy chọn"
slug: Web/HTML/Reference/Elements/figure
page-type: html-element
browser-compat: html.elements.figure
sidebar: htmlsidebar
---

Phần tử **`<figure>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho nội dung độc lập, có thể có chú thích tùy chọn, được chỉ định bằng phần tử {{HTMLElement("figcaption")}}. Hình ảnh, chú thích và nội dung của nó được tham chiếu như một đơn vị duy nhất.

{{InteractiveExample("HTML Demo: &lt;figure&gt;", "tabbed-shorter")}}

```html interactive-example
<figure>
  <img
    src="/shared-assets/images/examples/elephant.jpg"
    alt="Elephant at sunset" />
  <figcaption>An elephant at sunset</figcaption>
</figure>
```

```css interactive-example
figure {
  border: thin silver solid;
  display: flex;
  flex-flow: column;
  padding: 5px;
  max-width: 220px;
  margin: auto;
}

img {
  max-width: 220px;
  max-height: 150px;
}

figcaption {
  background-color: #222222;
  color: white;
  font: italic smaller sans-serif;
  padding: 3px;
  text-align: center;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

- Thông thường `<figure>` là hình ảnh, minh họa, sơ đồ, đoạn mã, v.v., được tham chiếu trong luồng chính của tài liệu, nhưng có thể được chuyển đến phần khác của tài liệu hoặc phụ lục mà không ảnh hưởng đến luồng chính.
- Chú thích có thể được liên kết với phần tử `<figure>` bằng cách chèn {{HTMLElement("figcaption")}} vào bên trong nó (là con đầu tiên hoặc cuối cùng). Phần tử `<figcaption>` đầu tiên tìm thấy trong hình ảnh được trình bày làm chú thích của hình ảnh.
- `<figcaption>` cung cấp {{glossary("accessible name")}} cho phần tử `<figure>` cha.

## Ví dụ

### Hình ảnh

```html
<!-- Just an image -->
<figure>
  <img src="favicon-192x192.png" alt="The beautiful MDN logo." />
</figure>

<!-- Image with a caption -->
<figure>
  <img src="favicon-192x192.png" alt="The beautiful MDN logo." />
  <figcaption>MDN Logo</figcaption>
</figure>
```

#### Kết quả

{{EmbedLiveSample("Images", "100%", 375)}}

### Đoạn mã

```html
<figure>
  <figcaption>Get browser details using <code>navigator</code>.</figcaption>
  <pre>
function NavigatorExample() {
  let txt = `Browser CodeName: ${navigator.appCodeName};\n`;
  txt += `Browser Name: ${navigator.appName};\n`;
  txt += `Browser Version: ${navigator.appVersion};\n`;
  txt += `Cookies Enabled: ${navigator.cookieEnabled};\n`;
  txt += `Platform: ${navigator.platform};\n`;
  txt += `User-agent header: ${navigator.userAgent};`;
  console.log("NavigatorExample", txt);
}
  </pre>
</figure>
```

#### Kết quả

{{EmbedLiveSample("Code_snippets", "100%", 250)}}

### Trích dẫn

```html
<figure>
  <figcaption><b>Edsger Dijkstra:</b></figcaption>
  <blockquote>
    If debugging is the process of removing software bugs, then programming must
    be the process of putting them in.
  </blockquote>
</figure>
```

#### Kết quả

{{EmbedLiveSample('Quotations')}}

### Thơ ca

```html
<figure>
  <p>
    Bid me discourse, I will enchant thine ear,<br />
    Or like a fairy trip upon the green,<br />
    Or, like a nymph, with long dishevelled hair,<br />
    Dance on the sands, and yet no footing seen:<br />
    Love is a spirit all compact of fire,<br />
    Not gross to sink, but light, and will aspire.<br />
  </p>
  <figcaption><cite>Venus and Adonis</cite>, by William Shakespeare</figcaption>
</figure>
```

#### Kết quả

{{EmbedLiveSample("Poems", "100%", 250)}}

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
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content"
          >nội dung hữu hình</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Một phần tử {{HTMLElement("figcaption")}}, theo sau là
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >; hoặc nội dung luồng theo sau là một
        phần tử {{HTMLElement("figcaption")}}; hoặc nội dung luồng.
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
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/figure_role"
          >figure</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        Khi không có con
        <a href="/en-US/docs/Web/HTML/Reference/Elements/figcaption">figcaption</a>:
        <a href="https://w3c.github.io/html-aria/#dfn-any-role">bất kỳ</a>,
        ngược lại không có vai trò nào được phép
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

- Phần tử {{HTMLElement("figcaption")}}.
