---
title: "Document: thuộc tính currentScript"
short-title: currentScript
slug: Web/API/Document/currentScript
page-type: web-api-instance-property
browser-compat: api.Document.currentScript
---

{{APIRef("DOM")}}

Thuộc tính **`Document.currentScript`** trả về phần tử {{HTMLElement("script")}} có script đang được xử lý và [không phải là một JavaScript module](https://github.com/whatwg/html/issues/997). (Đối với modules, sử dụng [`import.meta`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta) thay thế.)

Cần lưu ý rằng thuộc tính này sẽ không tham chiếu đến phần tử {{HTMLElement("script")}} nếu mã trong script đang được gọi như một callback hoặc trình xử lý sự kiện; nó chỉ tham chiếu đến phần tử trong khi đang được xử lý ban đầu.

## Giá trị

Một {{domxref("HTMLScriptElement")}} hoặc null.

## Ví dụ

Ví dụ này kiểm tra xem script có đang được thực thi bất đồng bộ hay không:

```js
if (document.currentScript.async) {
  console.log("Executing asynchronously");
} else {
  console.log("Executing synchronously");
}
```

[Xem các ví dụ trực tiếp](https://mdn.dev/archives/media/samples/html/currentScript.html)

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`import.meta`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta)
- {{HTMLElement("script")}}
- Sự kiện {{DOMxRef("document.afterscriptexecute_event", "afterscriptexecute")}} của `Document`
- Sự kiện {{DOMxRef("document.beforescriptexecute_event", "beforescriptexecute")}} của `Document`
