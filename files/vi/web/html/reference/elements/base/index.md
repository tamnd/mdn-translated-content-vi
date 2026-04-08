---
title: "<base>: The Document Base URL element"
slug: Web/HTML/Reference/Elements/base
page-type: html-element
browser-compat: html.elements.base
sidebar: htmlsidebar
---

Phần tử **`<base>`** [HTML](/en-US/docs/Web/HTML) chỉ định URL cơ sở để sử dụng cho tất cả các URL _tương đối_ trong một tài liệu. Chỉ có thể có một phần tử `<base>` trong một tài liệu.

URL cơ sở được sử dụng của tài liệu có thể được truy cập bằng script với {{domxref('Node.baseURI')}}. Nếu tài liệu không có phần tử `<base>`, thì `baseURI` mặc định là {{domxref("location.href")}}.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

> [!WARNING]
> Phần tử `<base>` phải có thuộc tính `href`, thuộc tính `target`, hoặc cả hai.
> Nếu ít nhất một trong các thuộc tính này được chỉ định, phần tử `<base>` **phải** xuất hiện trước các phần tử khác có giá trị thuộc tính là URL, chẳng hạn như thuộc tính `href` của {{HTMLElement("link")}}.

- `href`
  - : URL cơ sở được sử dụng trong toàn bộ tài liệu cho các URL tương đối.
    Cho phép URL tuyệt đối và tương đối.
    URL [`data:`](/en-US/docs/Web/URI/Reference/Schemes/data) và [`javascript:`](/en-US/docs/Web/URI/Reference/Schemes/javascript) không được phép.
- `target`
  - : Một **từ khóa** hoặc **tên do tác giả định nghĩa** của {{Glossary("browsing context")}} mặc định để hiển thị kết quả điều hướng từ các phần tử {{HTMLElement("a")}}, {{HTMLElement("area")}}, hoặc {{HTMLElement("form")}} không có thuộc tính `target` rõ ràng. Các từ khóa sau có ý nghĩa đặc biệt:
    - `_self` (mặc định): Hiển thị kết quả trong ngữ cảnh duyệt hiện tại.
    - `_blank`: Hiển thị kết quả trong ngữ cảnh duyệt mới, không có tên.
    - `_parent`: Hiển thị kết quả trong ngữ cảnh duyệt cha của ngữ cảnh hiện tại, nếu trang hiện tại nằm bên trong frame. Nếu không có cha, hoạt động như `_self`.
    - `_top`: Hiển thị kết quả trong ngữ cảnh duyệt trên cùng (ngữ cảnh duyệt là tổ tiên của ngữ cảnh hiện tại và không có cha). Nếu không có cha, hoạt động như `_self`.

## Ghi chú sử dụng

### Nhiều phần tử \<base>

Nếu nhiều phần tử `<base>` được sử dụng, chỉ `href` đầu tiên và `target` đầu tiên được tuân theo — tất cả các phần tử khác đều bị bỏ qua.

### Neo trong trang

Các liên kết trỏ đến một fragment trong tài liệu — ví dụ: `<a href="#some-id">` — được giải quyết với `<base>`, kích hoạt yêu cầu HTTP đến URL cơ sở với fragment được đính kèm.

Ví dụ: với `<base href="https://example.com/">` và liên kết này: `<a href="#anchor">To anchor</a>`. Liên kết trỏ đến `https://example.com/#anchor`.

### target không được chứa ký tự xuống dòng ASCII, tab hoặc <

Nếu thuộc tính [`target`](#target) chứa ký tự xuống dòng ASCII, tab hoặc ký tự `<`, giá trị được đặt lại thành `_blank`.
Điều này nhằm ngăn các cuộc tấn công injection dangling markup, một cuộc tấn công không dùng script trong đó thuộc tính `target` chưa đóng được chèn vào trang để mọi văn bản tiếp theo được ghi lại cho đến khi trình duyệt gặp ký tự đóng thuộc tính.

### Open Graph

Các thẻ [Open Graph](https://ogp.me/) không nhận `<base>`, và phải luôn có URL tuyệt đối đầy đủ. Ví dụ:

```html
<meta property="og:image" content="https://example.com/thumbnail.jpg" />
```

## Ví dụ

```html
<base href="https://www.example.com/" />
<base target="_blank" />
<base target="_top" href="https://example.com/" />
```

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>Nội dung metadata.</td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có; đây là {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Cha được phép</th>
      <td>
        {{HTMLElement("head")}} không chứa phần tử <code>&lt;base&gt;</code> khác.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ẩn</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">Không có vai trò tương ứng</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLBaseElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
