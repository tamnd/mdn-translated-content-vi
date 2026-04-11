---
title: "HTMLMediaElement: sự kiện encrypted"
short-title: encrypted
slug: Web/API/HTMLMediaElement/encrypted_event
page-type: web-api-event
browser-compat: api.HTMLMediaElement.encrypted_event
---

{{APIRef("Encrypted Media Extensions")}}

Sự kiện `encrypted` được kích hoạt khi tìm thấy dữ liệu khởi tạo trên phương tiện cho biết nó đã được mã hóa.

Sự kiện này không thể hủy và không bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("encrypted", (event) => { })

onencrypted = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MediaEncryptedEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MediaEncryptedEvent")}}

## Thuộc tính sự kiện

- {{domxref("MediaEncryptedEvent.initDataType")}} {{ReadOnlyInline}}
- : Trả về một chuỗi phân biệt chữ hoa chữ thường với _type_ của định dạng dữ liệu khởi tạo được tìm thấy.
- {{domxref("MediaEncryptedEvent.initData")}} {{ReadOnlyInline}}
- : Trả về {{jsxref("ArrayBuffer")}} chứa dữ liệu khởi tạo được tìm thấy. Nếu không có dữ liệu khởi tạo liên quan đến định dạng, nó sẽ trả về `null`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLAudioElement")}}
- {{domxref("HTMLVideoElement")}}
- {{HTMLElement("audio")}}
- {{HTMLElement("video")}}
- {{domxref("MediaEncryptedEvent")}}
