---
title: "MathMLElement: thuộc tính tabIndex"
short-title: tabIndex
slug: Web/API/MathMLElement/tabIndex
page-type: web-api-instance-property
browser-compat: api.MathMLElement.tabIndex
---

{{APIRef("MathML")}}

Thuộc tính **`tabIndex`** của giao diện {{DOMxRef("MathMLElement")}} đại diện cho thứ tự tab của phần tử MathML hiện tại.

Thứ tự tab như sau:

1. Các phần tử có `tabIndex` dương. Các phần tử có giá trị `tabIndex` giống nhau sẽ được điều hướng theo thứ tự chúng xuất hiện. Điều hướng tiến hành từ `tabIndex` thấp nhất đến `tabIndex` cao nhất.
2. Các phần tử không hỗ trợ thuộc tính `tabIndex` hoặc hỗ trợ và gán `tabIndex` về `0`, theo thứ tự chúng xuất hiện.

Các phần tử bị vô hiệu hóa không tham gia vào thứ tự tab. Các giá trị không cần phải tuần tự, cũng không cần phải bắt đầu với bất kỳ giá trị cụ thể nào. Chúng thậm chí có thể âm, mặc dù mỗi trình duyệt cắt bớt các giá trị rất lớn.

## Giá trị

Một số nguyên.

## Ví dụ

### Sử dụng thuộc tính tabIndex

```html
<math id="math1" tabindex="2">
  <msup>
    <mi>a</mi>
    <mn>2</mn>
  </msup>
</math>

<math id="math2">
  <mfrac>
    <mn>1</mn>
    <mn>2</mn>
  </mfrac>
</math>
```

```js
const math1 = document.getElementById("math1");
const math2 = document.getElementById("math2");

// Access and modify the tabIndex
console.log(math1.tabIndex); // 2
math2.tabIndex = 1; // Add math2 to the tab order before math1

// Programmatically focus on an element with negative tabIndex
math1.tabIndex = -1;
math1.focus(); // Works, even though it is not in the tabbing order
```

### Kết quả

{{EmbedLiveSample("tabindex",100,100)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.tabIndex")}}
- [Khả năng tiếp cận của các widget JavaScript có thể điều hướng bằng bàn phím](/en-US/docs/Web/Accessibility/Guides/Keyboard-navigable_JavaScript_widgets)
- [`tabindex`](/en-US/docs/Web/MathML/Reference/Global_attributes/tabindex)
