---
title: "HTMLOptionElement: thuộc tính text"
short-title: text
slug: Web/API/HTMLOptionElement/text
page-type: web-api-instance-property
browser-compat: api.HTMLOptionElement.text
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`text`** của {{domxref("HTMLOptionElement")}} đại diện cho văn bản bên trong phần tử {{htmlelement("option")}}.
Thuộc tính này đại diện cho cùng thông tin như {{domxref("Node.textContent")}}.

> [!NOTE]
> Nếu phần tử có `label`, văn bản bên trong {{htmlelement("option")}} sẽ không được hiển thị trực quan. Trong trường hợp đó, thuộc tính `text` vẫn có thể được dùng để đặt nội dung, nhưng sẽ không có hiệu ứng hiển thị.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const optionElement = document.getElementById("exampleOption");
console.log(`Thuộc tính text: ${optionElement.text}`);
optionElement.text = "Văn bản đã cập nhật";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("select")}}
- {{HTMLElement("datalist")}}
- {{HTMLElement("optgroup")}}
- {{domxref("HTMLOptionElement.value")}}
- {{domxref("HTMLOptionElement.label")}}
- {{domxref("HTMLScriptElement.text")}}
- {{domxref("HTMLAnchorElement.text")}}
