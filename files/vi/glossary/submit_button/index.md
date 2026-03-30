---
title: Nút gửi
slug: Glossary/Submit_button
page-type: glossary-definition
sidebar: glossarysidebar
---

**Nút gửi** (submit button) là một {{Glossary("element","phần tử")}} trong HTML có thể được dùng để gửi một {{HTMLElement("form")}}. Các phần tử nút gửi gốc là:

- {{HtmlElement("button")}} (kiểu mặc định là `"submit"`)
- `{{HtmlElement('input/submit', '&lt;input type="submit"&gt;')}}`
- `{{HtmlElement('input/image', '&lt;input type="image"&gt;')}}`

Ngoài việc gửi biểu mẫu, nút gửi có thể ảnh hưởng đến hành vi của biểu mẫu và dữ liệu nào được gửi đi.

## Ghi đè hành vi của biểu mẫu

Nút gửi có thể ghi đè hành vi gửi của biểu mẫu thông qua các thuộc tính khác nhau:

- `{{HtmlElement("button#formaction", "formaction")}}`: Ghi đè thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) của biểu mẫu.
- `{{HtmlElement("button#formenctype", "formenctype")}}`: Ghi đè thuộc tính [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của biểu mẫu.
- `{{HtmlElement("button#formmethod", "formmethod")}}`: Ghi đè thuộc tính [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) của biểu mẫu.
- `{{HtmlElement("button#formnovalidate", "formnovalidate")}}`: Ghi đè thuộc tính [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) của biểu mẫu.
- `{{HtmlElement("button#formtarget", "formtarget")}}`: Ghi đè thuộc tính [`target`](/en-US/docs/Web/HTML/Reference/Elements/form#target) của biểu mẫu.

## Mục dữ liệu biểu mẫu

Nếu nút gửi là một {{HtmlElement("button")}} hoặc `{{HtmlElement('input/submit', '&lt;input type="submit"&gt;')}}` và có thuộc tính `name`, tập dữ liệu biểu mẫu sẽ bao gồm một mục cho `name` và `value` của nó.

Nếu nút gửi là `{{HtmlElement('input/image', '&lt;input type="image"&gt;')}}`, tập dữ liệu biểu mẫu sẽ bao gồm các mục cho tọa độ X và Y mà người dùng đã nhấp vào (ví dụ: `x=100&y=200` hoặc `buttonName.x=123&buttonName.y=234`).

## Xem thêm

- [Các điều khiển biểu mẫu gốc cơ bản](/en-US/docs/Learn_web_development/Extensions/Forms/Basic_native_form_controls)
- [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data)
