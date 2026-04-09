---
title: "<q>: The Inline Quotation element"
slug: Web/HTML/Reference/Elements/q
page-type: html-element
browser-compat: html.elements.q
sidebar: htmlsidebar
---

Phần tử **`<q>`** trong [HTML](/en-US/docs/Web/HTML) chỉ ra rằng văn bản bên trong là một trích dẫn nội tuyến ngắn. Hầu hết các trình duyệt hiện đại thực hiện điều này bằng cách bao quanh văn bản bằng dấu ngoặc kép. Phần tử này được dùng cho các trích dẫn ngắn không cần ngắt đoạn; đối với các trích dẫn dài hãy dùng phần tử {{HTMLElement("blockquote")}}.

{{InteractiveExample("HTML Demo: &lt;q&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  When Dave asks HAL to open the pod bay door, HAL answers:
  <q
    cite="https://www.imdb.com/title/tt0062622/quotes/?item=qt0396921&ref_=ext_shr_lnk">
    I'm sorry, Dave. I'm afraid I can't do that.
  </q>
</p>
```

```css interactive-example
q {
  font-style: italic;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `cite`
  - : Giá trị của thuộc tính này là một URL trỏ đến tài liệu hoặc thông điệp nguồn cho thông tin được trích dẫn. Thuộc tính này nhằm chỉ đến thông tin giải thích ngữ cảnh hoặc tham chiếu cho trích dẫn.

## Ví dụ

```html
<p>
  According to Mozilla's website,
  <q cite="https://www.mozilla.org/en-US/about/history/details/">
    Firefox 1.0 was released in 2004 and became a big success.
  </q>
</p>
```

### Kết quả

{{EmbedLiveSample('Example')}}

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
        >, nội dung rõ ràng.
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
      <th scope="row">Bỏ thẻ</th>
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
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
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLQuoteElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("blockquote")}} cho các trích dẫn dài.
- Phần tử {{HTMLElement("cite")}} cho các tham chiếu nguồn.
