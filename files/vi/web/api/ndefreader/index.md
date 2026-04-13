---
title: NDEFReader
slug: Web/API/NDEFReader
page-type: web-api-interface
status:
  - experimental
browser-compat: api.NDEFReader
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Giao diện **`NDEFReader`** của [Web NFC API](/en-US/docs/Web/API/Web_NFC_API) được dùng để đọc từ và ghi dữ liệu vào các thiết bị NFC tương thích, ví dụ như thẻ NFC hỗ trợ NDEF, khi các thiết bị này nằm trong trường cảm ứng từ của reader.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{DOMxRef("NDEFReader.NDEFReader", "NDEFReader()")}} {{Experimental_Inline}}
  - : Trả về một đối tượng `NDEFReader` mới.

## Phương thức phiên bản

_Giao diện `NDEFReader` kế thừa các phương thức của {{domxref("EventTarget")}}, giao diện cha của nó._

- {{DOMxRef("NDEFReader.scan", "NDEFReader.scan()")}} {{Experimental_Inline}}
  - : Kích hoạt thiết bị đọc và trả về một {{jsxref("Promise")}} giải quyết khi thao tác đọc thẻ NFC được lên lịch hoặc bị từ chối nếu gặp lỗi phần cứng hoặc quyền. Phương thức này kích hoạt yêu cầu cấp quyền nếu quyền "nfc" chưa được cấp trước đó.
- {{DOMxRef("NDEFReader.write", "NDEFReader.write()")}} {{Experimental_Inline}}
  - : Cố gắng ghi thông điệp NDEF vào thẻ và trả về một {{jsxref("Promise")}} giải quyết khi thông điệp đã được ghi vào thẻ hoặc bị từ chối nếu gặp lỗi phần cứng hoặc quyền. Phương thức này kích hoạt yêu cầu cấp quyền nếu quyền "nfc" chưa được cấp trước đó.

## Sự kiện

_Kế thừa sự kiện từ đối tượng cha, {{DOMxRef("EventTarget")}}._

- {{DOMxRef("NDEFReader.reading_event", "reading")}} {{Experimental_Inline}}
  - : Được kích hoạt khi có lần đọc mới từ các thiết bị NFC tương thích.
- {{DOMxRef("NDEFReader.readingerror_event", "readingerror")}} {{Experimental_Inline}}
  - : Được kích hoạt khi thẻ ở gần thiết bị đọc nhưng không thể đọc được.

## Ví dụ

### Xử lý lần đọc ban đầu trong khi ghi

Ví dụ dưới đây cho thấy cách điều phối giữa handler đọc chung và một handler được dùng cụ thể để ghi một lần. Để ghi, cần tìm và đọc thẻ. Điều này cho phép bạn kiểm tra xem thẻ có thực sự là thẻ bạn muốn ghi vào không. Đó là lý do tại sao nên gọi `write()` từ sự kiện đọc.

```js
const ndef = new NDEFReader();
let ignoreRead = false;

ndef.onreading = (event) => {
  if (ignoreRead) {
    return; // write pending, ignore read.
  }

  console.log("We read a tag, but not during pending write!");
};

function write(data) {
  ignoreRead = true;
  return new Promise((resolve, reject) => {
    ndef.addEventListener(
      "reading",
      (event) => {
        // Check if we want to write to this tag, or reject.
        ndef
          .write(data)
          .then(resolve, reject)
          .finally(() => (ignoreRead = false));
      },
      { once: true },
    );
  });
}

await ndef.scan();
try {
  await write("Hello World");
  console.log("We wrote to a tag!");
} catch (err) {
  console.error("Something went wrong", err);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
