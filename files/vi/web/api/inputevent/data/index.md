---
title: "InputEvent: thuộc tính data"
short-title: data
slug: Web/API/InputEvent/data
page-type: web-api-instance-property
browser-compat: api.InputEvent.data
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`data`** của giao diện {{domxref("InputEvent")}} trả về một chuỗi với các ký tự đã chèn. Đây có thể là một chuỗi rỗng nếu thay đổi không chèn văn bản, chẳng hạn khi các ký tự bị xóa.

## Giá trị

Một chuỗi hoặc `null`. Đặc điểm kỹ thuật có một [tổng quan](https://w3c.github.io/input-events/#overview) về giá trị của nó trong các trường hợp khác nhau.

## Ví dụ

Trong ví dụ sau, một trình lắng nghe sự kiện nhận sự kiện [input](/en-US/docs/Web/API/Element/input_event). Mọi thay đổi văn bản đối với phần tử {{htmlelement("input")}} được truy xuất bởi `InputEvent.data` và được chèn vào một đoạn văn bản bằng thuộc tính [`Node.textContent`](/en-US/docs/Web/API/Node/textContent).

```html
<p>Some text to copy and paste.</p>

<input type="text" />

<p class="result"></p>
```

```js
const editable = document.querySelector("input");
const result = document.querySelector(".result");

editable.addEventListener("input", (e) => {
  result.textContent = `Inputted text: ${e.data}`;
});
```

{{EmbedLiveSample('Examples')}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
