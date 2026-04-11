---
title: "HTMLElement: thuộc tính enterKeyHint"
short-title: enterKeyHint
slug: Web/API/HTMLElement/enterKeyHint
page-type: web-api-instance-property
browser-compat: api.HTMLElement.enterKeyHint
---

{{APIRef("HTML DOM")}}

Thuộc tính **`enterKeyHint`** là một thuộc tính liệt kê xác định nhãn hành động (hoặc biểu tượng) hiển thị cho phím Enter trên bàn phím ảo.
Nó phản ánh thuộc tính HTML toàn cục [`enterkeyhint`](/en-US/docs/Web/HTML/Reference/Global_attributes/enterkeyhint) và chỉ chấp nhận các giá trị chuỗi sau:

- `'enter'` thường biểu thị việc chèn một dòng mới.
- `'done'` thường có nghĩa là không còn gì để nhập và trình chỉnh sửa phương thức nhập (IME) sẽ được đóng.
- `'go'` thường có nghĩa là đưa người dùng đến đích của văn bản họ đã nhập.
- `'next'` thường đưa người dùng đến trường tiếp theo sẽ nhận văn bản.
- `'previous'` thường đưa người dùng đến trường trước đó sẽ nhận văn bản.
- `'search'` thường đưa người dùng đến kết quả tìm kiếm văn bản họ đã nhập.
- `'send'` thường gửi văn bản đến đích của nó.

Nếu không có giá trị `enterKeyHint` nào được chỉ định hoặc nếu được đặt thành một giá trị khác ngoài các giá trị được phép, nó sẽ trả về một chuỗi rỗng.

## Ví dụ

Đặt gợi ý cho bàn phím ảo về cách đặt nhãn phím Enter (có thể hiển thị dưới dạng <kbd>Send</kbd> và <kbd>Search</kbd>, tùy thuộc vào hệ điều hành hoặc ngôn ngữ của người dùng).

```js
const send = document.getElementById("sendInput");
const search = document.getElementById("searchInput");

send.enterKeyHint = "send";
search.enterKeyHint = "search";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`enterkeyhint`](/en-US/docs/Web/HTML/Reference/Global_attributes/enterkeyhint)
