---
title: "Node: thuộc tính previousSibling"
short-title: previousSibling
slug: Web/API/Node/previousSibling
page-type: web-api-instance-property
browser-compat: api.Node.previousSibling
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`previousSibling`** của giao diện {{domxref("Node")}} trả về nút đứng ngay trước nút đã chỉ định trong danh sách {{domxref("Node.childNodes", "childNodes")}} của nút cha, hoặc `null` nếu nút đã chỉ định là nút đầu tiên trong danh sách đó.

> [!NOTE]
> Trình duyệt chèn các nút văn bản vào tài liệu để biểu diễn khoảng trắng trong mã nguồn. Vì vậy, một nút lấy được, chẳng hạn bằng [`Node.firstChild`](/en-US/docs/Web/API/Node/firstChild) hoặc `Node.previousSibling`, có thể là một nút văn bản khoảng trắng thay vì phần tử thực sự mà tác giả muốn lấy.
>
> Xem [Làm việc với khoảng trắng trong DOM](/en-US/docs/Web/CSS/Guides/Text/Whitespace#working_with_whitespace_in_the_dom) để biết thêm chi tiết.
>
> Bạn có thể dùng [`previousElementSibling`](/en-US/docs/Web/API/Element/previousElementSibling) để lấy nút phần tử trước đó (bỏ qua các nút văn bản và mọi nút không phải phần tử khác).
>
> Để đi theo chiều ngược lại qua danh sách nút con, hãy dùng [Node.nextSibling](/en-US/docs/Web/API/Node/nextSibling).

## Giá trị

Một {{domxref("Node")}} đại diện cho nút anh em trước đó của nút hiện tại, hoặc `null` nếu không có.

## Ví dụ

Các ví dụ sau minh họa cách `previousSibling` hoạt động khi có và khi không có các nút văn bản trộn lẫn với phần tử.

### Ví dụ thứ nhất

Trong ví dụ này, chúng ta có một loạt phần tử {{HTMLElement("span")}} nằm sát nhau, không có khoảng trắng ở giữa.

```html
<span id="b0"></span><span id="b1"></span><span id="b2"></span>
```

```js
document.getElementById("b1").previousSibling; // <span id="b0">
document.getElementById("b2").previousSibling.id; // "b1"
```

### Ví dụ thứ hai

Trong ví dụ này, có các nút văn bản khoảng trắng (ngắt dòng) giữa các phần tử {{htmlelement("span")}}.

```html
<span id="b0"></span>
<span id="b1"></span>
<span id="b2"></span>
```

```js
document.getElementById("b1").previousSibling; // #text
document.getElementById("b1").previousSibling.previousSibling; // <span id="b0">
document.getElementById("b2").previousSibling.previousSibling; // <span id="b1">
document.getElementById("b2").previousSibling; // #text
document.getElementById("b2").previousSibling.id; // undefined
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.nextSibling")}}
- {{domxref("Element.previousElementSibling")}}
