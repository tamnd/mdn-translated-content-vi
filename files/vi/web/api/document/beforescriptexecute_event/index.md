---
title: "Document: sự kiện beforescriptexecute"
short-title: beforescriptexecute
slug: Web/API/Document/beforescriptexecute_event
page-type: web-api-event
status:
  - deprecated
  - non-standard
browser-compat: api.Document.beforescriptexecute_event
---

{{APIRef("DOM")}}{{non-standard_header}}{{deprecated_header}}

Sự kiện `beforescriptexecute` được kích hoạt khi một {{HTMLElement("script")}} tĩnh sắp bắt đầu thực thi. Sự kiện này không được kích hoạt nếu phần tử được thêm động, chẳng hạn như với {{domxref("Node.appendChild()", "appendChild()")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("beforescriptexecute", (event) => { })

onbeforescriptexecute = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
function starting(e) {
  logMessage(`Starting script with ID: ${e.target.id}`);
}

document.addEventListener("beforescriptexecute", starting);
// or
document.onbeforescriptexecute = starting;
```

[Xem ví dụ trực tiếp](https://mdn.dev/archives/media/samples/html/currentScript.html)

## Đặc tả kỹ thuật

Không phải là một phần của bất kỳ đặc tả kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("Document.afterscriptexecute_event", "afterscriptexecute")}} của `Document`
- {{domxref("Document.currentScript")}}
