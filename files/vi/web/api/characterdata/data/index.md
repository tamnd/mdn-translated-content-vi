---
title: "CharacterData: thuộc tính data"
short-title: data
slug: Web/API/CharacterData/data
page-type: web-api-instance-property
browser-compat: api.CharacterData.data
---

{{APIRef("DOM")}}

Thuộc tính **`data`** của giao diện {{domxref("CharacterData")}} biểu diễn giá trị dữ liệu của đối tượng hiện tại.

## Giá trị

Một chuỗi chứa thông tin ký tự có trong nút {{domxref("CharacterData")}}.

Khi được gán giá trị `null`, giá trị `null` đó sẽ được chuyển thành chuỗi rỗng (`""`), vì vậy `cd.data = null` tương đương với `cd.data = ""`.

## Ví dụ

> [!NOTE]
> {{domxref("CharacterData")}} là một giao diện trừu tượng.
> Các ví dụ dưới đây sử dụng hai giao diện cụ thể hiện thực nó là {{domxref("Text")}} và {{domxref("Comment")}}.

### Đọc một chú thích bằng `data`

```html
<!-- This is an HTML comment -->
<output id="result"></output>
```

```js
const comment = document.body.childNodes[1];
const output = document.getElementById("result");

output.value = comment.data;
```

{{EmbedLiveSample("Reading_a_comment_using_data", "100%", 50)}}

### Đặt nội dung của nút văn bản bằng `data`

```html
<span>Result: </span>Not set.
```

```js
const span = document.querySelector("span");
const textNode = span.nextSibling;

textNode.data = "This text has been set using 'textNode.data'.";
```

{{EmbedLiveSample("Setting_the_content_of_a_text_node_using_data", "100%", 50)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.length")}} trả về độ dài của dữ liệu có trong nút {{domxref("CharacterData")}}.
