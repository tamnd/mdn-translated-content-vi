---
title: "HTMLFieldSetElement: thuộc tính disabled"
short-title: disabled
slug: Web/API/HTMLFieldSetElement/disabled
page-type: web-api-instance-property
browser-compat: api.HTMLFieldSetElement.disabled
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`disabled`** của giao diện {{domxref("HTMLFieldSetElement")}} là một giá trị logic phản ánh thuộc tính {{htmlelement("fieldset")}} [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/fieldset#disabled), cho biết liệu điều khiển có bị vô hiệu hóa hay không.

Khi bị vô hiệu hóa, tất cả các phần tử điều khiển form là con cháu của phần tử `<fieldset>`, trừ các phần tử là con cháu của phần tử con {{htmlelement("legend")}} của `<fieldset>` (nếu có), đều bị vô hiệu hóa. Một phần tử bị vô hiệu hóa sẽ không thể sử dụng và không thể nhấp, đồng thời khớp với bộ chọn {{cssxref(":disabled")}}, ngay cả khi giá trị thuộc tính `disabled` của chúng là false.

## Giá trị

Một giá trị logic.

## Ví dụ

```js
const fs = document.getElementById("billing-address");
console.log(fs.disabled);
fs.disabled = true;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled)
- Các lớp giả CSS {{cssxref(":disabled")}} và {{cssxref(":enabled")}}
