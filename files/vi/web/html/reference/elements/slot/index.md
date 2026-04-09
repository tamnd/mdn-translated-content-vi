---
title: "<slot>: Phần tử slot của Web Component"
slug: Web/HTML/Reference/Elements/slot
page-type: html-element
browser-compat: html.elements.slot
sidebar: htmlsidebar
---

Phần tử **`<slot>`** trong [HTML](/en-US/docs/Web/HTML) — là một phần của bộ công nghệ [Web Components](/en-US/docs/Web/API/Web_components) — là chỗ giữ chỗ bên trong web component mà bạn có thể điền vào bằng đánh dấu riêng của mình, cho phép bạn tạo các cây DOM riêng biệt và trình bày chúng cùng nhau.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `name`
  - : Tên của slot. Khi component chứa slot được hiển thị, slot được hiển thị với con của custom element có thuộc tính [`slot`](/en-US/docs/Web/HTML/Reference/Global_attributes/slot) phù hợp. _Named slot_ là phần tử `<slot>` với thuộc tính `name`. Các slot không có tên mặc định là chuỗi rỗng. Tên phải là duy nhất cho mỗi shadow root: nếu bạn có hai slot với cùng tên, tất cả các phần tử có thuộc tính `slot` phù hợp sẽ được gán cho slot đầu tiên có tên đó.

## Ví dụ

```html
<template id="element-details-template">
  <style>
    details {
      font-family: "Open Sans Light", "Helvetica", "Arial", sans-serif;
    }
    .name {
      font-weight: bold;
      color: #217ac0;
      font-size: 120%;
    }
    h4 {
      margin: 10px 0 -8px 0;
      background: #217ac0;
      color: white;
      padding: 2px 6px;
      border: 1px solid #cee9f9;
      border-radius: 4px;
    }
    .attributes {
      margin-left: 22px;
      font-size: 90%;
    }
    .attributes p {
      margin-left: 16px;
      font-style: italic;
    }
  </style>
  <details>
    <summary>
      <code class="name">
        &lt;<slot name="element-name">NEED NAME</slot>&gt;
      </code>
      <span class="desc"><slot name="description">NEED DESCRIPTION</slot></span>
    </summary>
    <div class="attributes">
      <h4>Attributes</h4>
      <slot name="attributes"><p>None</p></slot>
    </div>
  </details>
  <hr />
</template>
```

> [!NOTE]
> Bạn có thể xem ví dụ đầy đủ này hoạt động tại [element-details](https://github.com/mdn/web-components-examples/tree/main/element-details) (xem nó [chạy trực tiếp](https://mdn.github.io/web-components-examples/element-details/)). Ngoài ra, bạn có thể tìm phần giải thích tại [Using templates and slots](/en-US/docs/Web/API/Web_components/Using_templates_and_slots).

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
          >nội dung diễn đạt</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#transparent_content_model"
          >Trong suốt</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Sự kiện</th>
      <td>{{domxref("HTMLSlotElement/slotchange_event", "slotchange")}}</td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung diễn đạt</a
        >
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
      <td>{{domxref("HTMLSlotElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("template")}}
- Thuộc tính HTML [`slot`](/en-US/docs/Web/HTML/Reference/Global_attributes/slot)
- Phần tử giả CSS {{CSSXref("::slotted")}}
- Lớp giả CSS {{cssxref(":has-slotted")}}
- Mô-đun [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping)
