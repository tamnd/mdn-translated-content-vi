---
title: "HTMLInputElement: thuộc tính height"
short-title: height
slug: Web/API/HTMLInputElement/height
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.height
---

{{APIRef("HTML DOM")}}

Thuộc tính **`height`** của giao diện {{DOMxRef("HTMLInputElement")}} xác định chiều cao của một điều khiển. Nó phản ánh thuộc tính [`height`](/en-US/docs/Web/HTML/Reference/Elements/input#height) của phần tử {{htmlelement("input")}}.

Thuộc tính `height` chỉ hợp lệ cho loại [`image`](/en-US/docs/Web/HTML/Reference/Elements/input/image). Nó xác định kích thước dọc của nút hình ảnh, tính bằng pixel. Nếu các thuộc tính định kích thước CSS áp dụng cho điều khiển, giá trị là chiều cao của hộp nội dung của điều khiển được kết xuất, không phải giá trị của thuộc tính `height`. Nếu không đặt `height` và CSS không ảnh hưởng đến kích thước của điều khiển, `height` sẽ là chiều cao nội tại của hình ảnh. Nếu hình ảnh không tải được, giá trị sẽ là chiều cao của văn bản `alt`. `height` sẽ là `0` nếu không biết chiều cao; nếu không đặt `height`, CSS không ảnh hưởng đến chiều cao, hình ảnh không tải được, và giá trị của {{DOMxRef("HTMLInputElement.alt", "alt")} là chuỗi rỗng hoặc không đặt `src`.

## Giá trị

Một số.

## Ví dụ

```js
const inputElement = document.getElementById("imageButton");
console.log(inputElement.height);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLInputElement.width")}}
- {{DOMxRef("HTMLInputElement.src")}}
- {{DOMxRef("HTMLInputElement.alt")}}
- {{DOMXref("HTMLButtonElement")}}
- {{HTMLElement("button")}}
- {{HTMLElement("input")}}
- {{HTMLElement("img")}}
- Thuộc tính CSS {{CSSXRef("inline-size")}}
- Thuộc tính CSS {{CSSXRef("height")}}
- Thuộc tính CSS {{CSSXRef("aspect-ratio")}}
- Mô-đun [định kích thước hộp CSS](/en-US/docs/Web/CSS/Guides/Box_sizing)
