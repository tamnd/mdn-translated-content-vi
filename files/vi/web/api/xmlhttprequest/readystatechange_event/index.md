---
title: "XMLHttpRequest: sự kiện readystatechange"
short-title: readystatechange
slug: Web/API/XMLHttpRequest/readystatechange_event
page-type: web-api-event
browser-compat: api.XMLHttpRequest.readystatechange_event
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Sự kiện `readystatechange` được kích hoạt bất cứ khi nào thuộc tính {{domxref("XMLHttpRequest.readyState", "readyState")}} của {{domxref("XMLHttpRequest")}} thay đổi.

> [!WARNING]
> Không nên sử dụng sự kiện này với các yêu cầu đồng bộ và không được sử dụng từ mã native.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("readystatechange", (event) => { })

onreadystatechange = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung không có thuộc tính bổ sung.

## Ví dụ

```js
const xhr = new XMLHttpRequest();
const method = "GET";
const url = "https://developer.mozilla.org/";

xhr.open(method, url, true);
xhr.onreadystatechange = () => {
  // Trong các tệp cục bộ, trạng thái là 0 khi thành công trong Mozilla Firefox
  if (xhr.readyState === XMLHttpRequest.DONE) {
    const status = xhr.status;
    if (status === 0 || (status >= 200 && status < 400)) {
      // Yêu cầu đã hoàn tất thành công
      console.log(xhr.responseText);
    } else {
      // Ồ không! Đã có lỗi xảy ra với yêu cầu!
    }
  }
};
xhr.send();
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
