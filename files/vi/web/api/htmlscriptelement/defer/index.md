---
title: "HTMLScriptElement: thuộc tính defer"
short-title: defer
slug: Web/API/HTMLScriptElement/defer
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.defer
---

{{APIRef("HTML DOM")}}

Thuộc tính **`defer`** của giao diện {{domxref("HTMLScriptElement")}} là một giá trị boolean điều khiển cách thực thi tập lệnh. Với classic scripts, nếu thuộc tính `defer` được đặt thành `true`, tập lệnh ngoài sẽ được thực thi sau khi tài liệu đã được phân tích xong, nhưng trước khi sự kiện {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}} được phát ra. Với [module scripts](/en-US/docs/Web/JavaScript/Guide/Modules), thuộc tính `defer` không có tác dụng.

Thuộc tính này phản ánh thuộc tính `defer` của phần tử {{HTMLElement("script")}}.

## Giá trị

Một giá trị boolean.

## Ví dụ

```html
<script id="el" src="/example.js" defer></script>
```

```js
const el = document.getElementById("el");
console.log(el.defer); // Kết quả: true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLScriptElement.async")}}
