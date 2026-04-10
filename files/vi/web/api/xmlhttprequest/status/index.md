---
title: "XMLHttpRequest: thuộc tính status"
short-title: status
slug: Web/API/XMLHttpRequest/status
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.status
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính chỉ đọc **`XMLHttpRequest.status`** trả về [mã trạng thái](/en-US/docs/Web/HTTP/Reference/Status) HTTP dạng số của phản hồi `XMLHttpRequest`.

Trước khi yêu cầu hoàn tất, giá trị của `status` là 0. Các trình duyệt cũng báo cáo trạng thái là 0 trong trường hợp có lỗi `XMLHttpRequest`.

## Giá trị

Một số.

## Ví dụ

```js
const xhr = new XMLHttpRequest();
console.log("UNSENT: ", xhr.status);

xhr.open("GET", "/server");
console.log("OPENED: ", xhr.status);

xhr.onprogress = () => {
  console.log("LOADING: ", xhr.status);
};

xhr.onload = () => {
  console.log("DONE: ", xhr.status);
};

xhr.send();

/**
 * Xuất ra như sau:
 *
 * UNSENT: 0
 * OPENED: 0
 * LOADING: 200
 * DONE: 200
 */
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Danh sách [mã trạng thái HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [HTTP](/en-US/docs/Web/HTTP)
