---
title: "<dd>: Phần tử Chi tiết mô tả"
slug: Web/HTML/Reference/Elements/dd
page-type: html-element
browser-compat: html.elements.dd
sidebar: htmlsidebar
---

Phần tử **`<dd>`** trong [HTML](/en-US/docs/Web/HTML) cung cấp mô tả, định nghĩa hoặc giá trị cho thuật ngữ đứng trước ({{HTMLElement("dt")}}) trong danh sách mô tả ({{HTMLElement("dl")}}).

{{InteractiveExample("HTML Demo: &lt;dd&gt;", "tabbed-standard")}}

```html interactive-example
<p>Cryptids of Cornwall:</p>

<dl>
  <dt>Beast of Bodmin</dt>
  <dd>A large feline inhabiting Bodmin Moor.</dd>

  <dt>Morgawr</dt>
  <dd>A sea serpent.</dd>

  <dt>Owlman</dt>
  <dd>A giant owl-like creature.</dd>
</dl>
```

```css interactive-example
p,
dt {
  font-weight: bold;
}

dl,
dd {
  font-size: 0.9rem;
}

dd {
  margin-bottom: 1em;
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
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở là bắt buộc. Thẻ đóng có thể bị bỏ qua nếu phần tử này
        ngay sau đó là một phần tử <code>&#x3C;dd></code> khác hoặc một
        phần tử {{HTMLElement("dt")}}, hoặc nếu không còn nội dung nào
        trong phần tử cha.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Phần tử {{HTMLElement("dl")}} hoặc một
        phần tử {{HTMLElement("div")}} là con của một
        {{HTMLElement("dl")}}.<br />Phần tử này có thể được sử dụng sau
        một phần tử {{HTMLElement("dt")}} hoặc một phần tử <code>&lt;dd&gt;</code>
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
      <td>Không có <code>role</code> nào được phép</td>
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

- {{HTMLElement("dl")}}
- {{HTMLElement("dt")}}
