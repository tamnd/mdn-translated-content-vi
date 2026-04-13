---
title: "SourceBuffer: phương thứcappendBufferAsync()"
short-title: appendBufferAsync()
slug: Web/API/SourceBuffer/appendBufferAsync
page-type: web-api-instance-method
status:
  - experimental
  - non-standard
browser-compat: api.SourceBuffer.appendBufferAsync
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{Non-standard_Header}}{{SeeCompatTable}}

Phương thức **`appendBufferAsync()`**
của giao diện {{domxref("SourceBuffer")}} bắt đầu quá trình xử lý không đồng bộ
nối thêm dữ liệu phân đoạn phương tiện từ {{jsxref("ArrayBuffer")}},
một đối tượng {{jsxref("TypedArray")}} hoặc một {{jsxref("DataView")}} đối với đối tượng `SourceBuffer`.
Nó trả về {{jsxref("Promise")}} được đáp ứng sau khi bộ đệm được thêm vào.


## Cú pháp

```js-nolint
appendBufferAsync(source)
```


### Thông số

- `source`

  - : Đối tượng {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} chứa dữ liệu phân đoạn phương tiện bạn muốn thêm vào `SourceBuffer`.

### Giá trị trả về


Một {{jsxref("Promise")}} được đáp ứng khi bộ đệm được thêm thành công vào đối tượng `SourceBuffer`,
hoặc `null` nếu không thể bắt đầu yêu cầu.

## Ví dụ

Hàm async ví dụ đơn giản này, `fillSourceBuffer()`, lấy làm đầu vào
tham số `buffer`, {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} và a
Đối tượng `SourceBuffer` để nối thêm phương tiện nguồn từ bộ đệm vào.

```js
async function fillSourceBuffer(buffer, msBuffer) {
  try {
    while (true) {
      await msBuffer.appendBufferAsync(buffer);
    }
  } catch (e) {
    handleException(e);

  }
}
```


## Thông số kỹ thuật


Tính năng này không phải là một phần của bất kỳ thông số kỹ thuật nào. Nó không đi đúng hướng để trở thành một tiêu chuẩn.

## Khả năng tương thích của trình duyệt


{{Compat}}

## Xem thêm

- [API tiện ích mở rộng nguồn phương tiện](/en-US/docs/Web/API/Media_Source_Extensions_API)
- {{domxref("SourceBuffer.appendBuffer()")}}
- {{domxref("MediaSource")}}
- {{domxref("SourceBufferList")}}
