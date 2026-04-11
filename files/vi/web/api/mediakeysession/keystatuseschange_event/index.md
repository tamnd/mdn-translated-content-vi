---
title: "MediaKeySession: sự kiện keystatuseschange"
short-title: keystatuseschange
slug: Web/API/MediaKeySession/keystatuseschange_event
page-type: web-api-event
browser-compat: api.MediaKeySession.keystatuseschange_event
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Sự kiện **`keystatuseschange`** của API {{domxref("MediaKeySession")}} kích hoạt khi có thay đổi trong các khóa hoặc trạng thái của chúng trong một phiên.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("keystatuseschange", (event) => { })

onkeystatuseschange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("ExtendableEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ExtendableEvent")}}

## Thuộc tính sự kiện

_Không triển khai bất kỳ thuộc tính cụ thể nào, nhưng kế thừa các thuộc tính từ phần tử cha của nó, {{domxref("Event")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
