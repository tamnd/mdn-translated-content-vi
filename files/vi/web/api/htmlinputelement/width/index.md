---
title: "HTMLInputElement: thuộc tính width"
short-title: width
slug: Web/API/HTMLInputElement/width
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.width
---

{{APIRef("HTML DOM")}}

Thuộc tính **`width`** của giao diện {{DOMxRef("HTMLInputElement")}} xác định chiều rộng của một điều khiển. Nó phản ánh thuộc tính [`width`](/en-US/docs/Web/HTML/Reference/Elements/input#width) của phần tử {{htmlelement("input")}}.

Thuộc tính `width` chỉ hợp lệ cho loại [`image`](/en-US/docs/Web/HTML/Reference/Elements/input/image). Nó xác định kích thước ngang ưu tiên của nút hình ảnh, tính bằng pixel. Giá trị thuộc tính là chiều rộng của [content-box](/en-US/docs/Web/CSS/Reference/Values/box-edge#content-box) của nút được kết xuất. Các thuộc tính mô hình hộp CSS ảnh hưởng đến kích thước của điều khiển được ưu tiên.

Nếu không đặt `width` và không có thuộc tính chiều rộng CSS nào ảnh hưởng đến điều khiển, `width` sẽ là chiều rộng nội tại của hình ảnh. Nếu hình ảnh không tải được, giá trị sẽ là chiều rộng nội tại tối đa của văn bản `alt`. `width` sẽ là `0` nếu không biết chiều rộng; nếu không đặt `width`, không có kích thước CSS áp dụng, không có hình ảnh nào tải được, và giá trị của {{DOMxRef("HTMLInputElement.alt", "alt")} là chuỗi rỗng hoặc không đặt `src`.

## Giá trị

Một số.

## Ví dụ

```js
const inputElement = document.getElementById("imageButton");
console.log(inputElement.width);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLInputElement.height")}}
- {{DOMxRef("HTMLInputElement.src")}}
- {{DOMxRef("HTMLInputElement.alt")}}
- {{DOMXref("HTMLButtonElement")}}
- {{HTMLElement("button")}}
- {{HTMLElement("input")}}
- {{HTMLElement("img")}}
- Thuộc tính CSS {{CSSXRef("inline-size")}}
- Thuộc tính CSS {{CSSXRef("width")}}
- Thuộc tính CSS {{CSSXRef("aspect-ratio")}}
- Mô-đun [định kích thước hộp CSS](/en-US/docs/Web/CSS/Guides/Box_sizing)
