---
title: "HTMLElement: thuộc tính tabIndex"
short-title: tabIndex
slug: Web/API/HTMLElement/tabIndex
page-type: web-api-instance-property
browser-compat: api.HTMLElement.tabIndex
---

{{APIRef("HTML DOM")}}

Thuộc tính **`tabIndex`** của giao diện {{DOMxRef("HTMLElement")}} biểu thị thứ tự tab của phần tử hiện tại.

Thứ tự tab như sau:

1. Các phần tử có `tabIndex` dương. Các phần tử có giá trị `tabIndex` giống nhau phải được điều hướng theo thứ tự xuất hiện của chúng. Điều hướng tiến hành từ `tabIndex` thấp nhất đến `tabIndex` cao nhất.
2. Các phần tử không hỗ trợ thuộc tính `tabIndex` hoặc hỗ trợ và gán `tabIndex` thành `0`, theo thứ tự xuất hiện của chúng.

Các phần tử bị vô hiệu hóa không tham gia vào thứ tự tab.

Các giá trị không cần phải tuần tự, cũng không cần phải bắt đầu bằng bất kỳ giá trị cụ thể nào. Chúng thậm chí có thể là âm, mặc dù mỗi trình duyệt cắt bỏ các giá trị rất lớn.

## Giá trị

Một số nguyên.

## Ví dụ

```js
const b1 = document.getElementById("button1");

b1.tabIndex = 1;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Khả năng tiếp cận của các widget JavaScript có thể điều hướng bằng bàn phím](/en-US/docs/Web/Accessibility/Guides/Keyboard-navigable_JavaScript_widgets)
- Thuộc tính HTML toàn cục [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex).
