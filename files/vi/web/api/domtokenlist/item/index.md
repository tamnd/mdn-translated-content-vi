---
title: "DOMTokenList: phương thức item()"
short-title: item()
slug: Web/API/DOMTokenList/item
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.item
---

{{APIRef("DOM")}}

Phương thức **`item()`** của giao diện {{domxref("DOMTokenList")}} trả về một mục trong danh sách,
xác định theo vị trí của nó trong danh sách, tức chỉ số.

> [!NOTE]
> Phương thức này tương đương với [ký hiệu dấu ngoặc vuông](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#bracket_notation).
> Vì vậy `list.item(i)` giống với `list[i]`.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Một số biểu thị chỉ số của mục bạn muốn trả về. Nếu không phải số nguyên, chỉ phần nguyên được xem xét.

### Giá trị trả về

Một chuỗi biểu thị mục được trả về,
hoặc `null` nếu số lớn hơn hoặc bằng `length` của danh sách.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `index` không thể chuyển đổi thành số nguyên.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một
phần tử {{htmlelement("span")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}. Sau đó chúng ta lấy mục cuối cùng trong danh sách bằng
`item(tokenList.length - 1)`, rồi ghi nó vào
{{domxref("Node.textContent")}} của thẻ `<span>`.

Trước hết là HTML:

```html
<span class="a b c"></span>
```

Bây giờ là JavaScript:

```js
const span = document.querySelector("span");
const classes = span.classList;
const item = classes.item(classes.length - 1);
span.textContent = item;
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
