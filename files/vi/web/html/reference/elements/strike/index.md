---
title: <strike>
slug: Web/HTML/Reference/Elements/strike
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.strike
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<strike>`** trong [HTML](/en-US/docs/Web/HTML) đặt đường gạch ngang (đường ngang) lên văn bản.

> [!WARNING]
> Phần tử này đã bị deprecated trong HTML 4 và XHTML 1, và bị loại bỏ trong [HTML Living Standard](https://html.spec.whatwg.org/multipage/obsolete.html#strike). Nếu đúng về mặt ngữ nghĩa, tức là nếu nó đại diện cho nội dung _đã bị xóa_, hãy dùng {{HTMLElement("del")}} thay thế. Trong tất cả các trường hợp khác hãy dùng {{HTMLElement("s")}}.

## Thuộc tính

Phần tử này bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ví dụ

```html
&lt;strike&gt;: <strike>Today's Special: Salmon</strike> SOLD OUT<br />
&lt;s&gt;: <s>Today's Special: Salmon</s> SOLD OUT
```

### Kết quả

{{EmbedLiveSample("Example")}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{DOMxRef("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("s")}}.
- Phần tử {{HTMLElement("del")}} nên được dùng nếu dữ liệu đã _bị xóa_.
- Thuộc tính CSS {{CSSxRef("text-decoration")}} có thể được dùng để tạo kiểu văn bản với đường gạch ngang.
