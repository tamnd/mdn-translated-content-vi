---
title: "NDEFReader: sự kiện readingerror"
short-title: readingerror
slug: Web/API/NDEFReader/readingerror_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.NDEFReader.readingerror_event
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Sự kiện `readingerror` của giao diện {{DOMxRef("NDEFReader")}} được kích hoạt bất cứ khi nào xảy ra lỗi trong khi đọc thẻ NFC, ví dụ như khi thẻ rời khỏi trường cảm ứng từ của reader.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính event handler.

```js-nolint
addEventListener("readingerror", (event) => { })

onreadingerror = (event) => { }
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
