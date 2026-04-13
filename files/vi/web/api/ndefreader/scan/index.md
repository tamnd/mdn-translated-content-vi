---
title: "NDEFReader: phương thức scan()"
short-title: scan()
slug: Web/API/NDEFReader/scan
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.NDEFReader.scan
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Phương thức `scan()` của giao diện {{DOMxRef("NDEFReader")}} kích hoạt thiết bị đọc và trả về một {{jsxref("Promise")}} giải quyết khi thao tác đọc thẻ NFC được lên lịch hoặc bị từ chối nếu gặp lỗi phần cứng hoặc quyền. Phương thức này kích hoạt yêu cầu cấp quyền nếu quyền "nfc" chưa được cấp trước đó.

## Cú pháp

```js-nolint
scan(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng với các thuộc tính sau:
    - `signal`
      - : Một {{DOMxRef("AbortSignal")}} cho phép hủy thao tác `scan()` này.

### Giá trị trả về

Một {{JSxRef("Promise")}} được giải quyết ngay lập tức sau khi lên lịch các thao tác đọc cho bộ điều hợp NFC.

### Ngoại lệ

Phương thức này không ném ngoại lệ; thay vào đó, nó từ chối promise được trả về, truyền {{domxref("DOMException")}} có `name` là một trong những giá trị sau:

- `AbortError` {{domxref("DOMException")}}
  - : Được trả về nếu thao tác scan bị hủy với {{DOMxRef("AbortSignal")}} được truyền trong đối số `options`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu đã có một lần quét đang diễn ra.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được trả về nếu quyền cho thao tác này bị từ chối.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được trả về nếu không có bộ điều hợp NFC tương thích với Web NFC hoặc không thể thiết lập kết nối.

## Ví dụ

### Xử lý lỗi quét

Ví dụ này cho thấy điều gì xảy ra khi promise scan bị từ chối và `readingerror` được ném ra.

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
