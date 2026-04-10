---
title: "HTMLIFrameElement: thuộc tính name"
short-title: name
slug: Web/API/HTMLIFrameElement/name
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.name
---

{{APIRef("HTML DOM")}}

Thuộc tính **`name`** của giao diện {{domxref("HTMLIFrameElement")}} là một giá trị chuỗi phản ánh thuộc tính `name` của phần tử {{HTMLElement("iframe")}}, cho biết tên cụ thể của phần tử `<iframe>`.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<iframe id="el" name="example"></iframe>
```

```js
const el = document.getElementById("el");
console.log(el.name); // Output: "example"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
