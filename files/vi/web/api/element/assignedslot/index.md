---
title: "Element: thuộc tính assignedSlot"
short-title: assignedSlot
slug: Web/API/Element/assignedSlot
page-type: web-api-instance-property
browser-compat: api.Element.assignedSlot
---

{{APIRef("Shadow DOM")}}

Thuộc tính chỉ đọc **`assignedSlot`** của giao diện {{domxref("Element")}} trả về một {{domxref("HTMLSlotElement")}} đại diện cho phần tử {{htmlelement("slot")}} mà nút được chèn vào.

## Giá trị

Một instance {{domxref('HTMLSlotElement')}}, hoặc `null` nếu phần tử không được gán vào một slot, hoặc nếu shadow root liên quan được gắn với {{domxref("ShadowRoot.mode", "mode")}} đặt là `closed` (xem {{domxref("Element.attachShadow")}} để biết thêm chi tiết).

## Ví dụ

Trong [ví dụ simple-template](https://github.com/mdn/web-components-examples/tree/main/simple-template) của chúng tôi ([xem trực tiếp](https://mdn.github.io/web-components-examples/simple-template/)), chúng tôi tạo một phần tử tùy chỉnh đơn giản gọi là `<my-paragraph>` trong đó một shadow root được gắn vào và sau đó được điền nội dung bằng cách sử dụng nội dung của một template có chứa một slot tên là `my-text`.

Khi `<my-paragraph>` được sử dụng trong tài liệu, slot được điền bởi một phần tử có thể slot bằng cách bao gồm nó bên trong phần tử với thuộc tính [`slot`](/en-US/docs/Web/HTML/Reference/Global_attributes/slot) có giá trị `my-text`. Đây là một ví dụ:

```html
<my-paragraph>
  <span slot="my-text">Let's have some different text!</span>
</my-paragraph>
```

Trong tệp JavaScript, chúng ta lấy tham chiếu đến {{htmlelement("span")}} như hiển thị ở trên, sau đó ghi nhật ký tham chiếu đến phần tử `<slot>` ban đầu mà `<span>` được chèn vào.

```js
let slottedSpan = document.querySelector("my-paragraph span");
console.log(slottedSpan.assignedSlot); // logs '<slot name="my-text">'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
