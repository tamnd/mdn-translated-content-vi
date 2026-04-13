---
title: "SVGElement: thuộc tính tabIndex"
short-title: tabIndex
slug: Web/API/SVGElement/tabIndex
page-type: web-api-instance-property
browser-compat: api.SVGElement.tabIndex
---

{{APIRef("SVG")}}

Thuộc tính **`tabIndex`** của giao diện {{DOMxRef("SVGElement")}} đại diện cho thứ tự tab của phần tử SVG hiện tại.

Thứ tự tab như sau:

1. Các phần tử có `tabIndex` dương. Các phần tử có cùng giá trị `tabIndex` sẽ được điều hướng theo thứ tự xuất hiện. Điều hướng đi từ `tabIndex` thấp nhất đến `tabIndex` cao nhất.
2. Các phần tử không hỗ trợ thuộc tính `tabIndex` hoặc hỗ trợ nhưng gán `tabIndex` bằng `0`, theo thứ tự xuất hiện.

Các phần tử bị vô hiệu hóa không tham gia vào thứ tự tab.

Các giá trị không cần phải liên tiếp, cũng không nhất thiết phải bắt đầu từ một giá trị cụ thể. Chúng thậm chí có thể âm, mặc dù mỗi trình duyệt có thể cắt bớt các giá trị quá lớn.

## Giá trị

Một số nguyên.

## Ví dụ

### Đặt thuộc tính `tabIndex`

```html
<svg id="svg1" tabindex="2" xmlns="http://www.w3.org/2000/svg" role="img">
  <circle cx="50" cy="50" r="40" fill="blue"></circle>
</svg>
<svg id="svg2" xmlns="http://www.w3.org/2000/svg" role="img">
  <rect width="100" height="100" fill="green"></rect>
</svg>
```

```js
const svg1 = document.getElementById("svg1");
const svg2 = document.getElementById("svg2");

// Access and modify the tabIndex
console.log(svg1.tabIndex); // 2
svg2.tabIndex = 1; // Add svg2 to the tab order before svg1

// Programmatically focus on an element with negative tabIndex
svg1.tabIndex = -1;
svg1.focus(); // Works, even though it is not in the tabbing order
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.tabIndex")}} phương thức tương tự cho các phần tử HTML.
- [Khả năng tiếp cận của các widget JavaScript có thể điều hướng bằng bàn phím](/en-US/docs/Web/Accessibility/Guides/Keyboard-navigable_JavaScript_widgets)
- Thuộc tính toàn cục HTML [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex).
