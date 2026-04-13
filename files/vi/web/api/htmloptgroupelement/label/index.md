---
title: "HTMLOptGroupElement: thuộc tính label"
short-title: label
slug: Web/API/HTMLOptGroupElement/label
page-type: web-api-instance-property
browser-compat: api.HTMLOptGroupElement.label
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`label`** của giao diện {{domxref("HTMLOptGroupElement")}} là một giá trị chuỗi phản ánh thuộc tính [`label`](/en-US/docs/Web/HTML/Reference/Elements/optgroup#label) của phần tử {{htmlelement("optgroup")}}, cung cấp một nhãn dạng văn bản cho nhóm các tùy chọn.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const optionGroup = document.getElementById("groupB");
console.log(optionGroup.label);
optionGroup.label = `${optionGroup.label} (${optionGroup.children.length})`;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{htmlelement("optgroup")}}
- Thuộc tính [`label`](/en-US/docs/Web/HTML/Reference/Elements/optgroup#label) của HTML
