---
title: "HTMLTitleElement: thuộc tính text"
short-title: text
slug: Web/API/HTMLTitleElement/text
page-type: web-api-instance-property
browser-compat: api.HTMLTitleElement.text
---

{{APIRef("HTML DOM")}}

Thuộc tính **`text`** của giao diện {{domxref("HTMLTitleElement")}} đại diện cho nội dung văn bản con của tiêu đề tài liệu dưới dạng chuỗi. Nó chứa nội dung của phần tử {{HTMLelement("title")}} dưới dạng văn bản; nếu thẻ HTML được bao gồm trong phần tử `<title>`, chúng được bao gồm như một phần của giá trị chuỗi thay vì được phân tích cú pháp thành HTML.

Đặt giá trị cho thuộc tính `text` sẽ thay thế toàn bộ nội dung văn bản của `<title>`.

## Giá trị

Một chuỗi.

## Ví dụ

Xét ví dụ dưới đây:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>
      Hello world! <span class="highlight">Isn't this wonderful</span> really?
    </title>
  </head>
  <body></body>
</html>
```

```js
const title = document.querySelector("title");
console.log(title.text); // "Hello world! <span class="highlight">Isn't this wonderful</span> really?"
title.text = "Update the title";
```

Như bạn thấy, thẻ `span` vẫn chưa được phân tích cú pháp; nội dung của phần tử `<title>` được xử lý như văn bản thuần túy và được trả về chính xác như chúng xuất hiện trong phần tử `title`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
