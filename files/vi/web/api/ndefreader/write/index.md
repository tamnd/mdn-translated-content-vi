---
title: "NDEFReader: phương thức write()"
short-title: write()
slug: Web/API/NDEFReader/write
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.NDEFReader.write
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Phương thức `write()` của giao diện {{DOMxRef("NDEFReader")}} cố gắng ghi thông điệp NDEF vào thẻ và trả về một {{jsxref("Promise")}} giải quyết khi thông điệp đã được ghi vào thẻ hoặc bị từ chối nếu gặp lỗi phần cứng hoặc quyền. Phương thức này kích hoạt yêu cầu cấp quyền nếu quyền "nfc" chưa được cấp trước đó.

## Cú pháp

```js-nolint
write(message)
write(message, options)
```

### Tham số

- `message`
  - : Thông điệp cần ghi, có thể là chuỗi, {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, hoặc mảng các bản ghi. Một bản ghi có các thành phần sau:
    - `data` {{optional_inline}}
      - : Chứa dữ liệu cần truyền, có thể là chuỗi, {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, hoặc mảng các bản ghi lồng nhau
    - `encoding` {{optional_inline}}
      - : Một chuỗi chỉ định mã hóa của bản ghi.
    - `id` {{optional_inline}}
      - : Một định danh do nhà phát triển xác định cho bản ghi.
    - `lang` {{optional_inline}}
      - : Một {{glossary("BCP 47 language tag")}} hợp lệ.
    - `mediaType` {{optional_inline}}
      - : Một [MIME type](/en-US/docs/Web/HTTP/Guides/MIME_types) hợp lệ.
    - `recordType`
      - : Một chuỗi chỉ định loại dữ liệu được lưu trong `data`. Phải là một trong các giá trị sau:
        - `"absolute-url"`
          - : Một URL tuyệt đối đến dữ liệu.
        - `"empty"`
          - : Một {{domxref("NDEFRecord")}} rỗng.
        - `"mime"`
          - : Một [MIME type](/en-US/docs/Web/HTTP/Guides/MIME_types) hợp lệ.
        - `"smart-poster"`
          - : Smart poster được định nghĩa bởi thông số kỹ thuật [NDEF-SMARTPOSTER](https://w3c.github.io/web-nfc/#bib-ndef-smartposter).
        - `"text"`
          - : Văn bản được định nghĩa bởi thông số kỹ thuật [NDEF-TEXT](https://w3c.github.io/web-nfc/#bib-ndef-text).
        - `"unknown"`
          - : Loại bản ghi không được biết.
        - `"URL"`
          - : URL được định nghĩa bởi thông số kỹ thuật [NDEF-URI](https://w3c.github.io/web-nfc/#bib-ndef-uri).

- `options` {{optional_inline}}
  - : Một đối tượng với các thuộc tính sau:
    - `overwrite`
      - : Giá trị boolean chỉ định có hay không ghi đè các bản ghi hiện có nếu chúng tồn tại.
    - `signal` {{optional_inline}}
      - : Một {{DOMxRef("AbortSignal")}} cho phép hủy thao tác ghi hiện tại.

### Giá trị trả về

Một {{JSxRef("Promise")}} giải quyết khi thông điệp đã được ghi vào thẻ hoặc bị từ chối nếu gặp lỗi phần cứng hoặc quyền.

### Ngoại lệ

Phương thức này không ném ngoại lệ; thay vào đó, nó từ chối promise được trả về, truyền {{domxref("DOMException")}} có `name` là một trong những giá trị sau:

- `AbortError`
  - : Thao tác scan bị hủy với {{DOMxRef("AbortSignal")}} được truyền trong đối số `options`.
- `NotAllowedError`
  - : Quyền cho thao tác này bị từ chối hoặc `overwrite` là `false` và đã có bản ghi trên thẻ.
- `NotSupportedError`
  - : Không có bộ điều hợp NFC tương thích với Web NFC, hoặc bộ điều hợp NFC có sẵn không hỗ trợ đẩy thông điệp, hoặc không thể thiết lập kết nối.
- `NotReadableError`
  - : UA không được phép truy cập bộ điều hợp NFC bên dưới (ví dụ do tùy chọn người dùng).
- `NetworkError`
  - : Việc truyền thất bại sau khi đã bắt đầu (ví dụ thẻ bị xóa khỏi reader).

## Ví dụ

### Ghi một chuỗi văn bản

Ví dụ dưới đây cho thấy cách ghi chuỗi vào thẻ NFC và xử lý bất kỳ lỗi nào xảy ra.

```js
const ndef = new NDEFReader();
ndef
  .write("Hello World")
  .then(() => {
    console.log("Message written.");
  })
  .catch((error) => {
    console.log(`Write failed :-( try again: ${error}.`);
  });
```

### Ghi URL

Ví dụ dưới đây cho thấy cách ghi đối tượng bản ghi (mô tả ở trên) vào thẻ NFC và xử lý bất kỳ lỗi nào xảy ra.

```js
const ndef = new NDEFReader();
try {
  await ndef.write({
    records: [{ recordType: "url", data: "http://example.com/" }],
  });
} catch {
  console.log("Write failed :-( try again.");
}
```

### Lên lịch ghi với timeout

Đôi khi hữu ích khi đặt giới hạn thời gian cho thao tác ghi. Ví dụ bạn yêu cầu người dùng chạm thẻ nhưng không tìm thấy thẻ nào trong một khoảng thời gian nhất định, thì bạn hết thời gian.

```js
const ndef = new NDEFReader();
ndef.onreading = (event) => console.log("We read a tag!");

function write(data, { timeout } = {}) {
  return new Promise((resolve, reject) => {
    const controller = new AbortController();
    controller.signal.onabort = () =>
      reject(new Error("Time is up, bailing out!"));
    setTimeout(() => controller.abort(), timeout);

    ndef.addEventListener(
      "reading",
      (event) => {
        ndef.write(data, { signal: controller.signal }).then(resolve, reject);
      },
      { once: true },
    );
  });
}

await ndef.scan();
try {
  // Let's wait for 5 seconds only.
  await write("Hello World", { timeout: 5_000 });
} catch (err) {
  console.error("Something went wrong", err);
} finally {
  console.log("We wrote to a tag!");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
