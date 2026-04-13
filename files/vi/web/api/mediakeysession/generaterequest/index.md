---
title: "MediaKeySession: phương thức generateRequest()"
short-title: generateRequest()
slug: Web/API/MediaKeySession/generateRequest
page-type: web-api-instance-method
browser-compat: api.MediaKeySession.generateRequest
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Phương thức `generateRequest()` của giao diện {{domxref('MediaKeySession')}} trả về một {{jsxref('Promise')}} sau khi tạo yêu cầu giấy phép dựa trên dữ liệu khởi tạo.

## Cú pháp

```js-nolint
generateRequest(initDataType, initData)
```

### Tham số

- `initDataType`
  - : Một chuỗi chỉ định định dạng của tham số `initData`. Phải là một trong các giá trị sau:
    - `"cenc"`: Tham số `initData` sử dụng định dạng [`"cenc"`](https://w3c.github.io/encrypted-media/format-registry/initdata/cenc.html).
    - `"keyids"`: Tham số `initData` sử dụng định dạng [`"keyids"`](https://w3c.github.io/encrypted-media/format-registry/initdata/keyids.html).
    - `"webm"`: Tham số `initData` sử dụng định dạng [`"webm"`](https://w3c.github.io/encrypted-media/format-registry/initdata/webm.html).
- `initData`
  - : Dữ liệu khởi tạo cho yêu cầu, theo định dạng được chỉ định bởi `initDataType`. Đây là thực thể của một trong các kiểu sau:
    - {{jsxref("ArrayBuffer")}}
    - {{jsxref("DataView")}}
    - {{jsxref("TypedArray")}}

### Giá trị trả về

Một {{jsxref('Promise')}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `initDataType` là chuỗi rỗng, nếu `initData` là mảng rỗng, hoặc nếu `initData` được cung cấp không hợp lệ theo `initDataType` được chỉ định.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu việc triển khai Hệ thống Khóa liên quan đến đối tượng `MediaKeySession` không hỗ trợ `initDataType` được cung cấp, nếu dữ liệu khởi tạo đã được làm sạch là rỗng, hoặc nếu dữ liệu khởi tạo đã được làm sạch không được module giải mã nội dung (CDM) hỗ trợ.
- {{domxref("QuotaExceededError")}}
  - : Được ném ra nếu hoạt động thất bại do thiếu tài nguyên trên user agent hoặc CDM.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu đối tượng `MediaKeySession` đang ở trạng thái `closing` hoặc `closed`, hoặc nếu nó đã được khởi tạo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
