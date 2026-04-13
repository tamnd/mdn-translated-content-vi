---
title: "HTMLModElement: thuộc tính cite"
short-title: cite
slug: Web/API/HTMLModElement/cite
page-type: web-api-instance-property
browser-compat: api.HTMLModElement.cite
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`cite`** của giao diện {{domxref("HTMLModElement")}} cho biết URL của tài nguyên giải thích sự sửa đổi. Nó phản ánh thuộc tính `cite` của các phần tử {{HTMLElement("del")}} và {{HTMLElement("ins")}}.

## Giá trị

Một chuỗi đại diện cho một URL.

## Ví dụ

```js
const mod = document.querySelector("edit");
console.log(`Explanation: ${mod.cite}`); // giá trị hiện tại
mod.cite = "https://example.com/edits"; // cập nhật cite của phần tử
```

## Mô tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLModElement.dateTime")}}
- {{domxref("HTMLQuoteElement.cite")}}
