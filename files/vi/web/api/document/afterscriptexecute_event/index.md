---
title: "Document: sự kiện afterscriptexecute"
short-title: afterscriptexecute
slug: Web/API/Document/afterscriptexecute_event
page-type: web-api-event
status:
  - deprecated
  - non-standard
browser-compat: api.Document.afterscriptexecute_event
---

{{APIRef("DOM")}}{{non-standard_header}}{{deprecated_header}}

Sự kiện `afterscriptexecute` được kích hoạt khi một phần tử {{HTMLElement("script")}} tĩnh hoàn tất thực thi script của nó. Sự kiện này không được kích hoạt nếu phần tử được thêm động, chẳng hạn như với {{domxref("Node.appendChild()", "appendChild()")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("afterscriptexecute", (event) => { })

onafterscriptexecute = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
function finished(e) {
  logMessage(`Finished script with ID: ${e.target.id}`);
}

document.addEventListener("afterscriptexecute", finished);
// or
document.onafterscriptexecute = finished;
```

[Xem ví dụ trực tiếp](https://mdn.dev/archives/media/samples/html/currentScript.html)

## Đặc tả kỹ thuật

Không phải là một phần của bất kỳ đặc tả kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("Document.beforescriptexecute_event", "beforescriptexecute")}} của `Document`
- {{domxref("Document.currentScript")}}
