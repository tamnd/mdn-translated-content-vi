---
title: "Notification: thuộc tính data"
short-title: data
slug: Web/API/Notification/data
page-type: web-api-instance-property
browser-compat: api.Notification.data
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`data`** của giao diện {{domxref("Notification")}} trả về một bản sao cấu trúc của dữ liệu thông báo, như được chỉ định trong tùy chọn `data` của constructor {{domxref("Notification.Notification","Notification()")}}.

Dữ liệu của thông báo có thể là bất kỳ dữ liệu tùy ý nào mà bạn muốn gắn với thông báo.

## Giá trị

Một bản sao cấu trúc.

## Ví dụ

Đoạn mã sau phát một thông báo; một object `options` đơn giản được tạo rồi thông báo được phát bằng constructor `Notification()`.

```js
const options = {
  body: "Your code submission has received 3 new review comments.",
  data: {
    url: "https://example.com/review/12345",
    status: "open",
  },
};

const n = new Notification("New review activity", options);

console.log(n.data); // Ghi ra object dữ liệu
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
