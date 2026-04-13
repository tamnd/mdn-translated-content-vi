---
title: "HTMLOptGroupElement: thuộc tính disabled"
short-title: disabled
slug: Web/API/HTMLOptGroupElement/disabled
page-type: web-api-instance-property
browser-compat: api.HTMLOptGroupElement.disabled
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`disabled`** của giao diện {{domxref("HTMLOptGroupElement")}} là một giá trị kiểu logic (boolean) phản ánh thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/optgroup#disabled) của phần tử {{htmlelement("optgroup")}}, cho biết điều khiển có bị vô hiệu hóa hay không.

Khi bị vô hiệu hóa, các phần tử con {{htmlelement("option")}} của phần tử `<optgroup>` sẽ không thể sử dụng, không thể nhấp và không thể chọn. Các phần tử `<option>` bị vô hiệu hóa này sẽ khớp với bộ chọn {{cssxref(":disabled")}}, ngay cả khi giá trị thuộc tính `disabled` của chúng là false.

## Giá trị

Một giá trị kiểu logic (boolean).

## Ví dụ

```js
const optionGroup = document.getElementById("groupB");
console.log(optionGroup.disabled);
optionGroup.disabled = true;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled) của HTML
- Các lớp giả {{cssxref(":disabled")}} và {{cssxref(":enabled")}} trong CSS
