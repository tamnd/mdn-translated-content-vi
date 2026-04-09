---
title: "<legend>: Phần tử chú thích Field Set"
slug: Web/HTML/Reference/Elements/legend
page-type: html-element
browser-compat: html.elements.legend
sidebar: htmlsidebar
---

Phần tử **`<legend>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho chú thích cho nội dung của phần tử cha {{HTMLElement("fieldset")}}.

Trong [các phần tử `<select>` có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select), phần tử `<legend>` được cho phép là con của `<optgroup>`, để cung cấp nhãn dễ nhắm mục tiêu và tạo kiểu. Điều này thay thế bất kỳ văn bản nào được đặt trong thuộc tính `label` của phần tử `<optgroup>`, và nó có cùng ngữ nghĩa.

{{InteractiveExample("HTML Demo: &lt;legend&gt;", "tabbed-standard")}}

```html interactive-example
<fieldset>
  <legend>Choose your favorite monster</legend>

  <input type="radio" id="kraken" name="monster" value="K" />
  <label for="kraken">Kraken</label><br />

  <input type="radio" id="sasquatch" name="monster" value="S" />
  <label for="sasquatch">Sasquatch</label><br />

  <input type="radio" id="mothman" name="monster" value="M" />
  <label for="mothman">Mothman</label>
</fieldset>
```

```css interactive-example
legend {
  background-color: black;
  color: white;
  padding: 3px 6px;
}

input {
  margin: 0.4rem;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ví dụ

Xem {{HTMLElement("form")}} để biết ví dụ về `<legend>`.

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
      <th scope="row">Nội dung cho phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >
        và
        <a href="/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements">các tiêu đề</a>
        (phần tử h1–h6).
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha cho phép</th>
      <td>
        {{HTMLElement("fieldset")}} có con đầu tiên là phần tử
        <code>&#x3C;legend></code> này. Trong <a href="/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select">phần tử select có thể tùy chỉnh</a>, phần tử <code>&#x3C;legend></code> được cho phép là con của {{htmlelement("optgroup")}}.
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
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLLegendElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: Vai trò Form](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/form_role)
