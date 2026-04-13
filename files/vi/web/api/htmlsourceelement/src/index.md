---
title: "HTMLSourceElement: thuộc tính src"
short-title: src
slug: Web/API/HTMLSourceElement/src
page-type: web-api-instance-property
browser-compat: api.HTMLSourceElement.src
---

{{APIRef("HTML DOM")}}

Thuộc tính **`src`** của giao diện {{domxref("HTMLSourceElement")}} là một chuỗi cho biết URL của tài nguyên phương tiện dùng làm nguồn cho phần tử.

Nó phản ánh thuộc tính `src` của phần tử {{HTMLElement("source")}} được lồng trong phần tử {{htmlelement("audio")}} hoặc {{htmlelement("video")}}. Nó không có ý nghĩa và bị bỏ qua khi nó được lồng trong phần tử {{htmlelement("picture")}}.

## Giá trị

Một chuỗi; URL của tài nguyên nguồn dùng trong phần tử.

## Ví dụ

```html
<video>
  <source
    id="el"
    src="large.webp"
    type="video/webp"
    media="screen and (600px <= width <= 800px)" />
</video>
```

```js
const el = document.getElementById("el");
console.log(el.src); // Output: "large.webp"
el.src = "medium.webp"; // Updates the src value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLSourceElement.type")}}
- {{domxref("HTMLSourceElement.srcset")}}
- {{domxref("HTMLSourceElement.media")}}
- {{domxref("HTMLSourceElement.sizes")}}
- {{htmlelement("source")}}
- {{htmlelement("audio")}}
- {{htmlelement("video")}}
