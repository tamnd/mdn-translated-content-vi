---
title: "<dt>: Phần tử Thuật ngữ mô tả"
slug: Web/HTML/Reference/Elements/dt
page-type: html-element
browser-compat: html.elements.dt
sidebar: htmlsidebar
---

Phần tử **`<dt>`** trong [HTML](/en-US/docs/Web/HTML) chỉ định một thuật ngữ trong danh sách mô tả hoặc định nghĩa, và do đó phải được sử dụng bên trong phần tử {{HTMLElement("dl")}}. Nó thường được theo sau bởi phần tử {{HTMLElement("dd")}}; tuy nhiên, nhiều phần tử `<dt>` liên tiếp chỉ ra nhiều thuật ngữ đều được định nghĩa bởi phần tử {{HTMLElement("dd")}} ngay tiếp theo.

Phần tử {{HTMLElement("dd")}} (**Description Details**) tiếp theo cung cấp định nghĩa hoặc văn bản liên quan khác được liên kết với thuật ngữ được chỉ định bằng `<dt>`.

{{InteractiveExample("HTML Demo: &lt;dt&gt;", "tabbed-standard")}}

```html interactive-example
<p>Please use the following paint colors for the new house:</p>

<dl>
  <dt>Denim (semigloss finish)</dt>
  <dd>Ceiling</dd>

  <dt>Denim (eggshell finish)</dt>
  <dt>Evening Sky (eggshell finish)</dt>
  <dd>Layered on the walls</dd>
</dl>
```

```css interactive-example
p,
dl {
  font:
    1rem "Fira Sans",
    sans-serif;
}

dl > dt {
  font-weight: normal;
  font-style: oblique;
}

dd {
  margin-bottom: 1rem;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ví dụ

Để biết các ví dụ, xem [ví dụ được cung cấp cho phần tử `<dl>`](/en-US/docs/Web/HTML/Reference/Elements/dl#examples).

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>Không có.</td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >, nhưng không có {{HTMLElement("header")}},
        {{HTMLElement("footer")}}, nội dung phân mục hoặc nội dung tiêu đề
        con cháu.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở là bắt buộc. Thẻ đóng có thể bị bỏ qua nếu phần tử này
        ngay sau đó là một phần tử <code>&#x3C;dt></code> khác hoặc một
        phần tử {{HTMLElement("dd")}}, hoặc nếu không còn nội dung nào
        trong phần tử cha.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Phần tử {{HTMLElement("dl")}} hoặc (trong HTML {{Glossary("WHATWG")}},
        HTML {{Glossary("W3C")}} 5.2 và sau này) một
        phần tử {{HTMLElement("div")}} là con của một
        {{HTMLElement("dl")}}.<br />Phần tử này có thể được sử dụng trước
        một phần tử {{HTMLElement("dd")}} hoặc một phần tử <code>&lt;dt&gt;</code>
        khác.
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
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role"
            >listitem</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>
        {{domxref("HTMLElement")}} Cho đến Gecko 1.9.2 (Firefox 4)
        bao gồm, Firefox triển khai
        giao diện {{domxref("HTMLSpanElement")}} cho phần tử này.
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("dl")}}
- {{HTMLElement("dd")}}
