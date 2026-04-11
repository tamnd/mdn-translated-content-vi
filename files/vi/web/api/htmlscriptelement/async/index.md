---
title: "HTMLScriptElement: thuộc tính async"
short-title: async
slug: Web/API/HTMLScriptElement/async
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.async
---

{{APIRef("HTML DOM")}}

Thuộc tính **`async`** của giao diện {{domxref("HTMLScriptElement")}} là một giá trị boolean điều khiển cách thực thi tập lệnh. Với classic scripts, nếu thuộc tính `async` được đặt thành `true`, tập lệnh ngoài sẽ được tìm nạp song song với quá trình phân tích cú pháp và được đánh giá ngay khi sẵn sàng. Với [module scripts](/en-US/docs/Web/JavaScript/Guide/Modules), nếu thuộc tính `async` được đặt thành `true`, tập lệnh và tất cả các phụ thuộc của nó sẽ được tìm nạp song song với quá trình phân tích cú pháp và được đánh giá ngay khi sẵn sàng.

Thuộc tính này phản ánh thuộc tính `async` của phần tử {{HTMLElement("script")}}.

## Giá trị

Một giá trị boolean.

## Ví dụ

```html
<script id="el" src="/example.js" async></script>
```

```js
const el = document.getElementById("el");
console.log(el.async); // Kết quả: true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLScriptElement.defer")}}
