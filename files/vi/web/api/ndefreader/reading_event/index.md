---
title: "NDEFReader: sự kiện reading"
short-title: reading
slug: Web/API/NDEFReader/reading_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.NDEFReader.reading_event
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Sự kiện `reading` của giao diện {{DOMxRef("NDEFReader")}} được kích hoạt bất cứ khi nào có lần đọc mới từ các thiết bị NFC tương thích (ví dụ như thẻ NFC hỗ trợ NDEF) khi các thiết bị này nằm trong trường cảm ứng từ của reader.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính event handler.

```js-nolint
addEventListener("reading", (event) => { })

onreading = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Ví dụ dưới đây cho thấy cách xử lý sự kiện bằng cả hai event handler `onreading` và `onreadingerror`.

```js
const ndef = new NDEFReader();
ndef
  .scan()
  .then(() => {
    console.log("Scan started successfully.");
    ndef.onreadingerror = (event) => {
      console.log(
        "Error! Cannot read data from the NFC tag. Try a different one?",
      );
    };
    ndef.onreading = (event) => {
      console.log("NDEF message read.");
    };
  })
  .catch((error) => {
    console.log(`Error! Scan failed to start: ${error}.`);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{DOMxRef("NDEFReader.readingerror_event", "readingerror")}}
