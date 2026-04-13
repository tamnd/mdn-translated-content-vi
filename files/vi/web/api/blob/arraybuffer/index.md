---
title: "Blob: phương thức arrayBuffer()"
short-title: arrayBuffer()
slug: Web/API/Blob/arrayBuffer
page-type: web-api-instance-method
browser-compat: api.Blob.arrayBuffer
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Phương thức **`arrayBuffer()`** của giao diện {{domxref("Blob")}} trả về một {{jsxref("Promise")}} được resolve với nội dung của blob dưới dạng dữ liệu nhị phân chứa trong một {{jsxref("ArrayBuffer")}}.

## Cú pháp

```js-nolint
arrayBuffer()
```

### Tham số

Không có.

### Giá trị trả về

Một promise được resolve với một {{jsxref("ArrayBuffer")}} chứa dữ liệu của blob ở dạng nhị phân.

### Ngoại lệ

Mặc dù phương thức này không ném ngoại lệ, promise trả về có thể bị reject. Ví dụ, điều này có thể xảy ra nếu bộ đọc dùng để lấy dữ liệu blob ném ra một ngoại lệ. Mọi ngoại lệ phát sinh trong khi lấy dữ liệu sẽ được chuyển thành trạng thái reject.

## Lưu ý sử dụng

Tương tự phương thức {{domxref("FileReader.readAsArrayBuffer()")}}, `arrayBuffer()` trả về promise thay vì là một API dựa trên sự kiện như phương thức tương ứng của giao diện `FileReader`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Response.arrayBuffer()")}}
- [Streams API](/en-US/docs/Web/API/Streams_API)
- {{domxref("FileReader.readAsArrayBuffer()")}}
